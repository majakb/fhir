CREATE TABLE Goal
(
	id uniqueidentifier NOT NULL PRIMARY KEY,
	lifecycleStatus nvarchar(255) NOT NULL,
	achievementStatus_CodeableConcept uniqueidentifier NOT NULL FOREIGN KEY REFERENCES CodeableConcept(id),
	priority_CodeableConcept uniqueidentifier FOREIGN KEY REFERENCES CodeableConcept(id),
	description_CodeableConcept uniqueidentifier NOT NULL FOREIGN KEY REFERENCES CodeableConcept(id),
	subject_Reference uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Reference(id),
	-- start[x]: Type[0..1]
	statusDate datetime,
	statusReason nvarchar(255),
	expressedBy_Reference uniqueidentifier FOREIGN KEY REFERENCES Reference(id),
);

CREATE TABLE GoalCategory
(
	id_Goal uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Goal(id),
	id_CodeableConcept uniqueidentifier NOT NULL FOREIGN KEY REFERENCES CodeableConcept(id),
	CONSTRAINT PK_GoalCategory PRIMARY KEY (id_Goal, id_CodeableConcept),
);

CREATE TABLE GoalAdresses
(
	id_Goal uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Goal(id),
	id_Reference uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Reference(id),
	CONSTRAINT PK_GoalAdresses PRIMARY KEY (id_Goal, id_Reference),
);

CREATE TABLE GoalNote
(
	id_Goal uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Goal(id),
	id_Annotation uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Annotation(id),
	CONSTRAINT PK_GoalNote PRIMARY KEY (id_Goal, id_Annotation),
);

CREATE TABLE GoalOutcomeCode
(
	id_Goal uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Goal(id),
	id_CodeableConcept uniqueidentifier NOT NULL FOREIGN KEY REFERENCES CodeableConcept(id),
	CONSTRAINT PK_GoalOutcomeCode PRIMARY KEY (id_Goal, id_CodeableConcept),
);

CREATE TABLE GoalOutcomeReference
(
	id_Goal uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Goal(id),
	id_Reference uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Reference(id),
	CONSTRAINT PK_GoalOutcomeReference PRIMARY KEY (id_Goal, id_Reference),
);

-- Hjelpetabeller med tilhørende relasjoner

CREATE TABLE GoalTarget_HT
(
	id uniqueidentifier NOT NULL PRIMARY KEY,
	measure_CodeableConcept uniqueidentifier FOREIGN KEY REFERENCES CodeableConcept(id),
	-- detail[x]: Type[0..1}
	-- due[x]: Type[0..1]
);

CREATE TABLE GoalTarget
(
	id_Goal uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Goal(id),
	id_GoalTarget_HT uniqueidentifier NOT NULL FOREIGN KEY REFERENCES GoalTarget_HT(id),
	CONSTRAINT PK_GoalTarget PRIMARY KEY (id_Goal, id_GoalTarget_HT),
);