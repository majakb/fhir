
CREATE TABLE ClaimPayee_HT
(
	id uniqueidentifier NOT NULL PRIMARY KEY,
	-- id_Claim uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Claim(id), la inn referansen til "Claim" i stedet
	type_CodeableConcept uniqueidentifier NOT NULL FOREIGN KEY REFERENCES CodeableConcept(id),
	party_Reference uniqueidentifier FOREIGN KEY REFERENCES Reference(id)
);

CREATE TABLE ClaimAccident_HT
(
	id uniqueidentifier NOT NULL PRIMARY KEY,
	-- id_Claim uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Claim(id), la inn referansen i "Claim" i stedet
	[date] date NOT NULL,
	type_CodeableConcept uniqueidentifier FOREIGN KEY REFERENCES CodeableConcept(id),
	--location[x]: Type[0..1]
);

CREATE TABLE Claim
(
	id uniqueidentifier NOT NULL PRIMARY KEY,
	[status] nvarchar(255) NOT NULL,
	type_CodeableConcept uniqueidentifier NOT NULL FOREIGN KEY REFERENCES CodeableConcept(id),
	subType_CodeableConcept uniqueidentifier FOREIGN KEY REFERENCES CodeableConcept(id),
	[use] nvarchar(255) NOT NULL,
	patient_Reference uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Reference(id),
	billablePeriodStart datetime,
	billablePeriodEnd datetime,
	created datetime NOT NULL,
	enterer_Reference uniqueidentifier FOREIGN KEY REFERENCES Reference(id),
	insurer_Reference uniqueidentifier FOREIGN KEY REFERENCES Reference(id),
	provider_Reference uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Reference(id),
	priority_CodeableConcept uniqueidentifier NOT NULL FOREIGN KEY REFERENCES CodeableConcept(id),
	fundsReserve_CodeableConcept uniqueidentifier FOREIGN KEY REFERENCES CodeableConcept(id),
	prescription_Reference uniqueidentifier FOREIGN KEY REFERENCES Reference(id),
	originalPrescription_Reference uniqueidentifier FOREIGN KEY REFERENCES Reference(id),
	referral_Reference uniqueidentifier FOREIGN KEY REFERENCES Reference(id),
	facility_Reference uniqueidentifier FOREIGN KEY REFERENCES Reference(id),
	total_Money uniqueidentifier FOREIGN KEY REFERENCES [Money](id),
	-- totalValue decimal(18,3),
	-- totalCurrency nvarchar(255)
	payee_ClaimPayee_HT uniqueidentifier FOREIGN KEY REFERENCES ClaimPayee_HT(id),
	accident_ClaimAccident_HT uniqueidentifier FOREIGN KEY REFERENCES ClaimAccident_HT(id)
);

CREATE TABLE ClaimIdentifier
(
	id_Claim uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Claim(id),
	id_Identifier uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Identifier(id),
	CONSTRAINT PK_ClaimIdentitier PRIMARY KEY (id_Claim, id_Identifier)
);

-- Hjelpetabeller og tilhørende relasjoner

CREATE TABLE ClaimDiagnosis_HT
(
	id uniqueidentifier NOT NULL PRIMARY KEY,
	[sequence] int NOT NULL,
	--diagnosis[x]: Type[1..1]
	onAdmission_CodeableConcept uniqueidentifier FOREIGN KEY REFERENCES CodeableConcept(id),
	packageCode_CodeableConcept uniqueidentifier FOREIGN KEY REFERENCES CodeableConcept(id)
);

CREATE TABLE ClaimDiagnosis_HTType
(
	id_ClaimDiagnosis_HT uniqueidentifier NOT NULL FOREIGN KEY REFERENCES ClaimDiagnosis_HT(id),
	id_CodeableConcept uniqueidentifier NOT NULL FOREIGN KEY REFERENCES CodeableConcept(id),
	CONSTRAINT PK_ClaimDiagnosis_HTType PRIMARY KEY (id_ClaimDiagnosis_HT, id_CodeableConcept)
);

CREATE TABLE ClaimDiagnosis
(
	id_ClaimDiagnosis_HT uniqueidentifier NOT NULL FOREIGN KEY REFERENCES ClaimDiagnosis_HT(id),
	id_Claim uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Claim(id),
	CONSTRAINT PK_ClaimDiagnosis PRIMARY KEY (id_ClaimDiagnosis_HT, id_Claim)
);

