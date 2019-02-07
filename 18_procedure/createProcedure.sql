CREATE TABLE [Procedure]
(
	id uniqueidentifier NOT NULL PRIMARY KEY,
	[status] nvarchar(255) NOT NULL,
	statusReason_CodeableConcept uniqueidentifier FOREIGN KEY REFERENCES CodeableConcept(id),
	category_CodeableConcept uniqueidentifier FOREIGN KEY REFERENCES CodeableConcept(id),
	code_CodeableConcept uniqueidentifier FOREIGN KEY REFERENCES CodeableConcept(id),
	subject_Reference uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Reference(id),
	encounter_Reference uniqueidentifier FOREIGN KEY REFERENCES Reference(id),
	performed nvarchar(255), -- performed (what to do with 'Type'?)
	recorder_Reference uniqueidentifier FOREIGN KEY REFERENCES Reference(id),
	asserter_Reference uniqueidentifier FOREIGN KEY REFERENCES Reference(id),
	location_Reference uniqueidentifier FOREIGN KEY REFERENCES Reference(id),
	outcome_CodeableConcept uniqueidentifier FOREIGN KEY REFERENCES CodeableConcept(id),
)

CREATE TABLE ProcedureIdentifier
(
	id_Procedure uniqueidentifier NOT NULL FOREIGN KEY REFERENCES [Procedure](id),
	id_Identifier uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Identifier(id),
	CONSTRAINT PK_ProcedureIdentifier PRIMARY KEY (id_Procedure, id_Identifier)
)

CREATE TABLE ProcedureInstantiatesCanonical
(
	id_Procedure uniqueidentifier NOT NULL FOREIGN KEY REFERENCES [Procedure](id),
	id_Canonical uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Canonical(id),
	CONSTRAINT PK_ProcedureInstantiatesCanonical PRIMARY KEY (id_Procedure, id_Canonical)
)

CREATE TABLE ProcedureInstantiatesUri
(
	id_Procedure uniqueidentifier NOT NULL FOREIGN KEY REFERENCES [Procedure](id),
	id_Uri uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Uri(id),
	CONSTRAINT PK_ProcedureInstantiatesUri PRIMARY KEY (id_Procedure, id_Uri)
)

CREATE TABLE ProcedureBasedOn
(
	id_Procedure uniqueidentifier NOT NULL FOREIGN KEY REFERENCES [Procedure](id),
	id_Reference uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Reference(id),
	CONSTRAINT PK_ProcedureBasedOn PRIMARY KEY (id_Procedure, id_Reference)
)

CREATE TABLE ProcedurePartOf
(
	id_Procedure uniqueidentifier NOT NULL FOREIGN KEY REFERENCES [Procedure](id),
	id_Reference uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Reference(id),
	CONSTRAINT PK_ProcedurePartOf PRIMARY KEY (id_Procedure, id_Reference)
)

CREATE TABLE ProcedureReasonCode
(
	id_Procedure uniqueidentifier NOT NULL FOREIGN KEY REFERENCES [Procedure](id),
	id_CodeableConcept uniqueidentifier NOT NULL FOREIGN KEY REFERENCES CodeableConcept(id),
	CONSTRAINT PK_ProcedureReasonCode PRIMARY KEY (id_Procedure, id_CodeableConcept)
)

CREATE TABLE ProcedureReasonReference
(
	id_Procedure uniqueidentifier NOT NULL FOREIGN KEY REFERENCES [Procedure](id),
	id_Reference uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Reference(id),
	CONSTRAINT PK_ProcedureReasonReference PRIMARY KEY (id_Procedure, id_Reference)
)

CREATE TABLE ProcedureBodySite
(
	id_Procedure uniqueidentifier NOT NULL FOREIGN KEY REFERENCES [Procedure](id),
	id_CodeableConcept uniqueidentifier NOT NULL FOREIGN KEY REFERENCES CodeableConcept(id),
	CONSTRAINT PK_ProcedureBodySite PRIMARY KEY (id_Procedure, id_CodeableConcept)
)

