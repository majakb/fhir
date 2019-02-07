CREATE TABLE ServiceRequest
(
	id uniqueidentifier NOT NULL PRIMARY KEY,
	requisition_Identifier uniqueidentifier FOREIGN KEY REFERENCES Identifier(id),
	[status] nvarchar(255) NOT NULL,
	[intent] nvarchar(255) NOT NULL,
	[priority] nvarchar(255),
	doNotPerform bit,
	code_CodeableConcept uniqueidentifier FOREIGN KEY REFERENCES CodeableConcept(id),
	-- quantity[x]: Type[0..1]
	subject_Reference uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Reference(id),
	encounter_Reference uniqueidentifier FOREIGN KEY REFERENCES Reference(id),
	-- occurence[x]: Type[0..1]
	-- asNeeded[x]: Type[0..1]
	authoredOn datetime,
	requester_Reference uniqueidentifier FOREIGN KEY REFERENCES Reference(id),
	performerType_CodeableConcept uniqueidentifier FOREIGN KEY REFERENCES CodeableConcept(id),
	patientInstruction nvarchar(255)
);

CREATE TABLE ServiceRequestInstantiatesCanonical
(
	id_ServiceRequest uniqueidentifier NOT NULL FOREIGN KEY REFERENCES ServiceRequest(id),
	id_Canonical uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Canonical(id),
	CONSTRAINT PK_ServiceRequestInstantiatesCanonical PRIMARY KEY (id_ServiceRequest, id_Canonical)
);

CREATE TABLE ServiceRequestInstantiatesUri
(
	id_ServiceRequest uniqueidentifier NOT NULL FOREIGN KEY REFERENCES ServiceRequest(id),
	id_Uri uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Uri(id),
	CONSTRAINT PK_ServiceRequestInstantiatesUri PRIMARY KEY (id_ServiceRequest, id_Uri)
);

CREATE TABLE ServiceRequestBasedOn
(
	id_ServiceRequest uniqueidentifier NOT NULL FOREIGN KEY REFERENCES ServiceRequest(id),
	id_Reference uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Reference(id),
	CONSTRAINT PK_ServiceRequestBasedOn PRIMARY KEY (id_ServiceRequest, id_Reference)
);

CREATE TABLE ServiceRequestReplaces
(
	id_ServiceRequest uniqueidentifier NOT NULL FOREIGN KEY REFERENCES ServiceRequest(id),
	id_Reference uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Reference(id),
	CONSTRAINT PK_ServiceRequestReplaces PRIMARY KEY (id_ServiceRequest, id_Reference)
);

CREATE TABLE ServiceRequestCategory
(
	id_ServiceRequest uniqueidentifier NOT NULL FOREIGN KEY REFERENCES ServiceRequest(id),
	id_CodeableConcept uniqueidentifier NOT NULL FOREIGN KEY REFERENCES CodeableConcept(id),
	CONSTRAINT PK_ServiceRequestCategory PRIMARY KEY (id_ServiceRequest, id_CodeableConcept)
);

CREATE TABLE ServiceRequestOrderDetail
(
	id_ServiceRequest uniqueidentifier NOT NULL FOREIGN KEY REFERENCES ServiceRequest(id),
	id_CodeableConcept uniqueidentifier NOT NULL FOREIGN KEY REFERENCES CodeableConcept(id),
	CONSTRAINT PK_ServiceRequestOrderDetail PRIMARY KEY (id_ServiceRequest, id_CodeableConcept)
);

CREATE TABLE ServiceRequestPerformer
(
	id_ServiceRequest uniqueidentifier NOT NULL FOREIGN KEY REFERENCES ServiceRequest(id),
	id_Reference uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Reference(id),
	CONSTRAINT PK_ServiceRequestPerformer PRIMARY KEY (id_ServiceRequest, id_Reference)
);

CREATE TABLE ServiceRequestLocationCode
(
	id_ServiceRequest uniqueidentifier NOT NULL FOREIGN KEY REFERENCES ServiceRequest(id),
	id_CodeableConcept uniqueidentifier NOT NULL FOREIGN KEY REFERENCES CodeableConcept(id),
	CONSTRAINT PK_ServiceRequestLocationCode PRIMARY KEY (id_ServiceRequest, id_CodeableConcept)
);

CREATE TABLE ServiceRequestLocationReference
(
	id_ServiceRequest uniqueidentifier NOT NULL FOREIGN KEY REFERENCES ServiceRequest(id),
	id_Reference uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Reference(id),
	CONSTRAINT PK_ServiceRequestLocationReference PRIMARY KEY (id_ServiceRequest, id_Reference)
);

CREATE TABLE ServiceRequestReasonCode
(
	id_ServiceRequest uniqueidentifier NOT NULL FOREIGN KEY REFERENCES ServiceRequest(id),
	id_CodeableConcept uniqueidentifier NOT NULL FOREIGN KEY REFERENCES CodeableConcept(id),
	CONSTRAINT PK_ServiceRequestReasonCode PRIMARY KEY (id_ServiceRequest, id_CodeableConcept)
);

CREATE TABLE ServiceRequestReasonReference
(
	id_ServiceRequest uniqueidentifier NOT NULL FOREIGN KEY REFERENCES ServiceRequest(id),
	id_Reference uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Reference (id),
	CONSTRAINT PK_ServiceRequestReasonReference PRIMARY KEY (id_ServiceRequest, id_Reference)
);

CREATE TABLE ServiceRequestInsurance
(
	id_ServiceRequest uniqueidentifier NOT NULL FOREIGN KEY REFERENCES ServiceRequest(id),
	id_Reference uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Reference(id),
	CONSTRAINT PK_ServiceRequestInsurance PRIMARY KEY (id_ServiceRequest, id_Reference)
);

CREATE TABLE ServiceRequestSupportingInfo
(
	id_ServiceRequest uniqueidentifier NOT NULL FOREIGN KEY REFERENCES ServiceRequest(id),
	id_Reference uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Reference(id),
	CONSTRAINT PK_ServiceRequestSupportingInfo PRIMARY KEY (id_ServiceRequest, id_Reference)
);

CREATE TABLE ServiceRequestSpecimen
(
	id_ServiceRequest uniqueidentifier NOT NULL FOREIGN KEY REFERENCES ServiceRequest(id),
	id_Reference uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Reference(id),
	CONSTRAINT PK_ServiceRequestSpecimen PRIMARY KEY (id_ServiceRequest, id_Reference)
);

CREATE TABLE ServiceRequestBodySite
(
	id_ServiceRequest uniqueidentifier NOT NULL FOREIGN KEY REFERENCES ServiceRequest(id),
	id_CodeableConcept uniqueidentifier NOT NULL FOREIGN KEY REFERENCES CodeableConcept(id),
	CONSTRAINT PK_ServiceRequestBodySite PRIMARY KEY (id_ServiceRequest, id_CodeableConcept)
);

CREATE TABLE ServiceRequestNote
(
	id_ServiceRequest uniqueidentifier NOT NULL FOREIGN KEY REFERENCES ServiceRequest(id),
	id_Annotation uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Annotation(id),
	CONSTRAINT PK_ServiceRequestNote PRIMARY KEY (id_ServiceRequest, id_Annotation)
);

CREATE TABLE ServiceRequestRelevantHistory
(
	id_ServiceRequest uniqueidentifier NOT NULL FOREIGN KEY REFERENCES ServiceRequest(id),
	id_Reference uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Reference(id),
	CONSTRAINT PK_ServiceRequestRelevantHistory PRIMARY KEY (id_ServiceRequest, id_Reference)
);