CREATE TABLE ClaimProcedure_HT
(
	id uniqueidentifier NOT NULL PRIMARY KEY,
	[sequence] int NOT NULL,
	[date] datetime,
	-- procedure[x]: Type[1..1]
);

CREATE TABLE ClaimProcedure_HTType
(
	id_ClaimProcedure_HT uniqueidentifier NOT NULL FOREIGN KEY REFERENCES ClaimProcedure_HT(id),
	id_CodeableConcept uniqueidentifier NOT NULL FOREIGN KEY REFERENCES CodeableConcept(id),
	CONSTRAINT PK_ClaimProcedure_HTType PRIMARY KEY (id_ClaimProcedure_HT, id_CodeableConcept)
);

CREATE TABLE ClaimProcedure_HTUdi
(
	id_ClaimProcedure_HT uniqueidentifier NOT NULL FOREIGN KEY REFERENCES ClaimProcedure_HT(id),
	id_Reference uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Reference(id),
	CONSTRAINT PK_ClaimProcedure_HTUdi PRIMARY KEY (id_ClaimProcedure_HT, id_Reference)
);

CREATE TABLE ClaimProcedure
(
	id_ClaimProcedure_HT uniqueidentifier NOT NULL FOREIGN KEY REFERENCES ClaimProcedure_HT(id),
	id_Claim uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Claim(id),
	CONSTRAINT PK_ClaimProcedure PRIMARY KEY (id_ClaimProcedure_HT, id_Claim)
);

CREATE TABLE ClaimCareTeam_HT
(
	id uniqueidentifier NOT NULL PRIMARY KEY,
	[sequence] int NOT NULL,
	provider_Reference uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Reference(id),
	responsible bit,
	role_CodeableConcept uniqueidentifier FOREIGN KEY REFERENCES CodeableConcept(id),
	qualification_CodeableConcept uniqueidentifier FOREIGN KEY REFERENCES CodeableConcept(id)
);

CREATE TABLE ClaimCareTeam
(
	id_ClaimCareTeam_HT uniqueidentifier NOT NULL FOREIGN KEY REFERENCES ClaimCareTeam_HT(id),
	id_Claim uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Claim(id),
	CONSTRAINT PK_ClaimCareTeam PRIMARY KEY (id_ClaimCareTeam_HT, id_Claim)
);

CREATE TABLE ClaimSupportingInformation_HT
(
	id uniqueidentifier NOT NULL PRIMARY KEY,
	[sequence] int NOT NULL,
	category_CodeableConcept uniqueidentifier NOT NULL FOREIGN KEY REFERENCES CodeableConcept(id),
	code_CodeableConcept uniqueidentifier FOREIGN KEY REFERENCES CodeableConcept(id),
	-- timing[x]: Type[0..1]
	-- value[x]: Type[0..1]
	reason_CodeableConcept uniqueidentifier FOREIGN KEY REFERENCES CodeableConcept(id)
);

CREATE TABLE ClaimSupportingInformation
(
	id_ClaimSupportingInformation_HT uniqueidentifier NOT NULL FOREIGN KEY REFERENCES ClaimSupportingInformation_HT(id),
	id_Claim uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Claim(id),
	CONSTRAINT PK_ClaimSupportingInformation PRIMARY KEY (id_ClaimSupportingInformation_HT, id_Claim)
);

CREATE TABLE ClaimRelatedClaim_HT
(
	id uniqueidentifier NOT NULL PRIMARY KEY,
	claim_Reference uniqueidentifier FOREIGN KEY REFERENCES Reference(id),
	relationship_CodeableConcept uniqueidentifier FOREIGN KEY REFERENCES CodeableConcept(id),
	reference_Identifier uniqueidentifier FOREIGN KEY REFERENCES Identifier(id)
);

CREATE TABLE ClaimRelatedClaim
(
	id_ClaimRelatedClaim_HT uniqueidentifier NOT NULL FOREIGN KEY REFERENCES ClaimRelatedClaim_HT(id),
	id_Claim uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Claim(id),
	CONSTRAINT PK_ClaimRelatedClaim PRIMARY KEY (id_ClaimRelatedClaim_HT, id_Claim)
);

