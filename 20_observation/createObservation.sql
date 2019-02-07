-- Mangler mange felter i "Observation"

CREATE TABLE Observation
(
	id uniqueidentifier NOT NULL PRIMARY KEY,
	[status] nvarchar(255) NOT NULL,
	code_CodeableConcept uniqueidentifier NOT NULL FOREIGN KEY REFERENCES CodeableConcept(id),
	subject_Reference uniqueidentifier FOREIGN KEY REFERENCES Reference(id)
	-- category
	-- focus
	-- performer
	-- referenceRange

-- Mangler feltene:
--	basedOn: Reference[0..*]
--	partOf: Reference[0..*]
--	encounter: Reference[0..1]
--	effective[x]: Type[0..1]
--	issued: instant[0..1]
--	value[x]: Type[0..1]
--	dataAbsentReason: CodeableConcept[0..1]
--	interpretation: CodeableConcept[0..*]
--	note: Annotation[0..*]
--	bodySite: CodeableConcept[0..1]
--	method: CodeableConcept[0..1]
--	specimen: Reference[0..1]
--	device: Reference[0..1]
--	hasMember: Reference[0..*]
--	derivedFrom: Reference[0..*]
);

CREATE TABLE ObservationCategory
(
	id_Observation uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Observation(id),
	id_CodeableConcept uniqueidentifier NOT NULL FOREIGN KEY REFERENCES CodeableConcept(id),
	CONSTRAINT PK_ObservationCategory									PRIMARY KEY (id_Observation, id_CodeableConcept)
);

CREATE TABLE ObservationFocus
(
	id_Observation uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Observation(id),
	id_Reference uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Reference(id),
	CONSTRAINT PK_ObservationFocus 										PRIMARY KEY (id_Observation, id_Reference)
);

CREATE TABLE ObservationPerformer
(
	id_Observation uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Observation(id),
	id_Reference uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Reference(id),
	CONSTRAINT PK_ObservationPerformer									PRIMARY KEY (id_Observation, id_Reference)
);

-- Hjelpetabeller og tilhørende referanser

CREATE TABLE ObservationComponent_HT
(
	id uniqueidentifier NOT NULL PRIMARY KEY,
	code_CodeableConcept uniqueidentifier NOT NULL FOREIGN KEY REFERENCES CodeableConcept(id),
	-- value: Type[0..1]
	dataAbsentReason_CodeableConcept uniqueidentifier NOT NULL FOREIGN KEY REFERENCES CodeableConcept(id),
);

CREATE TABLE ObservationComponent_HTInterpretation
(
	id_ObservationComponent_HT uniqueidentifier NOT NULL FOREIGN KEY REFERENCES ObservationComponent_HT(id),
	id_CodeableConcept uniqueidentifier NOT NULL FOREIGN KEY REFERENCES CodeableConcept(id),
	CONSTRAINT PK_ObservationComponent_HTInterpretation  PRIMARY KEY (id_CodeableConcept, id_ObservationComponent_HT)
);

CREATE TABLE ObservationComponent
(
	id_Observation uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Observation(id),
	id_ObservationComponent_HT uniqueidentifier NOT NULL FOREIGN KEY REFERENCES ObservationComponent_HT(id),
	CONSTRAINT PK_ObservationComponent  PRIMARY KEY (id_Observation, id_ObservationComponent_HT)
);

CREATE TABLE ObservationReferenceRange_HT
(
	id uniqueidentifier NOT NULL PRIMARY KEY,
	low_Quantity uniqueidentifier FOREIGN KEY REFERENCES Quantity(id),
	high_Quantity uniqueidentifier FOREIGN KEY REFERENCES Quantity(id),
	type_CodeableConcept uniqueidentifier FOREIGN KEY REFERENCES CodeableConcept(id),
	age_low_Quantity uniqueidentifier FOREIGN KEY REFERENCES Quantity(id),
	age_high_Quantity uniqueidentifier FOREIGN KEY REFERENCES Quantity(id),
	[text] nvarchar(255)
);

CREATE TABLE ObservationReferenceRange_HTAppliesTo
(
	id_ObservationReferenceRange_HT uniqueidentifier NOT NULL FOREIGN KEY REFERENCES ObservationReferenceRange_HT(id),
	id_CodeableConcept uniqueidentifier NOT NULL FOREIGN KEY REFERENCES CodeableConcept(id),
	CONSTRAINT PK_ObservationReferenceRange_HTAppliesTo  PRIMARY KEY (id_ObservationReferenceRange_HT, id_CodeableConcept)
);

CREATE TABLE ObservationReferenceRange
(
	id_Observation uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Observation(id),
	id_ObservationReferenceRange_HT uniqueidentifier NOT NULL FOREIGN KEY REFERENCES ObservationReferenceRange_HT(id),
	CONSTRAINT PK_ObservationReferenceRange  PRIMARY KEY (id_Observation, id_ObservationReferenceRange_HT)
);

CREATE TABLE ObservationComponent_HTReferenceRange
(
	id_ObservationComponent_HT uniqueidentifier NOT NULL FOREIGN KEY REFERENCES ObservationComponent_HT(id),
	id_ObservationReferenceRange_HT uniqueidentifier NOT NULL FOREIGN KEY REFERENCES ObservationReferenceRange_HT(id),
	CONSTRAINT PK_ObservationComponent_HTReferenceRange  PRIMARY KEY (id_ObservationComponent_HT, id_ObservationReferenceRange_HT)
);
