-- Combine values for multi value properties in FileMetadata table
DO $$

    BEGIN

        -- Process FoiExemptionCode property
        WITH
        multi_foi_exemption_codes AS (SELECT "FileId"
                                      FROM "FileMetadata"
                                      WHERE "PropertyName" = 'FoiExemptionCode'
                                      GROUP BY "FileId"
                                      HAVING COUNT(*) > 1),

        -- Combine the FoiExemptionCode values
        combine_foi_exemption_codes AS (SELECT "FileId",
                                               "UserId",
                                               STRING_AGG("Value", ';' ORDER BY "Value") AS combined_value,
                                               MAX("Datetime")                           AS latest_datetime
                                        FROM "FileMetadata"
                                        WHERE "PropertyName" = 'FoiExemptionCode'
                                          AND "FileId" IN (SELECT "FileId" FROM multi_foi_exemption_codes)
                                        GROUP BY "FileId", "UserId"),

        -- Delete the old FoiExemptionCode rows
        deleted_foi_exemption_codes AS (
            DELETE FROM "FileMetadata"
                WHERE "PropertyName" = 'FoiExemptionCode'
                    AND "FileId" IN (SELECT "FileId" FROM multi_foi_exemption_codes)
                RETURNING "FileId")

        -- Insert new FoiExemptionCode rows with combined values
                INSERT
                INTO "FileMetadata" ("MetadataId", "FileId", "Value", "Datetime", "UserId", "PropertyName")
                SELECT uuid_generate_v4(),
                       codes."FileId",
                       codes.combined_value,
                       codes.latest_datetime,
                       codes."UserId",
                       'FoiExemptionCode'
                FROM combine_foi_exemption_codes codes;

        -- Process Language property
        WITH
        -- Get FileIds with multiple Language properties
        multi_languages AS (SELECT "FileId"
                            FROM "FileMetadata"
                            WHERE "PropertyName" = 'Language'
                            GROUP BY "FileId"
                            HAVING COUNT(*) > 1),

        -- Combine the Language values for these files
        combine_languages AS (SELECT "FileId",
                                     "UserId",
                                     STRING_AGG("Value", ';' ORDER BY "Value") AS combined_value,
                                     MAX("Datetime")                           AS latest_datetime
                              FROM "FileMetadata"
                              WHERE "PropertyName" = 'Language'
                                AND "FileId" IN (SELECT "FileId" FROM multi_languages)
                              GROUP BY "FileId", "UserId"),

        -- Delete the old Language rows
        deleted_languages AS (
            DELETE FROM "FileMetadata"
                WHERE "PropertyName" = 'Language'
                    AND "FileId" IN (SELECT "FileId" FROM multi_languages)
                RETURNING "FileId")

        -- Insert new Language rows with combined values
                INSERT
                INTO "FileMetadata" ("MetadataId", "FileId", "Value", "Datetime", "UserId", "PropertyName")
                SELECT uuid_generate_v4(),
                       cl."FileId",
                       cl.combined_value,
                       cl.latest_datetime,
                       cl."UserId",
                       'Language'
                FROM combine_languages cl;

    END $$;

--commit changes
COMMIT;
