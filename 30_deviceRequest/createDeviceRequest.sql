CREATE TABLE DeviceRequest
(
	id uniqueidentifier NOT NULL PRIMARY KEY,
	groupIdentifier_Identifier uniqueidentifier FOREIGN KEY REFERENCES Identifier(id),
	[status] nvarchar(255),
	intent nvarchar(255) NOT NULL,
	[priority] nvarchar(255),
	-- code[x]: Type[1..1]
	subject_Reference uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Reference(id),
	encounter_Reference uniqueidentifier FOREIGN KEY REFERENCES Reference(id),
	-- occurence[x]: Type[0..1]
	authoredOn datetime,
	requester_Reference uniqueidentifier FOREIGN KEY REFERENCES Reference(id),
	performerType_CodeableConcept uniqueidentifier FOREIGN KEY REFERENCES CodeableConcept(id),
	performer_Reference uniqueidentifier FOREIGN KEY REFERENCES Reference(id),
);

CREATE TABLE DeviceRequestIdentifier
(
	id_DeviceRequest uniqueidentifier NOT NULL FOREIGN KEY REFERENCES DeviceRequest(id),
	id_Identifier uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Identifier(id),
	CONSTRAINT PK_DeviceRequestIdentifier PRIMARY KEY (id_DeviceRequest, id_Identifier)
);

CREATE TABLE DeviceRequestInstantiatesCanonical
(
	id_DeviceRequest uniqueidentifier NOT NULL FOREIGN KEY REFERENCES DeviceRequest(id),
	id_Canonical uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Canonical(id),
	CONSTRAINT PK_DeviceRequestInstantiatesCanonical PRIMARY KEY (id_DeviceRequest, id_Canonical)
);

CREATE TABLE DeviceRequestInstantiatesUri
(
	id_DeviceRequest uniqueidentifier NOT NULL FOREIGN KEY REFERENCES DeviceRequest(id),
	id_Uri uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Uri(id),
	CONSTRAINT PK_DeviceRequestInstantiatesUri PRIMARY KEY (id_DeviceRequest, id_Uri)
);

CREATE TABLE DeviceRequestBasedOn
(
	id_DeviceRequest uniqueidentifier NOT NULL FOREIGN KEY REFERENCES DeviceRequest(id),
	id_Reference uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Reference(id),
	CONSTRAINT PK_DeviceRequestBasedOn PRIMARY KEY (id_DeviceRequest, id_Reference)
);

CREATE TABLE DeviceRequestPriorRequest
(
	id_DeviceRequest uniqueidentifier NOT NULL FOREIGN KEY REFERENCES DeviceRequest(id),
	id_Reference uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Reference(id),
	CONSTRAINT PK_DeviceRequestPriorRequest PRIMARY KEY (id_DeviceRequest, id_Reference)
);

CREATE TABLE DeviceRequestReasonCode
(
	id_DeviceRequest uniqueidentifier NOT NULL FOREIGN KEY REFERENCES DeviceRequest(id),
	id_CodeableConcept uniqueidentifier NOT NULL FOREIGN KEY REFERENCES CodeableConcept(id),
	CONSTRAINT PK_DeviceRequestReasonCode PRIMARY KEY (id_DeviceRequest, id_CodeableConcept)
);

CREATE TABLE DeviceRequestReasonReference
(
	id_DeviceRequest uniqueidentifier NOT NULL FOREIGN KEY REFERENCES DeviceRequest(id),
	id_Reference uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Reference(id),
	CONSTRAINT PK_DeviceRequestReasonReference PRIMARY KEY (id_DeviceRequest, id_Reference)
);

CREATE TABLE DeviceRequestInsurance
(
	id_DeviceRequest uniqueidentifier NOT NULL FOREIGN KEY REFERENCES DeviceRequest(id),
	id_Reference uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Reference(id),
	CONSTRAINT PK_DeviceRequestInsurance PRIMARY KEY (id_DeviceRequest, id_Reference)
);

CREATE TABLE DeviceRequestSupportingInfo
(
	id_DeviceRequest uniqueidentifier NOT NULL FOREIGN KEY REFERENCES DeviceRequest(id),
	id_Reference uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Reference(id),
	CONSTRAINT PK_DeviceRequestSupportingInfo PRIMARY KEY (id_DeviceRequest, id_Reference)
);

CREATE TABLE DeviceRequestNote
(
	id_DeviceRequest uniqueidentifier NOT NULL FOREIGN KEY REFERENCES DeviceRequest(id),
	id_Annotation uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Annotation(id),
	CONSTRAINT PK_DeviceRequestNote PRIMARY KEY (id_DeviceRequest, id_Annotation)
);

CREATE TABLE DeviceRequestRelevantHistory
(
	id_DeviceRequest uniqueidentifier NOT NULL FOREIGN KEY REFERENCES DeviceRequest(id),
	id_Reference uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Reference(id),
	CONSTRAINT PK_DeviceRequestRelevantHistory PRIMARY KEY (id_DeviceRequest, id_Reference)
);

-- Hjelpetabeller og tilhørende relasjoner

CREATE TABLE DeviceRequestParameter_HT
(
	id uniqueidentifier NOT NULL PRIMARY KEY,
	code_CodeableConcept uniqueidentifier FOREIGN KEY REFERENCES CodeableConcept(id),
	-- value[x]: Type[0..1]
);

CREATE TABLE DeviceRequestParameter
(
	id_DeviceRequest uniqueidentifier NOT NULL FOREIGN KEY REFERENCES DeviceRequest(id),
	id_DeviceRequestParameter_HT uniqueidentifier NOT NULL FOREIGN KEY REFERENCES DeviceRequestParameter_HT(id),
	CONSTRAINT PK_DeviceRequest PRIMARY KEY (id_DeviceRequest, id_DeviceRequestParameter_HT)
);