-- Insert ClientSideFileLastModifiedDate & ClientSideOriginalFilepath into the DisplayProperties table

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
    ('ClientSideOriginalFilepath', 'Required', true, 'boolean');

COMMIT;
