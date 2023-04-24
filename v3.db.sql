CREATE TABLE [etudiants] (
  [matricule] integer PRIMARY KEY,
  [prenom] nvarchar(255),
  [nom] nvarchar(255),
  [email] nvarchar(255),
  [natel] nvarchar(255)
)
GO

CREATE TABLE [professeurs] (
  [id_prof] integer PRIMARY KEY,
  [bureau] integer,
  [prenom] nvarchar(255),
  [nom] nvarchar(255),
  [email] nvarchar(255)
)
GO

CREATE TABLE [cours] (
  [id_cours] integer PRIMARY KEY,
  [id_prof] integer,
  [id_assistant] integer,
  [nom] nvarchar(255)
)
GO

CREATE TABLE [inscriptions] (
  [id_inscription] integer PRIMARY KEY,
  [matricule] integer,
  [id_cours] integer
)
GO

CREATE TABLE [evaluations] (
  [id_inscription] integer,
  [note] integer,
  [poids] integer,
  [date] nvarchar(255)
)
GO

CREATE TABLE [assistants] (
  [id_assistant] integer PRIMARY KEY,
  [bureau] integer
)
GO

CREATE TABLE [assistants_cours] (
  [id_assistant] integer,
  [id_cours] integer
)
GO

ALTER TABLE [inscriptions] ADD FOREIGN KEY ([matricule]) REFERENCES [etudiants] ([matricule])
GO

ALTER TABLE [inscriptions] ADD FOREIGN KEY ([id_cours]) REFERENCES [cours] ([id_cours])
GO

ALTER TABLE [cours] ADD FOREIGN KEY ([id_prof]) REFERENCES [professeurs] ([id_prof])
GO

ALTER TABLE [evaluations] ADD FOREIGN KEY ([id_inscription]) REFERENCES [inscriptions] ([id_inscription])
GO

ALTER TABLE [etudiants] ADD FOREIGN KEY ([matricule]) REFERENCES [assistants] ([id_assistant])
GO

ALTER TABLE [assistants_cours] ADD FOREIGN KEY ([id_assistant]) REFERENCES [assistants] ([id_assistant])
GO

ALTER TABLE [assistants_cours] ADD FOREIGN KEY ([id_cours]) REFERENCES [cours] ([id_cours])
GO
