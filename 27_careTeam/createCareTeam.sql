
CREATE TABLE CareTeam
(
	id uniqueidentifier NOT NULL PRIMARY KEY,
	[status] nvarchar(255),
	name nvarchar(255),
	period date,
	subject_Reference uniqueidentifier FOREIGN KEY REFERENCES Reference(id),
	encounter_Reference uniqueidentifier FOREIGN KEY REFERENCES Reference(id),
	-- category
	-- reasonCode
	-- reasonReference
	-- managingOrganization
	-- telecom
	-- note
);

CREATE TABLE CareTeamCategory
(
	id_CareTeam uniqueidentifier NOT NULL FOREIGN KEY REFERENCES CareTeam(id),
	id_CodeableConcept uniqueidentifier NOT NULL FOREIGN KEY REFERENCES CodeableConcept(id),
	CONSTRAINT PK_CareTeamCategory PRIMARY KEY (id_CareTeam, id_CodeableConcept)
);

CREATE TABLE CareTeamReasonCode
(
	id_CareTeam uniqueidentifier NOT NULL FOREIGN KEY REFERENCES CareTeam(id),
	id_CodableConcept uniqueidentifier NOT NULL FOREIGN KEY REFERENCES CodeableConcept(id),
	CONSTRAINT PK_CareTeamReasonCode PRIMARY KEY (id_CareTeam, id_CodableConcept)
);

CREATE TABLE CareTeamReasonReference
(
	id_CareTeam uniqueidentifier NOT NULL FOREIGN KEY REFERENCES CareTeam(id),
	id_Reference uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Reference(id),
	CONSTRAINT PK_CareTeamReasonReference PRIMARY KEY (id_CareTeam, id_Reference)
);

CREATE TABLE CareTeamManagingOrganization
(
	id_CareTeam uniqueidentifier NOT NULL FOREIGN KEY REFERENCES CareTeam(id),
	id_Reference uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Reference(id),
	CONSTRAINT PK_CareTeamManagingOrganization PRIMARY KEY (id_CareTeam, id_Reference)
);

CREATE TABLE CareTeamTelecom
(
	id_CareTeam uniqueidentifier NOT NULL FOREIGN KEY REFERENCES CareTeam(id),
	id_ContactPoint uniqueidentifier NOT NULL FOREIGN KEY REFERENCES ContactPoint(id),
	CONSTRAINT PK_CareTeamTelecom PRIMARY KEY (id_CareTeam, id_ContactPoint)
)

CREATE TABLE CareTeamNote
(
	id_CareTeam uniqueidentifier NOT NULL FOREIGN KEY REFERENCES CareTeam(id),
	id_Annotation uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Annotation(id),
	CONSTRAINT PK_CareTeamNote PRIMARY KEY (id_CareTeam, id_Annotation)
);

-- Hjelpetabeller og tilhørende relasjoner

CREATE TABLE CareTeamParticipant_HT
(
	id uniqueidentifier NOT NULL PRIMARY KEY,
	member_Reference uniqueidentifier FOREIGN KEY REFERENCES Reference(id),
	onBehalfOf_Reference uniqueidentifier FOREIGN KEY REFERENCES Reference(id),
	[period] date
	-- role
);

CREATE TABLE CareTeamParticipant_HTRole
(
	id_CareTeamParticipant_HT uniqueidentifier NOT NULL FOREIGN KEY REFERENCES CareTeamParticipant_HT(id),
	id_CodeableConcept uniqueidentifier NOT NULL FOREIGN KEY REFERENCES CodeableConcept(id),
	CONSTRAINT PK_CareTeamParticipant_HTRole PRIMARY KEY (id_CareTeamParticipant_HT, id_CodeableConcept)
);

CREATE TABLE CareTeamParticipant
(
	id_CareTeam uniqueidentifier NOT NULL FOREIGN KEY REFERENCES CareTeam(id),
	id_CareTeamParticipant_HT uniqueidentifier NOT NULL FOREIGN KEY REFERENCES CareTeamParticipant_HT(id)
	CONSTRAINT PK_CareTeamParticipant PRIMARY KEY(id_CareTeam, id_CareTeamParticipant_HT)
);
