CREATE TABLE EpisodeOfCare
(
	id uniqueidentifier NOT NULL PRIMARY KEY,
	[status] nvarchar(255),
	patient_Reference uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Reference(id),
	managingOrganization_Reference uniqueidentifier FOREIGN KEY REFERENCES Reference(id),
	periodStart datetime,
	periodEnd datetime,
	careManager_Reference uniqueidentifier FOREIGN KEY REFERENCES Reference(id),
)

CREATE TABLE EpisodeOfCareType
(
	id_EpisodeOfCare uniqueidentifier NOT NULL FOREIGN KEY REFERENCES EpisodeOfCare(id),
	id_CodeableConcept uniqueidentifier NOT NULL FOREIGN KEY REFERENCES CodeableConcept(id),
	CONSTRAINT PK_EpisodeOfCareType PRIMARY KEY (id_EpisodeOfCare, id_CodeableConcept),
)

CREATE TABLE EpisodeOfCareReferralRequest
(
	id_EpisodeOfCare uniqueidentifier NOT NULL FOREIGN KEY REFERENCES EpisodeOfCare(id),
	id_Reference uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Reference(id),
	CONSTRAINT PK_EpisodeOfCareReferralRequest PRIMARY KEY (id_EpisodeOfCare, id_Reference),
)

CREATE TABLE EpisodeOfCareTeam
(
	id_EpisodeOfCare uniqueidentifier NOT NULL FOREIGN KEY REFERENCES EpisodeOfCare(id),
	id_Reference uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Reference(id),
	CONSTRAINT PK_EpisodeOfCareTeam PRIMARY KEY (id_EpisodeOfCare, id_Reference),
)

CREATE TABLE EpisodeOfCareAccount
(
	id_EpisodeOfCare uniqueidentifier NOT NULL FOREIGN KEY REFERENCES EpisodeOfCare(id),
	id_Reference uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Reference(id),
	CONSTRAINT PK_EpisodeOfCareAccount PRIMARY KEY (id_EpisodeOfCare, id_Reference),
)

-- Hjelpetabeller og tilhørende relasjoner

CREATE TABLE EpisodeOfCareStatusHistory_HT
(
	id uniqueidentifier NOT NULL PRIMARY KEY,
	[status] nvarchar(255),
	periodStart datetime,
	periodEnd datetime,
)

CREATE TABLE EpisodeOfCareStatusHistory
(
	id_EpisodeOfCare uniqueidentifier NOT NULL FOREIGN KEY REFERENCES EpisodeOfCare(id),
	id_EpisodeOfCareStatusHistory_HT uniqueidentifier NOT NULL FOREIGN KEY REFERENCES EpisodeOfCareStatusHistory_HT(id),
	CONSTRAINT PK_EpisodeOfCareStatusHistory PRIMARY KEY (id_EpisodeOfCare, id_EpisodeOfCareStatusHistory_HT),
)

CREATE TABLE EpisodeOfCareDiagnosis_HT
(
	id uniqueidentifier NOT NULL PRIMARY KEY,
	condition_Reference uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Reference(id),
	role_CodeableConcept uniqueidentifier NOT NULL FOREIGN KEY REFERENCES CodeableConcept(id),
	[rank] int CHECK ([rank] >= 1),
)

CREATE TABLE EpisodeOfCareDiagnosis
(
	id_EpisodeOfCare uniqueidentifier NOT NULL FOREIGN KEY REFERENCES EpisodeOfCare(id),
	id_EpisodeOfCareDiagnosis_HT uniqueidentifier NOT NULL FOREIGN KEY REFERENCES EpisodeOfCareDiagnosis_HT(id),
	CONSTRAINT PK_EpisodeOfCareDiagnosis PRIMARY KEY (id_EpisodeOfCare, id_EpisodeOfCareDiagnosis_HT),
)