CREATE TABLE ClaimInsurance_HT
(
	id uniqueidentifier NOT NULL PRIMARY KEY,
	[sequence] int NOT NULL,
	focal bit NOT NULL,
	identifier_Identifier uniqueidentifier FOREIGN KEY REFERENCES Identifier(id),
	coverage_Reference uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Reference(id),
	businessArrangement nvarchar(255),
	preAuthRef nvarchar(255),      -- Skal vaere 0..*
	claimResponse_Reference uniqueidentifier FOREIGN KEY REFERENCES Reference(id)
);

CREATE TABLE ClaimInsurance
(
	id_ClaimInsurance_HT uniqueidentifier NOT NULL FOREIGN KEY REFERENCES ClaimInsurance_HT(id),
	id_Claim uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Claim(id),
	CONSTRAINT PK_ClaimInsurance PRIMARY KEY (id_ClaimInsurance_HT, id_Claim)
);







CREATE TABLE ClaimItem_HT
(
	id uniqueidentifier NOT NULL PRIMARY KEY,
	[sequence] int NOT NULL,
	-- careTeamSequence
	-- diagnosisSequence
	-- procedureSequence
	-- informationSequence
	revenue_CodeableConcept uniqueidentifier FOREIGN KEY REFERENCES CodeableConcept(id),
	category_CodeableConcept uniqueidentifier FOREIGN KEY REFERENCES CodeableConcept(id),
	productOrService_CodeableConcept uniqueidentifier NOT NULL FOREIGN KEY REFERENCES CodeableConcept(id),
	-- modifier
	-- programCode
	--serviced_Type uniqueidentifier FOREIGN KEY REFERENCES Type(id),
	--location_Type uniqueidentifier FOREIGN KEY REFERENCES Type(id),
	quantity_Quantity uniqueidentifier FOREIGN KEY REFERENCES Quantity(id),
	unitPriceValue decimal(18,3),
	unitPriceCurrency nvarchar(255),
	factor decimal(18,3),
	netValue decimal(18,3),
	netCurrency nvarchar(255),
	-- udi
	bodySite_CodeableConcept uniqueidentifier FOREIGN KEY REFERENCES CodeableConcept(id),
	-- subSite
	-- encounter
);

CREATE TABLE ClaimItem_HTCareTeamSequence
(
	id_ClaimItem_HT uniqueidentifier NOT NULL FOREIGN KEY REFERENCES ClaimItem_HT(id),
	id_ClaimCareTeam_HT uniqueidentifier NOT NULL FOREIGN KEY REFERENCES ClaimCareTeam_HT(id),
	CONSTRAINT PK_ClaimItem_HTCareTeamSequence PRIMARY KEY (id_ClaimItem_HT, id_ClaimCareTeam_HT)
);

CREATE TABLE ClaimItem_HTDiagnosisSequence
(
	id_ClaimItem_HT uniqueidentifier NOT NULL FOREIGN KEY REFERENCES ClaimItem_HT(id),
	id_ClaimDiagnosis_HT uniqueidentifier NOT NULL FOREIGN KEY REFERENCES ClaimDiagnosis_HT(id),
	CONSTRAINT PK_ClaimItem_HTDiagnosisSequence PRIMARY KEY (id_ClaimItem_HT, id_ClaimDiagnosis_HT)
);

CREATE TABLE ClaimItem_HTProcedureSequence
(
	id_ClaimItem_HT uniqueidentifier NOT NULL FOREIGN KEY REFERENCES ClaimItem_HT(id),
	id_ClaimProcedure_HT uniqueidentifier NOT NULL FOREIGN KEY REFERENCES ClaimProcedure_HT(id),
	CONSTRAINT PK_ClaimItem_HTProcedureSequence PRIMARY KEY (id_ClaimItem_HT, id_ClaimProcedure_HT)
);

CREATE TABLE ClaimItem_HTInformationSequence
(
	id_ClaimItem_HT uniqueidentifier NOT NULL FOREIGN KEY REFERENCES ClaimItem_HT(id),
	id_ClaimSupportingInformation_HT uniqueidentifier NOT NULL FOREIGN KEY REFERENCES ClaimSupportingInformation_HT(id),
	CONSTRAINT PK_ClaimItem_HTInformationSequence PRIMARY KEY (id_ClaimItem_HT, id_ClaimSupportingInformation_HT)
);

