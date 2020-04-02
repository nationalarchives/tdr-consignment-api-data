CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
INSERT INTO consignmentapi."Body" ("BodyId", "Name", "Code", "Description") VALUES
  ('64efba68-e1e4-4aa3-8599-8b2e05b9134b', 'MOCK1 Department', 'MOCK1', 'This is a mock body'),
  ('49d24d9d-e4c2-4871-9c1a-5b00c9512174', 'MOCK2 Department', 'MOCK2', 'This is a mock body'),
  ('256090c9-420b-4846-95e1-ed5bbd60043b', 'MOCK3 Department', 'MOCK3', 'This is a mock body');