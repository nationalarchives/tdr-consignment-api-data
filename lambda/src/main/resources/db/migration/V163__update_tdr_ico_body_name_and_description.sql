-- Update the name and description of the Information Commissioner's Office to include tha apostrophe
UPDATE "Body"
SET "Name" = 'Information Commissioner''s Office', "Description" = 'Information Commissioner''s Office'
WHERE "TdrCode" = 'TDR-ICO';
