-- Insert ClientSideFileLastModifiedDate, ClientSideOriginalFilepath & UUID into the DisplayProperties table

INSERT INTO "DisplayProperties" ("PropertyName", "Attribute", "Value", "AttributeType")
VALUES
    ('ClientSideFileLastModifiedDate', 'Name', 'Date last modified', 'text'),
    ('ClientSideFileLastModifiedDate', 'Description', 'Date last modified extracted from client side', 'text'),
    ('ClientSideFileLastModifiedDate', 'PropertyType', 'System', 'text'),
    ('ClientSideFileLastModifiedDate', 'Active', false, 'boolean'),
    ('ClientSideFileLastModifiedDate', 'Datatype', 'datetime', 'text'),
    ('ClientSideFileLastModifiedDate', 'Editable', false, 'boolean'),
    ('ClientSideFileLastModifiedDate', 'MultiValue', false, 'boolean'),
    ('ClientSideFileLastModifiedDate', 'Required', true, 'boolean'),
    ('ClientSideOriginalFilepath', 'Name', 'Filepath', 'text'),
    ('ClientSideOriginalFilepath', 'Description', 'Filepath of the record extracted from client side', 'text'),
    ('ClientSideOriginalFilepath', 'PropertyType', 'System', 'text'),
    ('ClientSideOriginalFilepath', 'Active', false, 'boolean'),
    ('ClientSideOriginalFilepath', 'Datatype', 'text', 'text'),
    ('ClientSideOriginalFilepath', 'Editable', false, 'boolean'),
    ('ClientSideOriginalFilepath', 'MultiValue', false, 'boolean'),
    ('ClientSideOriginalFilepath', 'Required', true, 'boolean'),
    ('UUID', 'Name', 'UUID', 'text'),
    ('UUID', 'Description', 'FiledID value for the record', 'text'),
    ('UUID', 'PropertyType', 'System', 'text'),
    ('UUID', 'Active', false, 'boolean'),
    ('UUID', 'Datatype', 'text', 'text'),
    ('UUID', 'Editable', false, 'boolean'),
    ('UUID', 'MultiValue', false, 'boolean'),
    ('UUID', 'Required', true, 'boolean');

COMMIT;
