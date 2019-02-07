-- Hjelpetabell "Contact" og tilhørende link mangler!
-- Mangler felt i hovedtabell "alias"

CREATE TABLE Organization
(
	id uniqueidentifier NOT NULL PRIMARY KEY,
	active bit,
	[name] nvarchar(255),
	partOf_Reference uniqueidentifier FOREIGN KEY REFERENCES Reference(id),
	-- type
	-- alias
	-- telecom
	-- address
	-- endpoint
);

CREATE TABLE OrganizationType
(
	id_Organization uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Organization(id),
	id_CodableConcept uniqueidentifier NOT NULL FOREIGN KEY REFERENCES CodeableConcept(id),
	CONSTRAINT PK_OrganizationType PRIMARY KEY (id_Organization, id_CodableConcept)
);

CREATE TABLE OrganizationTelecom
(
	id_Organization uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Organization(id),
	id_ContactPoint uniqueidentifier NOT NULL FOREIGN KEY REFERENCES ContactPoint(id),
	CONSTRAINT PK_OrganizationTelecom PRIMARY KEY (id_Organization, id_ContactPoint)
);

CREATE TABLE OrganizationAddress
(
	id_Organization uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Organization(id),
	id_Address uniqueidentifier NOT NULL FOREIGN KEY REFERENCES [Address](id),
	CONSTRAINT PK_OrganizationAddress PRIMARY KEY (id_Organization, id_Address)
);

CREATE TABLE OrganizationEndpoint
(
	id_Organization uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Organization(id),
	id_Endpoint uniqueidentifier NOT NULL FOREIGN KEY REFERENCES [Endpoint](id),
	CONSTRAINT PK_OrganizationEndpoint PRIMARY KEY (id_Organization, id_Endpoint)
);