CREATE TABLE ClaimItem_HTModifier
(
	id_ClaimItem_HT uniqueidentifier NOT NULL FOREIGN KEY REFERENCES ClaimItem_HT(id),
	id_CodeableConcept uniqueidentifier NOT NULL FOREIGN KEY REFERENCES CodeableConcept(id),
	CONSTRAINT PK_ClaimItem_HTModifier PRIMARY KEY (id_ClaimItem_HT, id_CodeableConcept)
);

CREATE TABLE ClaimItem_HTProgramCode
(
	id_ClaimItem_HT uniqueidentifier NOT NULL FOREIGN KEY REFERENCES ClaimItem_HT(id),
	id_CodeableConcept uniqueidentifier NOT NULL FOREIGN KEY REFERENCES CodeableConcept(id),
	CONSTRAINT PK_ClaimItem_HTProgramCode PRIMARY KEY (id_ClaimItem_HT, id_CodeableConcept)
);

CREATE TABLE ClaimItem_HTUdi
(
	id_ClaimItem_HT uniqueidentifier NOT NULL FOREIGN KEY REFERENCES ClaimItem_HT(id),
	id_Reference uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Reference(id),
	CONSTRAINT PK_ClaimItem_HTUdi PRIMARY KEY (id_ClaimItem_HT, id_Reference)
);

CREATE TABLE ClaimItem_HTSubSite
(
	id_ClaimItem_HT uniqueidentifier NOT NULL FOREIGN KEY REFERENCES ClaimItem_HT(id),
	id_CodeableConcept uniqueidentifier NOT NULL FOREIGN KEY REFERENCES CodeableConcept(id),
	CONSTRAINT PK_ClaimItem_HTSubSite PRIMARY KEY (id_ClaimItem_HT, id_CodeableConcept)
);

CREATE TABLE ClaimItem_HTEncounter
(
	id_ClaimItem_HT uniqueidentifier NOT NULL FOREIGN KEY REFERENCES ClaimItem_HT(id),
	id_Reference uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Reference(id),
	CONSTRAINT PK_ClaimItem_HTEncounter PRIMARY KEY (id_ClaimItem_HT, id_Reference)
);

CREATE TABLE ClaimItem
(
	id_ClaimItem_HT uniqueidentifier NOT NULL FOREIGN KEY REFERENCES ClaimItem_HT(id),
	id_Claim uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Claim(id),
	CONSTRAINT PK_ClaimItem PRIMARY KEY (id_ClaimItem_HT, id_Claim)
);

CREATE TABLE ClaimItemDetail_HT
(
	id uniqueidentifier NOT NULL PRIMARY KEY,
	[sequence] int NOT NULL,
	revenue_CodeableConcept uniqueidentifier FOREIGN KEY REFERENCES CodeableConcept(id),
	category_CodeableConcept uniqueidentifier FOREIGN KEY REFERENCES CodeableConcept(id),
	productOrService_CodeableConcept uniqueidentifier NOT NULL FOREIGN KEY REFERENCES CodeableConcept(id),
	-- modifier
	-- programCode
	quantity_Quantity uniqueidentifier FOREIGN KEY REFERENCES Quantity(id),
	unitPriceValue decimal(18,3),
	unitPriceCurrency nvarchar(255),
	factor decimal(18,3),
	netValue decimal(18,3),
	netCurrency nvarchar(255),
	-- udi
);

CREATE TABLE ClaimItemDetail_HTModifier
(
	id_ClaimItemDetail_HT uniqueidentifier NOT NULL FOREIGN KEY REFERENCES ClaimItemDetail_HT(id),
	id_CodeableConcept uniqueidentifier NOT NULL FOREIGN KEY REFERENCES CodeableConcept(id),
	CONSTRAINT PK_ClaimItemDetail_HTModifier PRIMARY KEY (id_ClaimItemDetail_HT, id_CodeableConcept)
);

