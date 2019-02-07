CREATE TABLE MedicationBatch_HT
(
	id uniqueidentifier NOT NULL PRIMARY KEY,
	lotNumber nvarchar(255),
	expirationDate datetime,
);

CREATE TABLE Medication
(
	id uniqueidentifier NOT NULL PRIMARY KEY,
	code_CodeableConcept uniqueidentifier FOREIGN KEY REFERENCES CodeableConcept(id),
	[status] nvarchar(255),
	manufacturer_Reference uniqueidentifier FOREIGN KEY REFERENCES Reference(id),
	form_CodeableConcept uniqueidentifier FOREIGN KEY REFERENCES CodeableConcept(id),
	amount_Ratio uniqueidentifier FOREIGN KEY REFERENCES Ratio(id),
	batch_MedicationBatch_HT uniqueidentifier FOREIGN KEY REFERENCES MedicationBatch_HT(id),
);

CREATE TABLE MedicationIngredient_HT
(
	id uniqueidentifier NOT NULL PRIMARY KEY,
	-- item[x]: Type[1..1]
	isActive bit,
	strength_Ratio uniqueidentifier FOREIGN KEY REFERENCES Ratio(id),
);

CREATE TABLE MedicationIngredient
(
	id_Medication uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Medication(id),
	id_MedicationIngredient_HT uniqueidentifier NOT NULL FOREIGN KEY REFERENCES MedicationIngredient_HT(id),
	CONSTRAINT PK_MedicationIngredient PRIMARY KEY (id_Medication, id_MedicationIngredient_HT),
);
