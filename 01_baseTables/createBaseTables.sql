CREATE TABLE CodeableConcept
(
	id uniqueidentifier NOT NULL PRIMARY KEY,
	[text] nvarchar(255)
);

CREATE TABLE Coding
(
	id uniqueidentifier NOT NULL PRIMARY KEY,
	codeableConceptId_CodeableConcept uniqueidentifier NOT NULL FOREIGN KEY REFERENCES CodeableConcept(id),
	[version] nvarchar(255),
	[system] nvarchar(255),
	code nvarchar(255),
	display nvarchar(255),
	userSelected bit
);

CREATE TABLE Reference
(
	id uniqueidentifier NOT NULL PRIMARY KEY,
	reference nvarchar(255),
	[type] nvarchar(255),
	display nvarchar(255)
);

CREATE TABLE Identifier
(
	id uniqueidentifier NOT NULL PRIMARY KEY,
	[type] nvarchar(255),
	[system] nvarchar(255),
	[value] nvarchar(255),
	periodStart datetime,
	periodEnd datetime,
	assigner_reference uniqueidentifier
);

CREATE TABLE Canonical
(
	id uniqueidentifier NOT NULL PRIMARY KEY,
	canonical nvarchar(255)
);

CREATE TABLE Uri
(
	id uniqueidentifier NOT NULL PRIMARY KEY,
	uri nvarchar(255)
);

CREATE TABLE Annotation
(
	id uniqueidentifier NOT NULL PRIMARY KEY,
	[time] datetime,
	[text] nvarchar(255) NOT NULL
);

CREATE TABLE Attachment
(
	id uniqueidentifier NOT NULL PRIMARY KEY,
	contentType nvarchar(255),
	[language] nvarchar(255),
	[data] binary(255),
	[url] nvarchar(255),
	[hash] binary(255),
	title nvarchar(255),
	creation datetime
);

CREATE TABLE HumanName
(
	id uniqueidentifier NOT NULL PRIMARY KEY,
	[text] nvarchar(255),
	family nvarchar(255),
	given nvarchar(255),
	prefix nvarchar(255),
	suffix nvarchar(255),
	periodStart datetime,
	periodEnd datetime
);

CREATE TABLE ContactPoint
(
	id uniqueidentifier NOT NULL PRIMARY KEY,
	[system] nvarchar(255),
	[value] nvarchar(255),
	[use] nvarchar(255),
	-- Ikke med i master
	[rank] int,
	-- Kun positive intergers (ikke tatt hoyde for i master)
	periodStart datetime,
	periodEnd datetime
);

CREATE TABLE [Address]
(
	id uniqueidentifier NOT NULL PRIMARY KEY,
	[type] nvarchar(255),
	[text] nvarchar(255),
	[line] nvarchar(255),
	city nvarchar(255),
	district nvarchar(255),
	[state] nvarchar(255),
	postalCode nvarchar(255),
	country nvarchar(255),
	periodStart datetime,
	periodEnd datetime
);

CREATE TABLE Quantity
(
	id uniqueidentifier NOT NULL PRIMARY KEY,
	[value] FLOAT,
	comparator nvarchar(255),
	unit nvarchar(255),
	[system] nvarchar(255),
	[code] nvarchar(255)
);

CREATE TABLE Ratio
(
	id uniqueidentifier NOT NULL PRIMARY KEY,
	numerator uniqueidentifier FOREIGN KEY REFERENCES Quantity(id),
	denominator uniqueidentifier FOREIGN KEY REFERENCES Quantity(id),
)

CREATE TABLE Dosage
(
	id UNIQUEIDENTIFIER NOT NULL PRIMARY KEY,
	[sequence] int,
	[text] nvarchar(255),
	patientInstruction nvarchar(255),
	-- timing: Timing[0..1], Timing does not exists
	-- asNeeded[x]: Type[0..1]
	site_CodeableConcept uniqueidentifier FOREIGN KEY REFERENCES CodeableConcept(id),
	route_CodeableConcept uniqueidentifier FOREIGN KEY REFERENCES CodeableConcept(id),
	method_CodeableConcept uniqueidentifier FOREIGN KEY REFERENCES CodeableConcept(id),
	maxDosePerPeriod_Ratio uniqueidentifier FOREIGN KEY REFERENCES Ratio(id),
	maxDosePerAdministration_Quantity uniqueidentifier FOREIGN KEY REFERENCES Quantity(id),
	maxDosePerLifetime_Quantity uniqueidentifier FOREIGN KEY REFERENCES Quantity(id),
	-- additionalInstruction
	-- doseAndRate
);

CREATE TABLE DosageAdditionalInstruction
(
	id_Dosage uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Dosage(id),
	id_CodeableConcept uniqueidentifier NOT NULL FOREIGN KEY REFERENCES CodeableConcept(id)
		CONSTRAINT PK_DosageAdditionalInstruction PRIMARY KEY (id_Dosage, id_CodeableConcept)
);

CREATE TABLE DosageDoseAndRate_HT
(
	id UNIQUEIDENTIFIER NOT NULL PRIMARY KEY,
	type_CodeableConcept UNIQUEIDENTIFIER FOREIGN KEY REFERENCES CodeableConcept(id),
	-- dose[x]: Type[0..1] 
	-- rate[x]: Type[0..1] 
);

CREATE TABLE DosageDoseAndRate
(
	id_Dosage uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Dosage(id),
	id_DosageDoseAndRate_HT uniqueidentifier NOT NULL FOREIGN KEY REFERENCES DosageDoseAndRate_HT(id)
		CONSTRAINT PK_DosageDoseAndRate PRIMARY KEY (id_Dosage, id_DosageDoseAndRate_HT)
);

CREATE TABLE [Money]
(
	id UNIQUEIDENTIFIER NOT NULL PRIMARY KEY,
	[value] real,
	currency nvarchar(255)
);




-- Referert til i ressursen "Organization", som en Reference[0..*] til Endpoint, tror ikke dette da blir en basetabell.
CREATE TABLE [Endpoint]
(
	id uniqueidentifier NOT NULL PRIMARY KEY,
	[status] nvarchar(255),
	[name] nvarchar(255)
);

-- Referert til i ressursen "DiagnosticReport" som en Reference[1..1] til Media, tror ikke dette da blir en basetabell.
CREATE TABLE Media
(
	id uniqueidentifier NOT NULL PRIMARY KEY,
	comment nvarchar(255),
	link_Reference uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Reference(id)
);