CREATE TABLE ProcedureReport
(
	id_Procedure uniqueidentifier NOT NULL FOREIGN KEY REFERENCES [Procedure](id),
	id_Reference uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Reference(id),
	CONSTRAINT PK_ProcedureReport PRIMARY KEY (id_Procedure, id_Reference)
)

CREATE TABLE ProcedureComplication
(
	id_Procedure uniqueidentifier NOT NULL FOREIGN KEY REFERENCES [Procedure](id),
	id_CodeableConcept uniqueidentifier NOT NULL FOREIGN KEY REFERENCES CodeableConcept(id),
	CONSTRAINT PK_ProcedureComplication PRIMARY KEY (id_Procedure, id_CodeableConcept)
)

CREATE TABLE ProcedureComplicationDetail
(
	id_Procedure uniqueidentifier NOT NULL FOREIGN KEY REFERENCES [Procedure](id),
	id_Reference uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Reference(id),
	CONSTRAINT PK_ProcedureComplicationDetail PRIMARY KEY (id_Procedure, id_Reference)
)

CREATE TABLE ProcedureFollowUp
(
	id_Procedure uniqueidentifier NOT NULL FOREIGN KEY REFERENCES [Procedure](id),
	id_CodeableConcept uniqueidentifier NOT NULL FOREIGN KEY REFERENCES CodeableConcept(id),
	CONSTRAINT PK_ProcedureFollowUp PRIMARY KEY (id_Procedure, id_CodeableConcept)
)

CREATE TABLE ProcedureNote
(
	id_Procedure uniqueidentifier NOT NULL FOREIGN KEY REFERENCES [Procedure](id),
	id_Annotation uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Annotation(id),
	CONSTRAINT PK_ProcedureNote PRIMARY KEY (id_Procedure, id_Annotation)
)

CREATE TABLE ProcedureUsedReference
(
	id_Procedure uniqueidentifier NOT NULL FOREIGN KEY REFERENCES [Procedure](id),
	id_Reference uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Reference(id),
	CONSTRAINT PK_ProcedureUsedReference PRIMARY KEY (id_Procedure, id_Reference)
)

CREATE TABLE ProcedureUsedCode
(
	id_Procedure uniqueidentifier NOT NULL FOREIGN KEY REFERENCES [Procedure](id),
	id_CodeableConcept uniqueidentifier NOT NULL FOREIGN KEY REFERENCES CodeableConcept(id),
	CONSTRAINT PK_ProcedureUsedCode PRIMARY KEY (id_Procedure, id_CodeableConcept)
)

-- Hjelpetabeller og tilhørende referanser

CREATE TABLE ProcedurePerformer_HT
(
	id uniqueidentifier NOT NULL PRIMARY KEY,
	function_CodeableConcept uniqueidentifier FOREIGN KEY REFERENCES CodeableConcept(id),
	actor_Reference uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Reference(id),
	onBehalfOf_Reference uniqueidentifier FOREIGN KEY REFERENCES Reference(id),
)

CREATE TABLE ProcedurePerformer
(
	id_Procedure uniqueidentifier NOT NULL FOREIGN KEY REFERENCES [Procedure](id),
	id_ProcedurePerformer_HT uniqueidentifier NOT NULL FOREIGN KEY REFERENCES ProcedurePerformer_HT(id),
	CONSTRAINT PK_ProcedurePerformer PRIMARY KEY (id_Procedure, id_ProcedurePerformer_HT)
)

CREATE TABLE ProcedureFocalDevice_HT
(
	id uniqueidentifier NOT NULL PRIMARY KEY,
	action_CodeableConcept uniqueidentifier FOREIGN KEY REFERENCES CodeableConcept(id),
	manipulated_Reference uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Reference(id)
)

CREATE TABLE ProcedureFocalDevice
(
	id_Procedure uniqueidentifier NOT NULL FOREIGN KEY REFERENCES [Procedure](id),
	id_ProcedureFocalDevice_HT uniqueidentifier NOT NULL FOREIGN KEY REFERENCES ProcedureFocalDevice_HT(id),
	CONSTRAINT PK_ProcedureFocalDevice PRIMARY KEY (id_Procedure, id_ProcedureFocalDevice_HT)
);