CREATE TABLE ClaimItemDetail_HTProgramCode
(
	id_ClaimItemDetail_HT uniqueidentifier NOT NULL FOREIGN KEY REFERENCES ClaimItemDetail_HT(id),
	id_CodeableConcept uniqueidentifier NOT NULL FOREIGN KEY REFERENCES CodeableConcept(id),
	CONSTRAINT PK_ClaimItemDetail_HTProgramCode PRIMARY KEY (id_ClaimItemDetail_HT, id_CodeableConcept)
);

CREATE TABLE ClaimItemDetail_HTUdi
(
	id_ClaimItemDetail_HT uniqueidentifier NOT NULL FOREIGN KEY REFERENCES ClaimItemDetail_HT(id),
	id_Reference uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Reference(id),
	CONSTRAINT PK_ClaimItemDetail_HTUdi PRIMARY KEY (id_ClaimItemDetail_HT, id_Reference)
);

CREATE TABLE ClaimItemDetail
(
	id_ClaimItem_HT uniqueidentifier NOT NULL FOREIGN KEY REFERENCES ClaimItem_HT(id),
	id_ClaimItemDetail_HT uniqueidentifier NOT NULL FOREIGN KEY REFERENCES ClaimItemDetail_HT(id),
	CONSTRAINT PK_ClaimItemDetail PRIMARY KEY (id_ClaimItem_HT, id_ClaimItemDetail_HT)
);

CREATE TABLE ClaimItemDetailSubDetail_HT
(
	id uniqueidentifier NOT NULL PRIMARY KEY,
	[sequence] int NOT NULL,
	revenue_CodeableConcept uniqueidentifier FOREIGN KEY REFERENCES CodeableConcept(id),
	category_CodeableConcept uniqueidentifier FOREIGN KEY REFERENCES CodeableConcept(id),
	productOrService_CodeableConcept uniqueidentifier NOT NULL FOREIGN KEY REFERENCES CodeableConcept(id),
	-- modifier
	-- programCocde
	quantity_Quantity uniqueidentifier FOREIGN KEY REFERENCES Quantity(id),
	unitPriceValue decimal(18,3),
	unitPriceCurrency nvarchar(255),
	factor decimal(18,3),
	netValue decimal(18,3),
	netCurrency nvarchar(255),
	-- udi
);

CREATE TABLE ClaimItemDetailSubDetail_HTModifier
(
	id_ClaimItemDetailSubDetail_HT uniqueidentifier NOT NULL FOREIGN KEY REFERENCES ClaimItemDetailSubDetail_HT(id),
	id_CodeableConcept uniqueidentifier NOT NULL FOREIGN KEY REFERENCES CodeableConcept(id),
	CONSTRAINT PK_ClaimItemDetailSubDetail_HTModifier PRIMARY KEY (id_ClaimItemDetailSubDetail_HT, id_CodeableConcept)
);

CREATE TABLE ClaimItemDetailSubDetail_HTProgramCode
(
	id_ClaimItemDetailSubDetail_HT uniqueidentifier NOT NULL FOREIGN KEY REFERENCES ClaimItemDetailSubDetail_HT(id),
	id_CodeableConcept uniqueidentifier NOT NULL FOREIGN KEY REFERENCES CodeableConcept(id),
	CONSTRAINT PK_ClaimItemDetailSubDetail_HTProgramCode PRIMARY KEY (id_ClaimItemDetailSubDetail_HT, id_CodeableConcept)
);

CREATE TABLE ClaimItemDetailSubDetail_HTUdi
(
	id_ClaimItemDetailSubDetail_HT uniqueidentifier NOT NULL FOREIGN KEY REFERENCES ClaimItemDetailSubDetail_HT(id),
	id_Reference uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Reference(id),
	CONSTRAINT PK_ClaimItemDetailSubDetail_HTUdi PRIMARY KEY (id_ClaimItemDetailSubDetail_HT, id_Reference)
);

CREATE TABLE ClaimItemDetailSubDetail
(
	id_ClaimItemDetail_HT uniqueidentifier NOT NULL FOREIGN KEY REFERENCES ClaimItemDetail_HT(id),
	id_ClaimItemDetailSubDetail_HT uniqueidentifier NOT NULL FOREIGN KEY REFERENCES ClaimItemDetailSubDetail_HT(id),
	CONSTRAINT PK_ClaimItemDetailSubDetail PRIMARY KEY (id_ClaimItemDetail_HT, id_ClaimItemDetailSubDetail_HT)
);