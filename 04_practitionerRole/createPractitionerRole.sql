CREATE TABLE PractitionerRole
(
	id uniqueidentifier NOT NULL PRIMARY KEY,
	active bit,
	periodStart datetime,
	periodEnd datetime,
	practitioner_Reference uniqueidentifier FOREIGN KEY REFERENCES Reference(id),
	organization_Reference uniqueidentifier FOREIGN KEY REFERENCES Reference(id),
	availabilityExceptions nvarchar(255),
);

CREATE TABLE PractitionerRoleIdentifier
(
	id_PractitionerRole uniqueidentifier NOT NULL FOREIGN KEY REFERENCES PractitionerRole(id),
	id_Identifier uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Identifier(id),
	CONSTRAINT PK_PractitionerRoleIdentifier PRIMARY KEY (id_PractitionerRole, id_Identifier)
);

CREATE TABLE PractitionerRoleCode
(
	id_PractitionerRole uniqueidentifier NOT NULL FOREIGN KEY REFERENCES PractitionerRole(id),
	id_CodeableConcept uniqueidentifier NOT NULL FOREIGN KEY REFERENCES CodeableConcept(id),
	CONSTRAINT PK_PractitionerRoleCode PRIMARY KEY (id_PractitionerRole, id_CodeableConcept)
);

CREATE TABLE PractitionerRoleSpecialty
(
	id_PractitionerRole uniqueidentifier NOT NULL FOREIGN KEY REFERENCES PractitionerRole(id),
	id_CodeableConcept uniqueidentifier NOT NULL FOREIGN KEY REFERENCES CodeableConcept(id),
	CONSTRAINT PK_PractitionerRoleSpecialty PRIMARY KEY (id_PractitionerRole, id_CodeableConcept)
);

CREATE TABLE PractitionerRoleLocation
(
	id_PractitionerRole uniqueidentifier NOT NULL FOREIGN KEY REFERENCES PractitionerRole(id),
	id_Reference uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Reference(id),
	CONSTRAINT PK_PractitionerRoleLocation PRIMARY KEY (id_PractitionerRole, id_Reference)
);

CREATE TABLE PractitionerRoleHealthcareService
(
	id_PractitionerRole uniqueidentifier NOT NULL FOREIGN KEY REFERENCES PractitionerRole(id),
	id_Reference uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Reference(id),
	CONSTRAINT PK_PractitionerRoleHealthcareService PRIMARY KEY (id_PractitionerRole, id_Reference)
);

CREATE TABLE PractitionerRoleTelecom
(
	id_PractitionerRole uniqueidentifier NOT NULL FOREIGN KEY REFERENCES PractitionerRole(id),
	id_ContactPoint uniqueidentifier NOT NULL FOREIGN KEY REFERENCES ContactPoint(id),
	CONSTRAINT PK_PractitionerRoleTelecom PRIMARY KEY (id_PractitionerRole, id_ContactPoint)
);

CREATE TABLE PractitionerRoleEndpoint 
(
	id_PractitionerRole uniqueidentifier NOT NULL FOREIGN KEY REFERENCES PractitionerRole(id),
	id_Reference uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Reference(id),
	CONSTRAINT PK_PractitionerRoleEndpoint PRIMARY KEY (id_PractitionerRole, id_Reference)
);

CREATE TABLE PractitionerRoleAvailableTime_HT
(
	id uniqueidentifier NOT NULL PRIMARY KEY,
	daysOfWeek nvarchar(255),					-- av typen code(0..*), burde være kodeverk bestående av ukedager
	allDay bit,
	availableStartTime datetime,
	availableEndTime datetime
);

CREATE TABLE PractitionerRoleAvailableTime
(
	id_PractitionerRole uniqueidentifier NOT NULL FOREIGN KEY REFERENCES PractitionerRole(id),
	id_PractitionerRoleAvailableTime_HT uniqueidentifier NOT NULL FOREIGN KEY REFERENCES PractitionerRoleAvailableTime_HT(id),
	CONSTRAINT PK_PractitionerRoleAvailableTime PRIMARY KEY (id_PractitionerRole, id_PractitionerRoleAvailableTime_HT)
);

CREATE TABLE PractitionerRoleNotAvailable_HT
(
	id uniqueidentifier NOT NULL PRIMARY KEY,
	[description] nvarchar(255) NOT NULL,
	duringStart datetime,
	duringEnd datetime
);

CREATE TABLE PractitionerRoleNotAvailable
(
	id_PractitionerRole uniqueidentifier NOT NULL FOREIGN KEY REFERENCES PractitionerRole(id),
	id_PractitionerRoleNotAvailable_HT uniqueidentifier NOT NULL FOREIGN KEY REFERENCES PractitionerRoleNotAvailable_HT(id),
	CONSTRAINT PK_PractitionerRoleNotAvailable PRIMARY KEY (id_PractitionerRole, id_PractitionerRoleNotAvailable_HT)
);