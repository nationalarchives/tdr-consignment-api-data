DO $$
DECLARE 

  files_cursor record;

BEGIN 
  FOR files_cursor IN SELECT "File"."ConsignmentId" , "File"."UserId", array_agg( "File"."FileId") as fileids , array_agg( "FileMetadata"."Value") as paths, 
        array_agg( replace("FileMetadata"."Value" ,'/' ||RIGHT("FileMetadata"."Value",POSITION('/' IN reverse("FileMetadata"."Value"))-1), '')) as folders
 
    FROM 
    "File"
    JOIN "FileMetadata" ON "FileMetadata"."FileId" = "File"."FileId"
    WHERE 
      "File"."FileName" IS NULL AND
      "FileMetadata"."PropertyName" = 'ClientSideOriginalFilepath' 
    GROUP BY  "File"."ConsignmentId", "File"."UserId"
 
  LOOP
    DECLARE 

      unq_dir_paths TEXT [];
      dir_paths TEXT [];
      dir_uuids uuid [];
      dir_names TEXT [];
      dir_parent_uuid text [];
      file_names text [];
      file_uuids uuid [];
      file_parent_uuid uuid [];

      
    BEGIN 
      file_uuids = files_cursor."fileids" ;

      -- create folder UUIDS
      IF files_cursor."folders"[1] != '' THEN
        FOR j IN array_lower(files_cursor."folders",1)..array_upper(files_cursor."folders",1)
        LOOP
          
          IF array_position(unq_dir_paths,files_cursor."folders"[j]) IS NULL THEN
            unq_dir_paths = array_append(unq_dir_paths,files_cursor."folders"[j]);

          END IF;

        END LOOP;
      
        FOR i IN array_lower(unq_dir_paths,1)..array_upper(unq_dir_paths,1) LOOP
          DECLARE
              dir TEXT;
              dirs_split TEXT [];
            BEGIN
              dirs_split = string_to_array(unq_dir_paths[i],'/');

              FOR h IN reverse array_upper(dirs_split,1)..array_lower(dirs_split,1) 
              LOOP
                  IF array_position(dir_paths,dirs_split[h]) IS NULL THEN
                      dir_paths = array_append(dir_paths,array_to_string(dirs_split[1:h],'/'));
                      dir_names = array_append(dir_names,dirs_split[h]);
                      dir_uuids = array_append(dir_uuids,uuid_generate_v4());
                    
                  END IF;
              END LOOP;
            
            END;
        END loop;
        -- add parent uuids
        FOR u IN array_lower(dir_uuids,1)..array_upper(dir_uuids,1) LOOP
          IF u = array_upper(dir_uuids,1) THEN
            dir_parent_uuid = array_append(dir_parent_uuid,'NULL');
          ELSE
            dir_parent_uuid = array_append(dir_parent_uuid,dir_uuids[u+1]::text);
          END IF;
        END LOOP;
        -- now use the information to assign file info
        FOR j IN array_lower(files_cursor."paths",1)..array_upper(files_cursor."paths",1)
        LOOP
          DECLARE 
             files_split text [];
             file_parent_name text;
           
          BEGIN

            files_split = string_to_array(files_cursor."paths"[j],'/');
            file_names = array_append(file_names,files_split[array_upper(files_split,1)]);
            file_parent_name = array_to_string(files_split[1: array_upper(files_split,1)-1],'/');
            file_parent_uuid = array_append(file_parent_uuid,dir_uuids[array_position(dir_paths,file_parent_name)]);
          END;
        
        END LOOP;

        -- now we can insert  and update tables
      
        --first insert all folders into files 
        FOR z IN array_lower(dir_names,1)..array_upper(dir_names,1) 
        LOOP
          
          IF dir_parent_uuid[z] = 'NULL' THEN
              
             INSERT INTO "File" ("FileId", "ConsignmentId", "UserId", "Datetime", "FileType", "FileName") VALUES 
              	(dir_uuids[z],files_cursor."ConsignmentId",files_cursor."UserId",LOCALTIMESTAMP,'Folder',dir_names[z]);
          ELSE 
             
             INSERT INTO "File" ("FileId", "ConsignmentId", "UserId", "Datetime", "FileType", "FileName", "ParentId") VALUES 
              	(dir_uuids[z],files_cursor."ConsignmentId",files_cursor."UserId",LOCALTIMESTAMP,'Folder',dir_names[z],dir_parent_uuid[z]::uuid);
          
          END IF;
        
          INSERT INTO "FileMetadata" ("MetadataId", "FileId", "Value", "Datetime", "UserId", "PropertyName")
          VALUES  
          ( uuid_generate_v4() , dir_uuids[z] , dir_paths[z] , LOCALTIMESTAMP , files_cursor."UserId" , 'ClientSideOriginalFilepath'),
          ( uuid_generate_v4() , dir_uuids[z] , 'Crown Copyright', LOCALTIMESTAMP , files_cursor."UserId" , 'RightsCopyright'),
          ( uuid_generate_v4() , dir_uuids[z] , 'Public Record', LOCALTIMESTAMP , files_cursor."UserId" , 'LegalStatus'),
          ( uuid_generate_v4() , dir_uuids[z] , 'TNA', LOCALTIMESTAMP , files_cursor."UserId" , 'HeldBy'),
          ( uuid_generate_v4() , dir_uuids[z] , 'English', LOCALTIMESTAMP , files_cursor."UserId" , 'Language'),
          ( uuid_generate_v4() , dir_uuids[z] , 'open', LOCALTIMESTAMP , files_cursor."UserId" , 'FoiExemptionCode');

        END LOOP;
        -- now update the files in files
        FOR y IN array_lower(file_uuids,1)..array_upper(file_uuids,1) 
        LOOP         
          UPDATE "File" SET "ParentId" = file_parent_uuid[y], "FileName" = file_names[y], "FileType" = 'File' WHERE "FileId" = file_uuids[y] ;
        END LOOP;

      END IF;                 
    END;
    
  END LOOP;

END; $$;

COMMIT;
