CREATE TABLE SupplyRequest
(
	id uniqueidentifier NOT NULL PRIMARY KEY,
	[status] nvarchar(255),
	category_CodeableConcept uniqueidentifier FOREIGN KEY REFERENCES CodeableConcept(id),
	[priority] nvarchar(255),
	-- item[x]: Type[1..1]
	quantity_Quantity uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Quantity(id),
	-- occurence[x]: Type[0..1]											
	authoredOn datetime,
	requester_Reference uniqueidentifier FOREIGN KEY REFERENCES Reference(id),
	deliverFrom_Reference uniqueidentifier FOREIGN KEY REFERENCES Reference(id),
	deliverTo_Reference uniqueidentifier FOREIGN KEY REFERENCES Reference(id)
);

CREATE TABLE SupplyRequestIdentifier
(
	id_SupplyRequest uniqueidentifier NOT NULL FOREIGN KEY REFERENCES SupplyRequest(id),
	id_Identifier uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Identifier(id),
	CONSTRAINT PK_SupplyRequestIdentifier PRIMARY KEY (id_SupplyRequest, id_Identifier)
);

CREATE TABLE SupplyRequestSupplier
(
	id_SupplyRequest uniqueidentifier NOT NULL FOREIGN KEY REFERENCES SupplyRequest(id),
	id_Reference uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Reference(id),
	CONSTRAINT PK_SupplyRequestSupplier PRIMARY KEY (id_SupplyRequest, id_Reference)
);

CREATE TABLE SupplyRequestReasonCode
(
	id_SupplyRequest uniqueidentifier NOT NULL FOREIGN KEY REFERENCES SupplyRequest(id),
	id_CodeableConcept uniqueidentifier NOT NULL FOREIGN KEY REFERENCES CodeableConcept(id),
	CONSTRAINT PK_SupplyRequestReasonCode PRIMARY KEY (id_SupplyRequest, id_CodeableConcept)
);

CREATE TABLE SupplyRequestReasonReference
(
	id_SupplyRequest uniqueidentifier NOT NULL FOREIGN KEY REFERENCES SupplyRequest(id),
	id_Reference uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Reference(id),
	CONSTRAINT PK_SupplyRequestReasonReference PRIMARY KEY (id_SupplyRequest, id_Reference)
);

-- Hjelpetabeller og tilhørende relasjoner

CREATE TABLE SupplyRequestParameter_HT
(
	id uniqueidentifier NOT NULL PRIMARY KEY,
	code_CodeableConcept uniqueidentifier FOREIGN KEY REFERENCES CodeableConcept(id),
	-- value[x]: Type[0..1]
);

CREATE TABLE SupplyRequestParameter
(
	id_SupplyRequest uniqueidentifier NOT NULL FOREIGN KEY REFERENCES SupplyRequest(id),
	id_SupplyRequestParameter_HT uniqueidentifier NOT NULL FOREIGN KEY REFERENCES SupplyRequestParameter_HT(id),
	CONSTRAINT PK_SupplyRequestParameter PRIMARY KEY (id_SupplyRequest, id_SupplyRequestParameter_HT)
);
