
-- version 0.01 - The very beginning
-- version 0.02 - Observation v1
-- version 0.03 - Patient v1
-- version 0.04 - DiagnosticReport v1
-- version 0.05 - AllergyIntolerance v1
-- version 0.06 - Practitioner v1
-- version 0.07 - DiagnosticReport v2
-- version 0.08 - ServiceRequest v1
-- version 0.09 - Schedule v1
-- version 0.10 - Composition v1
-- version 0.11 - Task v1
-- version 0.12 - PractitionerRole v1
-- version 0.13 - Encounter v1
-- version 0.14 - RelatedPerson v1
-- version 0.15 - CareTeam v1
-- version 0.16 - Observation v2
-- version 0.17 - CareTeam v2
-- version 0.18 - DiagnosticReport v3
-- version 0.19 - Encounter v2
-- version 0.20 - Condition v1
-- version 0.21 - Claim v1
-- version 0.22 - Organization v1
-- version 0.23 - SupplyRequest v1
-- version 0.24 - Person v1
-- version 0.25 - PaymentNotice v1
-- version 0.26 - MedicationStatement v1
-- version 0.27 - DeviceRequest v1
-- version 0.28 - Procedure v1
-- version 0.28 - CarePlan v1
-- version 0.29 - Immunization v1
-- version 0.30 - ValueSet v1
-- version 0.31 - ClinicalImpression v1
-- version 0.32 - AdverseEvent v1
-- version 0.33 - Appointment v1
-- version 0.34 - Goal v1
-- version 0.35 - EpisodeOfCare v1
-- version 0.36 - Medication v1
-- version 0.37 - CodeSystem v1
-- version 0.38 - Location v1

DROP TABLE IF EXISTS CodeSystemConceptProperty;
DROP TABLE IF EXISTS CodeSystemConceptDefinition_HTProperty;
DROP TABLE IF EXISTS CodeSystemConcept;
DROP TABLE IF EXISTS CodeSystemConceptDefinition_HTDesignation;
DROP TABLE IF EXISTS CodeSystemDesignation_HT;
DROP TABLE IF EXISTS CodeSystemProperty;
DROP TABLE IF EXISTS CodeSystemProperty_HT;
DROP TABLE IF EXISTS CodeSystemConceptDefinition_HT;
DROP TABLE IF EXISTS CodeSystemFilter_HTOperator;
DROP TABLE IF EXISTS CodeSystemFilter;
DROP TABLE IF EXISTS CodeSystemFilter_HT;
DROP TABLE IF EXISTS CodeSystemJurisdiction;
DROP TABLE IF EXISTS CodeSystemUseContext;
DROP TABLE IF EXISTS CodeSystemContact;
DROP TABLE IF EXISTS ContactDetailContactPoint;
DROP TABLE IF EXISTS CodeSystemIdentifier;
DROP TABLE IF EXISTS CodeSystemConceptProperty_HT;
DROP TABLE IF EXISTS CodeSystem;

DROP TABLE IF EXISTS ConsentProvision_HTData;
DROP TABLE IF EXISTS ConsentProvisionData_HT;
DROP TABLE IF EXISTS ConsentProvision_HTActor;
DROP TABLE IF EXISTS ConsentProvisionActor_HT;
DROP TABLE IF EXISTS ConsentProvision_HTCode;
DROP TABLE IF EXISTS ConsentProvision_HTClass;
DROP TABLE IF EXISTS ConsentProvision_HTPurpose;
DROP TABLE IF EXISTS ConsentProvision_HTSecurityLabel;
DROP TABLE IF EXISTS ConsentProvision_HTProvision;
DROP TABLE IF EXISTS ConsentProvision_HTAction;
DROP TABLE IF EXISTS ConsentVerification;
DROP TABLE IF EXISTS ConsentVerification_HT;
DROP TABLE IF EXISTS ConsentPolicy;
DROP TABLE IF EXISTS ConsentPolicy_HT;
DROP TABLE IF EXISTS ConsentOrganization;
DROP TABLE IF EXISTS ConsentPerformer;
DROP TABLE IF EXISTS ConsentCategory;
DROP TABLE IF EXISTS Consent;
DROP TABLE IF EXISTS ConsentProvision_HT;

DROP TABLE IF EXISTS CompositionCategory;
DROP TABLE IF EXISTS CompositionAuthor;
DROP TABLE IF EXISTS CompositionRelatesTo;
DROP TABLE IF EXISTS CompositionEvent;
DROP TABLE IF EXISTS CompositionSection;
DROP TABLE IF EXISTS CompositionAttester;
DROP TABLE IF EXISTS RelatesTo;
DROP TABLE IF EXISTS Composition;
DROP TABLE IF EXISTS EventCode;
DROP TABLE IF EXISTS EventDetail;
DROP TABLE IF EXISTS [Event];
DROP TABLE IF EXISTS SectionEntry;
DROP TABLE IF EXISTS SectionAuthor;
DROP TABLE IF EXISTS Section;
DROP TABLE IF EXISTS Attester;
DROP TABLE IF EXISTS Narrative;

DROP TABLE IF EXISTS Parameter
DROP TABLE IF EXISTS [Output]
DROP TABLE IF EXISTS Ratio;

DROP TABLE IF EXISTS ClaimItemDetailSubDetail;
DROP TABLE IF EXISTS ClaimItemDetailSubDetail_HTUdi;
DROP TABLE IF EXISTS ClaimItemDetailSubDetail_HTProgramCode;
DROP TABLE IF EXISTS ClaimItemDetailSubDetail_HTModifier;
DROP TABLE IF EXISTS ClaimItemDetailSubDetail_HT;

DROP TABLE IF EXISTS ClaimItemDetail;
DROP TABLE IF EXISTS ClaimItemDetail_HTUdi;
DROP TABLE IF EXISTS ClaimItemDetail_HTProgramCode;
DROP TABLE IF EXISTS ClaimItemDetail_HTModifier;
DROP TABLE IF EXISTS ClaimItemDetail_HT;

DROP TABLE IF EXISTS ClaimItem;
DROP TABLE IF EXISTS ClaimItem_HTEncounter;
DROP TABLE IF EXISTS ClaimItem_HTSubSite;
DROP TABLE IF EXISTS ClaimItem_HTUdi;
DROP TABLE IF EXISTS ClaimItem_HTProgramCode;
DROP TABLE IF EXISTS ClaimItem_HTModifier;
DROP TABLE IF EXISTS ClaimItem_HTInformationSequence;
DROP TABLE IF EXISTS ClaimItem_HTProcedureSequence;
DROP TABLE IF EXISTS ClaimItem_HTDiagnosisSequence;
DROP TABLE IF EXISTS ClaimItem_HTCareTeamSequence;
DROP TABLE IF EXISTS ClaimItem_HT;

DROP TABLE IF EXISTS ClaimAccident;
DROP TABLE IF EXISTS ClaimInsurance;
DROP TABLE IF EXISTS ClaimInsurance_HT;

DROP TABLE IF EXISTS ClaimRelatedClaim;
DROP TABLE IF EXISTS ClaimRelatedClaim_HT;

DROP TABLE IF EXISTS ClaimSupportingInformation;
DROP TABLE IF EXISTS ClaimSupportingInformation_HT;

DROP TABLE IF EXISTS ClaimCareTeam;
DROP TABLE IF EXISTS ClaimCareTeam_HT;

DROP TABLE IF EXISTS ClaimProcedure;
DROP TABLE IF EXISTS ClaimProcedure_HTUdi;
DROP TABLE IF EXISTS ClaimProcedure_HTType;
DROP TABLE IF EXISTS ClaimProcedure_HT;

DROP TABLE IF EXISTS ClaimDiagnosis;
DROP TABLE IF EXISTS ClaimDiagnosis_HTType;
DROP TABLE IF EXISTS ClaimDiagnosis_HT;

DROP TABLE IF EXISTS ClaimPayee;
DROP TABLE IF EXISTS ClaimIdentifier;
DROP TABLE IF EXISTS Claim;

DROP TABLE IF EXISTS PaymentNoticeIdentifier
DROP TABLE IF EXISTS PaymentNotice

DROP TABLE IF EXISTS ValueSetJurisdiction;
DROP TABLE IF EXISTS ValueSetUseContext;
DROP TABLE IF EXISTS ValueSetContact;
DROP TABLE IF EXISTS ValueSetIdentifier;
DROP TABLE IF EXISTS ValueSet;

DROP TABLE IF EXISTS ValueSetConceptReference_HTDesignation;
DROP TABLE IF EXISTS ValueSetConceptSet_HTConcept;
DROP TABLE IF EXISTS ValueSetConceptReference_HT;
DROP TABLE IF EXISTS ValueSetConceptSet_HTFilter;
DROP TABLE IF EXISTS ValueSetFilter_HT;
DROP TABLE IF EXISTS ValueSetCompose_HTExclude;
DROP TABLE IF EXISTS ValueSetCompose_HTInclude;
DROP TABLE IF EXISTS ValueSetConceptSet_HTValueSet;
DROP TABLE IF EXISTS ValueSetConceptSet_HT;
DROP TABLE IF EXISTS ValueSetCompose_HT;
DROP TABLE IF EXISTS ValueSetContains_HTDesignation;
DROP TABLE IF EXISTS ValueSetDesignation_HT;
DROP TABLE IF EXISTS ValueSetExpansion_HTContains;
DROP TABLE IF EXISTS ValueSetContains_HT;
DROP TABLE IF EXISTS ValueSetExpansion_HTParameter;
DROP TABLE IF EXISTS ValueSetParameter_HT;
DROP TABLE IF EXISTS ValueSetExpansion_HT;

DROP TABLE IF EXISTS ContactDetailTelecom;
DROP TABLE IF EXISTS ContactDetail;

DROP TABLE IF EXISTS AvailableTime
DROP TABLE IF EXISTS NotAvailable
DROP TABLE IF EXISTS PractitionerRole

DROP TABLE IF EXISTS Link;
DROP TABLE IF EXISTS Contact;

DROP TABLE IF EXISTS [Money]
DROP TABLE IF EXISTS UsageContext;

CREATE TABLE Link
(
	id UNIQUEIDENTIFIER NOT NULL PRIMARY KEY,
	other_Reference uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Reference(id),
	[type] nvarchar(255) NOT NULL
);

CREATE TABLE [Money]
(
	id UNIQUEIDENTIFIER NOT NULL PRIMARY KEY,
	[value] real,
	currency nvarchar(255)
);

CREATE TABLE Contact
(
	id uniqueidentifier NOT NULL PRIMARY KEY,
	name_HumanName uniqueidentifier FOREIGN KEY REFERENCES HumanName(id),
	address_Address uniqueidentifier FOREIGN KEY REFERENCES [Address](id),
	gender nvarchar(255),
	organisation_Reference uniqueidentifier FOREIGN KEY REFERENCES Reference(id),
	periodStart datetime,
	periodEnd datetime
	-- telecom
	-- relationship
);

CREATE TABLE Narrative
(
	id uniqueidentifier NOT NULL PRIMARY KEY,
	[status] nvarchar(255) NOT NULL,
	div nvarchar(255) NOT NULL
);

CREATE TABLE Attester
(
	id uniqueidentifier NOT NULL PRIMARY KEY,
	mode nvarchar(255) NOT NULL,
	[time] datetime,
	party_Reference uniqueidentifier FOREIGN KEY REFERENCES Reference(id)
);
CREATE TABLE Section
(
	id uniqueidentifier NOT NULL PRIMARY KEY,
	title nvarchar(255),
	code_CodeableConcept uniqueidentifier FOREIGN KEY REFERENCES CodeableConcept(id),
	focus_Reference uniqueidentifier FOREIGN KEY REFERENCES Reference(id),
	text_Narrative uniqueidentifier FOREIGN KEY REFERENCES Narrative(id),
	mode nvarchar(255),
	orderedBy_CodeableConcept uniqueidentifier FOREIGN KEY REFERENCES CodeableConcept(id),
	emptyReason_CodeableConcept uniqueidentifier FOREIGN KEY REFERENCES CodeableConcept(id)
	-- entry
	-- author
);

CREATE TABLE SectionEntry
(
	id_Section uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Section(id),
	id_Reference uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Reference(id),
	CONSTRAINT PK_SectionEntry PRIMARY KEY (id_Section, id_Reference)
);
CREATE TABLE SectionAuthor
(
	id_Section uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Section(id),
	id_Reference uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Reference(id),
	CONSTRAINT PK_SectionAuthor PRIMARY KEY (id_Section, id_Reference)
);
CREATE TABLE [Event]
(
	id uniqueidentifier NOT NULL PRIMARY KEY,
	periodStart datetime,
	periodEnd datetime
	-- code
	-- detail
);

CREATE TABLE EventCode
(
	id_Event uniqueidentifier NOT NULL FOREIGN KEY REFERENCES [Event](id),
	id_CodeableConcept uniqueidentifier NOT NULL FOREIGN KEY REFERENCES CodeableConcept(id),
	CONSTRAINT PK_EventCode PRIMARY KEY (id_Event, id_CodeableConcept)
);

CREATE TABLE EventDetail
(
	id_Event uniqueidentifier NOT NULL FOREIGN KEY REFERENCES [Event](id),
	id_Reference uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Reference(id),
	CONSTRAINT PK_EventDetail PRIMARY KEY (id_Event, id_Reference)
);

CREATE TABLE RelatesTo
(
	id uniqueidentifier NOT NULL PRIMARY KEY,
	code nvarchar(255) NOT NULL,
	--target?
);
CREATE TABLE Composition
(
	id uniqueidentifier NOT NULL PRIMARY KEY,
	[status] nvarchar(255) NOT NULL,
	type_CodeableConcept uniqueidentifier NOT NULL FOREIGN KEY REFERENCES CodeableConcept(id),
	subject_Reference uniqueidentifier FOREIGN KEY REFERENCES Reference(id),
	encounter_Reference uniqueidentifier FOREIGN KEY REFERENCES Reference(id),
	[date] datetime NOT NULL,
	author_Reference uniqueidentifier NOT NULL,
	title nvarchar(255) NOT NULL,
	confidentiality nvarchar(255),
	custodian_Reference uniqueidentifier FOREIGN KEY REFERENCES Reference(id)
	-- category	
	-- relatesTo
	-- event
	-- section
	-- attester
);

CREATE TABLE CompositionAttester
(
	id_Composition uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Composition(id),
	id_Reference uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Reference(id),
	CONSTRAINT PK_CompositionAttester PRIMARY KEY (id_Composition, id_Reference)
);
CREATE TABLE CompositionSection
(
	id_Composition uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Composition(id),
	id_Reference uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Reference(id),
	CONSTRAINT PK_CompositionSection PRIMARY KEY (id_Composition, id_Reference)
);
CREATE TABLE CompositionEvent
(
	id_Composition uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Composition(id),
	id_Reference uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Reference(id),
	CONSTRAINT PK_CompositionEvent PRIMARY KEY (id_Composition, id_Reference)
);
CREATE TABLE CompositionRelatesTo
(
	id_Composition uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Composition(id),
	id_RelatesTo uniqueidentifier NOT NULL FOREIGN KEY REFERENCES RelatesTo(id),
	CONSTRAINT PK_CompositionRelatesTo PRIMARY KEY (id_Composition, id_RelatesTo)
);
CREATE TABLE CompositionAuthor
(
	id_Composition uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Composition(id),
	id_Reference uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Reference(id),
	CONSTRAINT PK_CompositionAuthor PRIMARY KEY (id_Composition, id_Reference)
);
CREATE TABLE CompositionCategory
(
	id_Composition uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Composition(id),
	id_Reference uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Reference(id),
	CONSTRAINT PK_CompositionCategory PRIMARY KEY (id_Composition, id_Reference)
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
	totalValue decimal(18,3),
	totalCurrency nvarchar(255)
);

CREATE TABLE ClaimIdentifier
(
	id_Claim uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Claim(id),
	id_Identifier uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Identifier(id),
	CONSTRAINT PK_ClaimIdentitier PRIMARY KEY (id_Claim, id_Identifier)
);

-- Vurdere om denne skal inkorporeres i Claim da det er 0..1 relasjon
CREATE TABLE ClaimPayee
(
	id uniqueidentifier NOT NULL PRIMARY KEY,
	id_Claim uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Claim(id),
	type_CodeableConcept uniqueidentifier NOT NULL FOREIGN KEY REFERENCES CodeableConcept(id),
	party_Reference uniqueidentifier FOREIGN KEY REFERENCES Reference(id)
);

CREATE TABLE ClaimDiagnosis_HT
(
	id uniqueidentifier NOT NULL PRIMARY KEY,
	[sequence] int NOT NULL,
	--diagnosis_Type uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Type(id),
	-- type
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
	-- type
	[date] datetime,
	--procedure_Type uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Type(id)
	-- udi
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
	--timing_Type uniqueidentifier FOREIGN KEY REFERENCES Type(id),
	--value_Type uniqueidentifier FOREIGN KEY REFERENCES Type(id),
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
	focal bit,
	identifier_Identifier uniqueidentifier FOREIGN KEY REFERENCES Identifier(id),
	coverage_Reference uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Reference(id),
	businessArrangement nvarchar(255),
	preAuthRef nvarchar(255),
	-- Skal v�re 0..*
	claimResponse_Reference uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Reference(id)
);

CREATE TABLE ClaimInsurance
(
	id_ClaimInsurance_HT uniqueidentifier NOT NULL FOREIGN KEY REFERENCES ClaimInsurance_HT(id),
	id_Claim uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Claim(id),
	CONSTRAINT PK_ClaimInsurance PRIMARY KEY (id_ClaimInsurance_HT, id_Claim)
);

-- Vurdere om denne skal inkorporeres i Claim da det er 0..1 relasjon
CREATE TABLE ClaimAccident
(
	id uniqueidentifier NOT NULL PRIMARY KEY,
	id_Claim uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Claim(id),
	[date] date NOT NULL,
	type_CodeableConcept uniqueidentifier FOREIGN KEY REFERENCES CodeableConcept(id),
	--location_Type uniqueidentifier FOREIGN KEY REFERENCES Type(id),
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

CREATE TABLE PaymentNotice
(
	id uniqueidentifier NOT NULL PRIMARY KEY,
	[status] nvarchar(255) NOT NULL,
	-- status
	request_Reference uniqueidentifier FOREIGN KEY REFERENCES Reference(id),
	-- request
	response_Reference uniqueidentifier FOREIGN KEY REFERENCES Reference(id),
	-- response
	created datetime NOT NULL,
	-- created
	provider_Reference uniqueidentifier FOREIGN KEY REFERENCES Reference(id),
	-- provider
	payment_Reference uniqueidentifier FOREIGN KEY REFERENCES Reference(id),
	-- payment
	paymentDate datetime,
	-- paymentDate
	payee_Reference uniqueidentifier FOREIGN KEY REFERENCES Reference(id),
	-- payee
	recipient_Reference uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Reference(id),
	-- recipient
	amount_Money uniqueidentifier NOT NULL FOREIGN KEY REFERENCES [Money](id),
	-- amount (Does table 'Money' exist yet???)
	paymentStatus_CodeableConcept uniqueidentifier FOREIGN KEY REFERENCES CodeableConcept(id),
	-- paymentStatus
)

CREATE TABLE PaymentNoticeIdentifier -- identifier
(
	id_PaymentNotice uniqueidentifier NOT NULL FOREIGN KEY REFERENCES PaymentNotice(id),
	id_Identifier uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Identifier(id),
	CONSTRAINT PK_PaymentNoticeIdentifier PRIMARY KEY (id_PaymentNotice, id_Identifier)
)

CREATE TABLE AdverseEvent
(
	id uniqueidentifier NOT NULL PRIMARY KEY,
	actuality nvarchar(255),
	[event] uniqueidentifier FOREIGN KEY REFERENCES CodeableConcept(id),
	[subject] uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Reference(id),
	encounter uniqueidentifier FOREIGN KEY REFERENCES Reference(id),
	[date] datetime,
	detected datetime,
	recordedDate datetime,
	[location] uniqueidentifier FOREIGN KEY REFERENCES Reference(id),
	seriousness uniqueidentifier FOREIGN KEY REFERENCES CodeableConcept(id),
	severity uniqueidentifier FOREIGN KEY REFERENCES CodeableConcept(id),
	outcome uniqueidentifier FOREIGN KEY REFERENCES CodeableConcept(id),
	recorder uniqueidentifier FOREIGN KEY REFERENCES Reference(id),
)

CREATE TABLE AdverseEventCategory
(
	id_adverseEvent uniqueidentifier NOT NULL FOREIGN KEY REFERENCES AdverseEvent(id),
	id_codeableConcept uniqueidentifier NOT NULL FOREIGN KEY REFERENCES CodeableConcept(id),
	CONSTRAINT PK_AdverseEventCategory PRIMARY KEY (id_adverseEvent, id_codeableConcept),
)

CREATE TABLE AdverseEventResultingCondition
(
	id_adverseEvent uniqueidentifier NOT NULL FOREIGN KEY REFERENCES AdverseEvent(id),
	id_reference uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Reference(id),
	CONSTRAINT PK_AdverseEventResultingCondition PRIMARY KEY (id_adverseEvent, id_reference),
)

CREATE TABLE AdverseEventContributor
(
	id_adverseEvent uniqueidentifier NOT NULL FOREIGN KEY REFERENCES AdverseEvent(id),
	id_reference uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Reference(id),
	CONSTRAINT PK_AdverseEventContributor PRIMARY KEY (id_adverseEvent, id_reference),
)

CREATE TABLE AdverseEventSubjectMedicalHistory
(
	id_adverseEvent uniqueidentifier NOT NULL FOREIGN KEY REFERENCES AdverseEvent(id),
	id_reference uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Reference(id),
	CONSTRAINT PK_AdverseSubjectMedicalHistory PRIMARY KEY (id_adverseEvent, id_reference),
)

CREATE TABLE AdverseEventReferenceDocument
(
	id_adverseEvent uniqueidentifier NOT NULL FOREIGN KEY REFERENCES AdverseEvent(id),
	id_reference uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Reference(id),
	CONSTRAINT PK_AdverseEventReferenceDocument PRIMARY KEY (id_adverseEvent, id_reference),	
)

CREATE TABLE AdverseEventStudy
(
	id_adverseEvent uniqueidentifier NOT NULL FOREIGN KEY REFERENCES AdverseEvent(id),
	id_reference uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Reference(id),
	CONSTRAINT PK_AdverseEventStudy PRIMARY KEY (id_adverseEvent, id_reference),
)

CREATE TABLE AdverseEventSuspectEntity_HT
(
	id uniqueidentifier NOT NULL PRIMARY KEY,
	instance uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Reference(id),
)

CREATE TABLE AdverseEventSuspectEntity
(
	id_adverseEvent uniqueidentifier NOT NULL FOREIGN KEY REFERENCES AdverseEvent(id),
	id_adverseEventSuspectEntity_HT uniqueidentifier NOT NULL FOREIGN KEY REFERENCES AdverseEventSuspectEntity_HT(id),
	CONSTRAINT PK_AdverseEventSuspectEntity PRIMARY KEY (id_adverseEvent, id_adverseEventSuspectEntity_HT)
)


CREATE TABLE AdverseEventCausality_HT
(
	id uniqueidentifier NOT NULL PRIMARY KEY,
	assessment uniqueidentifier FOREIGN KEY REFERENCES CodeableConcept(id),
	productRelatedness nvarchar(255),
	author uniqueidentifier FOREIGN KEY REFERENCES Reference(id),
	method uniqueidentifier FOREIGN KEY REFERENCES CodeableConcept(id),
)

CREATE TABLE AdverseEventSuspectEntity_HTCausality
(
	id_AdverseEventSuspectEntity_HT uniqueidentifier NOT NULL FOREIGN KEY REFERENCES AdverseEventSuspectEntity_HT(id),
	id_AdverseEventCausality_HT uniqueidentifier NOT NULL FOREIGN KEY REFERENCES AdverseEventCausality_HT(id),
	CONSTRAINT PK_AdverseEventSuspetEntity_HTCausality PRIMARY KEY (id_AdverseEventSuspectEntity_HT, id_AdverseEventCausality_HT),
)

CREATE TABLE ConsentProvision_HT
(
	id uniqueidentifier NOT NULL PRIMARY KEY,
	periodStart datetime,
	periodEnd datetime,
	dataPeriodStart datetime,
	dataPeriodEnd datetime
);

CREATE TABLE Consent 
(
	id uniqueidentifier NOT NULL PRIMARY KEY,
	[status] nvarchar(255),
	scope_CodeableConcept uniqueidentifier NOT NULL FOREIGN KEY REFERENCES CodeableConcept(id),
	patient_Reference uniqueidentifier FOREIGN KEY REFERENCES Reference(id),
	[dateTime] dateTime,
	--source[X]
	policyRule_CodeableConcept uniqueidentifier NOT NULL FOREIGN KEY REFERENCES CodeableConcept(id),
	provision_ConsentProvision_HT uniqueidentifier FOREIGN KEY REFERENCES ConsentProvision_HT(id)
);
	
CREATE TABLE ConsentCategory     -- [1..*]?
(
	id_Consent uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Consent(id),
	id_CodeableConcept uniqueidentifier NOT NULL FOREIGN KEY REFERENCES CodeableConcept(id),
	CONSTRAINT PK_ConsentCategory PRIMARY KEY(id_Consent, id_CodeableConcept)
);

CREATE TABLE ConsentPerformer
(
	id_Consent uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Consent(id),
	id_Reference uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Reference(id),
	CONSTRAINT PK_ConsentPerformer PRIMARY KEY(id_Consent, id_Reference)
);

CREATE TABLE ConsentOrganization
(
	id_Consent uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Consent(id),
	id_Reference uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Reference(id),
	CONSTRAINT PK_ConsentOrganization PRIMARY KEY(id_Consent, id_Reference)
);


CREATE TABLE ConsentPolicy_HT
(
	id uniqueidentifier NOT NULL PRIMARY KEY,
	authority nvarchar(255),
	uri nvarchar(255),

);

CREATE TABLE ConsentPolicy 
(
	id_Consent uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Consent(id),
	id_ConsentPolicy_HT uniqueidentifier NOT NULL FOREIGN KEY REFERENCES ConsentPolicy_HT(id),
	CONSTRAINT PK_ConsentPolicy PRIMARY KEY(id_Consent, id_ConsentPolicy_HT)
);

CREATE TABLE ConsentVerification_HT
(
	id uniqueidentifier NOT NULL PRIMARY KEY,
	verified bit NOT NULL,
	verifiedWith_Reference uniqueidentifier FOREIGN KEY REFERENCES Reference(id),
	verificationDate dateTime
);

CREATE TABLE ConsentVerification
(
	id_Consent uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Consent(id),
	id_ConsentVerification_HT uniqueidentifier NOT NULL FOREIGN KEY REFERENCES ConsentVerification_HT(id),
	CONSTRAINT PK_ConsentVerification PRIMARY KEY(id_Consent, id_ConsentVerification_HT)
);

CREATE TABLE ConsentProvision_HTAction
(
	id_ConsentProvision_HT uniqueidentifier FOREIGN KEY REFERENCES ConsentProvision_HT(id),
	id_CodeableConcept uniqueidentifier FOREIGN KEY REFERENCES CodeableConcept(id),
	CONSTRAINT PK_ConsentProvision_HTAction PRIMARY KEY(id_ConsentProvision_HT, id_CodeableConcept)
);

--?????????????????loop provision i provision????????????????????????
CREATE TABLE ConsentProvision_HTProvision
(
	id_ConsentProvision_HT uniqueidentifier FOREIGN KEY REFERENCES ConsentProvision_HT(id),
	id_ConsentProvision_HT2 uniqueidentifier FOREIGN KEY REFERENCES ConsentProvision_HT(id),
	CONSTRAINT PK_ConsentProvision_HTProvision PRIMARY KEY(id_ConsentProvision_HT, id_ConsentProvision_HT2)
);

CREATE TABLE ConsentProvision_HTSecurityLabel
(
	id_ConsentProvision_HT uniqueidentifier FOREIGN KEY REFERENCES ConsentProvision_HT(id),
	id_Coding uniqueidentifier FOREIGN KEY REFERENCES Coding(id),
	CONSTRAINT PK_ConsentProvision_HTSecurityLabel PRIMARY KEY(id_ConsentProvision_HT, id_Coding)
);

CREATE TABLE ConsentProvision_HTPurpose
(
	id_ConsentProvision_HT uniqueidentifier FOREIGN KEY REFERENCES ConsentProvision_HT(id),
	id_Coding uniqueidentifier FOREIGN KEY REFERENCES Coding(id),
	CONSTRAINT PK_ConsentProvision_HTPurpose PRIMARY KEY(id_ConsentProvision_HT, id_Coding)
);

CREATE TABLE ConsentProvision_HTClass
(
	id_ConsentProvision_HT uniqueidentifier FOREIGN KEY REFERENCES ConsentProvision_HT(id),
	id_Coding uniqueidentifier FOREIGN KEY REFERENCES Coding(id),
	CONSTRAINT PK_ConsentProvision_HTClass PRIMARY KEY(id_ConsentProvision_HT, id_Coding)
);


CREATE TABLE ConsentProvision_HTCode
(
	id_ConsentProvision_HT uniqueidentifier FOREIGN KEY REFERENCES ConsentProvision_HT(id),
	id_CodeableConcept uniqueidentifier FOREIGN KEY REFERENCES CodeableConcept(id),
	CONSTRAINT PK_ConsentProvision_HTCode PRIMARY KEY(id_ConsentProvision_HT, id_CodeableConcept)
);

CREATE TABLE ConsentProvisionActor_HT
(
	id uniqueidentifier NOT NULL PRIMARY KEY,
	role_CodeableConcept uniqueidentifier NOT NULL FOREIGN KEY REFERENCES CodeableConcept(id),
	reference_Reference uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Reference(id)
);

CREATE TABLE ConsentProvision_HTActor
(
	id_ConsentProvision_HT uniqueidentifier FOREIGN KEY REFERENCES ConsentProvision_HT(id),
	id_ConsentProvisionActor_HT uniqueidentifier FOREIGN KEY REFERENCES ConsentProvisionActor_HT(id),
	CONSTRAINT PK_ConsentProvision_HTActor PRIMARY KEY(id_ConsentProvision_HT, id_ConsentProvisionActor_HT)
);

CREATE TABLE ConsentProvisionData_HT
(
	id uniqueidentifier NOT NULL PRIMARY KEY,
	meaning nvarchar(255) NOT NULL,
	reference_Reference uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Reference(id)
);

CREATE TABLE ConsentProvision_HTData
(
	id_ConsentProvision_HT uniqueidentifier FOREIGN KEY REFERENCES ConsentProvision_HT(id),
	id_ConsentProvisionData_HT uniqueidentifier FOREIGN KEY REFERENCES ConsentProvisionData_HT(id),
	CONSTRAINT PK_ConsentProvision_HTData PRIMARY KEY(id_ConsentProvision_HT, id_ConsentProvisionData_HT)
);


CREATE TABLE CodeSystem
(
    id uniqueidentifier NOT NULL PRIMARY KEY,
    url_uri uniqueidentifier FOREIGN KEY REFERENCES uri(id),
    [version] nvarchar(255),
    [name] nvarchar(255),
    title nvarchar(255),
    [status] nvarchar(255) NOT NULL,
    experimental bit,
    [date] datetime,
    publisher nvarchar(255),
    [description] nvarchar(255),
    purpose nvarchar(255),
    copyright nvarchar(255),
    caseSensitive bit,
    valueSet_Canonical uniqueidentifier FOREIGN KEY REFERENCES Canonical(id),
    hierarchyMeaning nvarchar(255),
    compositional bit,
    versionNeeded bit,
    content nvarchar(255),
    supplements_Canonical uniqueidentifier FOREIGN KEY REFERENCES Canonical(id),
    [count] int,   
);

CREATE TABLE CodeSystemIdentifier
(
    id_CodeSystem uniqueidentifier NOT NULL FOREIGN KEY REFERENCES CodeSystem(id),
	id_Identifier uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Identifier(id),
	CONSTRAINT PK_CodeSystemIdentifier PRIMARY KEY (id_CodeSystem, id_Identifier)
);

CREATE TABLE ContactDetail
(
    id uniqueidentifier NOT NULL PRIMARY KEY,
    [name] nvarchar(255),
    telecom_ContactPoint uniqueidentifier NOT NULL FOREIGN KEY REFERENCES ContactPoint(id)
);

CREATE TABLE ContactDetailContactPoint
(
    id_ContactDetail uniqueidentifier NOT NULL FOREIGN KEY REFERENCES ContactDetail(id),
	id_ContactPoint uniqueidentifier NOT NULL FOREIGN KEY REFERENCES ContactPoint(id),
	CONSTRAINT PK_ContactDetailContactPoint PRIMARY KEY (id_ContactDetail, id_ContactPoint)
);

CREATE TABLE CodeSystemContact
(
    id_CodeSystem uniqueidentifier NOT NULL FOREIGN KEY REFERENCES CodeSystem(id),
	id_ContactDetail uniqueidentifier NOT NULL FOREIGN KEY REFERENCES ContactDetail(id),
	CONSTRAINT PK_CodeSystemContact PRIMARY KEY (id_CodeSystem, id_ContactDetail)
);

CREATE TABLE UsageContext
(
    id uniqueidentifier NOT NULL PRIMARY KEY,
    code_Coding uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Coding(id),
);

CREATE TABLE CodeSystemUseContext
(
    id_CodeSystem uniqueidentifier NOT NULL FOREIGN KEY REFERENCES CodeSystem(id),
	id_UsageContext uniqueidentifier NOT NULL FOREIGN KEY REFERENCES UsageContext(id),
	CONSTRAINT PK_CodeSystemUseContext PRIMARY KEY (id_CodeSystem, id_UsageContext)
);

CREATE TABLE CodeSystemJurisdiction
(
    id_CodeSystem uniqueidentifier NOT NULL FOREIGN KEY REFERENCES CodeSystem(id),
	id_CodeableConcept uniqueidentifier NOT NULL FOREIGN KEY REFERENCES CodeableConcept(id),
	CONSTRAINT PK_CodeSystemJurisdiction PRIMARY KEY (id_CodeSystem, id_CodeableConcept)
);

CREATE TABLE CodeSystemFilter_HT
(
    id uniqueidentifier NOT NULL PRIMARY KEY, 
    code nvarchar(255),
    [description] nvarchar(255),
    [value] nvarchar(255) NOT NULL,
	operator nvarchar(255) NOT NULL
);

CREATE TABLE CodeSystemFilter
(
	id_CodeSystem uniqueidentifier NOT NULL FOREIGN KEY REFERENCES CodeSystem(id),
	id_CodeSystemFilter_HT uniqueidentifier NOT NULL FOREIGN KEY REFERENCES CodeSystemFilter_HT(id),
	CONSTRAINT PK_CodeSystemFilter PRIMARY KEY (id_CodeSystem, id_CodeSystemFilter_HT)
);


CREATE TABLE CodeSystemProperty_HT
(
    id uniqueidentifier NOT NULL PRIMARY KEY,
    code nvarchar(255) NOT NULL,
    uri_Uri uniqueidentifier FOREIGN KEY REFERENCES Uri(id),
    [description] nvarchar(255),
    type nvarchar(255) NOT NULL 
);

CREATE TABLE CodeSystemProperty
(
    id_CodeSystem uniqueidentifier NOT NULL FOREIGN KEY REFERENCES CodeSystem(id),
    id_CodeSystemProperty_HT uniqueidentifier NOT NULL FOREIGN KEY REFERENCES CodeSystemProperty_HT(id),
    CONSTRAINT PK_CodeSystemProperty PRIMARY KEY (id_CodeSystem, id_CodeSystemProperty_HT)
);

CREATE TABLE CodeSystemDesignation_HT
(
    id uniqueidentifier NOT NULL PRIMARY KEY,
    language nvarchar(255),
    use_Coding uniqueidentifier FOREIGN KEY REFERENCES Coding(id),
    value nvarchar(255) NOT NULL
);

CREATE TABLE CodeSystemConceptDefinition_HT
(
    id uniqueidentifier NOT NULL PRIMARY KEY,
    code nvarchar(255) NOT NULL,
    display nvarchar(255),
    [definition] nvarchar(255)
);

CREATE TABLE CodeSystemConceptProperty_HT
(
    id uniqueidentifier NOT NULL PRIMARY KEY, 
    code nvarchar(255) NOT NULL
);

CREATE TABLE CodeSystemConceptDefinition_HTProperty
(
    id_CodeSystemConceptDefinition_HT uniqueidentifier NOT NULL FOREIGN KEY REFERENCES CodeSystemConceptDefinition_HT(id),
    id_CodeSystemConceptDefinition_HTProperty uniqueidentifier NOT NULL FOREIGN KEY REFERENCES CodeSystemConceptProperty_HT(id),
    CONSTRAINT PK_CodeSystemConceptDefinition_HTProperty PRIMARY KEY (id_CodeSystemConceptDefinition_HT, id_CodeSystemConceptDefinition_HTProperty)
);

CREATE TABLE CodeSystemConceptDefinition_HTDesignation
(
    id_CodeSystemConceptDefinition_HT uniqueidentifier NOT NULL FOREIGN KEY REFERENCES CodeSystemConceptDefinition_HT(id),
    id_CodeSystemConceptDefinition_HTDesignation uniqueidentifier NOT NULL FOREIGN KEY REFERENCES CodeSystemDesignation_HT(id),
    CONSTRAINT PK_CodeSystemConceptDefinition_HTDesignation PRIMARY KEY (id_CodeSystemConceptDefinition_HT, id_CodeSystemConceptDefinition_HTDesignation)
);

CREATE TABLE CodeSystemConcept
(
    id_CodeSystem uniqueidentifier NOT NULL FOREIGN KEY REFERENCES CodeSystem(id),
    id_CodeSystemConceptDefinition_HT uniqueidentifier NOT NULL FOREIGN KEY REFERENCES CodeSystemConceptDefinition_HT(id),
    CONSTRAINT PK_CodeSystemConcept PRIMARY KEY (id_CodeSystem, id_CodeSystemConceptDefinition_HT)
);

CREATE TABLE ContactDetailTelecom
(
	id_ContactDetail uniqueidentifier FOREIGN KEY REFERENCES ContactDetail(id),
	id_ContactPoint uniqueidentifier FOREIGN KEY REFERENCES ContactPoint(id),
	CONSTRAINT PK_ContactDetailTelecom						PRIMARY KEY (id_ContactDetail, id_ContactPoint)
);


----------------------------------------------------------------------------------------------

CREATE TABLE ValueSetExpansion_HT
(
	id uniqueidentifier NOT NULL PRIMARY KEY,
	identifier_Uri uniqueidentifier,
	[timestamp] datetime NOT NULL,
	total int,
	offset int
);

CREATE TABLE ValueSetParameter_HT
(
	id uniqueidentifier NOT NULL PRIMARY KEY,
	[name] nvarchar(255) NOT NULL,
	-- value[x]				av typen Type[0..1]		
);

CREATE TABLE ValueSetExpansion_HTParameter -- Denne typen syntaks var brukt for Claim-ressursen bla. Relasjonen er fra HT Paramteter til HT Expansion
(
	id_ValueSetExpansion_HT uniqueidentifier NOT NULL FOREIGN KEY REFERENCES ValueSetExpansion_HT(id),
	id_ValueSetParameter_HT uniqueidentifier NOT NULL FOREIGN KEY REFERENCES ValueSetParameter_HT(id),
	CONSTRAINT PK_ValueSetExpansionParameter							PRIMARY KEY (id_ValueSetExpansion_HT, id_ValueSetParameter_HT)
);

CREATE TABLE ValueSetContains_HT
(
	id uniqueidentifier NOT NULL PRIMARY KEY,
	system_Uri uniqueidentifier FOREIGN KEY REFERENCES Uri(id),
	abstract bit,
	inactive bit,
	[version] nvarchar(255),
	[code] nvarchar(255),
	display nvarchar(255)
);

CREATE TABLE ValueSetExpansion_HTContains
(
	id_ValueSetExpansion_HT uniqueidentifier NOT NULL FOREIGN KEY REFERENCES ValueSetExpansion_HT(id),
	id_ValueSetContains_HT uniqueidentifier NOT NULL FOREIGN KEY REFERENCES ValueSetContains_HT(id),
	CONSTRAINT PK_ValueSetExpansion_HTContains						PRIMARY KEY (id_ValueSetExpansion_HT, id_ValueSetContains_HT)
);

CREATE TABLE ValueSetDesignation_HT
(
	id uniqueidentifier NOT NULL PRIMARY KEY,
	[language] nvarchar(255),
	use_Coding uniqueidentifier FOREIGN KEY REFERENCES Coding(id),
	[value] nvarchar(255) NOT NULL
);

CREATE TABLE ValueSetContains_HTDesignation
(
	id_ValueSetContains_HT uniqueidentifier NOT NULL FOREIGN KEY REFERENCES ValueSetContains_HT(id),
	id_ValueSetDesignation_HT uniqueidentifier NOT NULL FOREIGN KEY REFERENCES ValueSetDesignation_HT(id),
	CONSTRAINT PK_ValueSetContains_HTDesignation				PRIMARY KEY(id_ValueSetContains_HT, id_ValueSetDesignation_HT)
);

CREATE TABLE ValueSetCompose_HT
(
	id uniqueidentifier NOT NULL PRIMARY KEY,
	lockedDate date,
	inactive bit
);

CREATE TABLE ValueSetConceptSet_HT
(
	id uniqueidentifier NOT NULL PRIMARY KEY,
	system_Uri uniqueidentifier FOREIGN KEY REFERENCES Uri(id),
	[version] nvarchar(255)
);

CREATE TABLE ValueSetConceptSet_HTValueSet
(
	id_ValueSetConceptSet_HT uniqueidentifier NOT NULL FOREIGN KEY REFERENCES ValueSetConceptSet_HT(id),
	id_Canonical uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Canonical(id),
	CONSTRAINT PK_ValueSetConceptSet_HTValueSet					PRIMARY KEY (id_ValueSetConceptSet_HT, id_Canonical)
);

CREATE TABLE ValueSetCompose_HTInclude -- Dette skal egentlig v?re en [1,*]-relasjon
(
	id_ValueSetCompose_HT uniqueidentifier NOT NULL FOREIGN KEY REFERENCES ValueSetCompose_HT(id),
	id_ValueSetConceptSet_HT uniqueidentifier NOT NULL FOREIGN KEY REFERENCES ValueSetConceptSet_HT(id),
	CONSTRAINT PK_ValueSetCompose_HTInclude						PRIMARY KEY (id_ValueSetCompose_HT, id_ValueSetConceptSet_HT)
);

CREATE TABLE ValueSetCompose_HTExclude
(
	id_ValueSetCompose_HT uniqueidentifier NOT NULL FOREIGN KEY REFERENCES ValueSetCompose_HT(id),
	id_ValueSetConceptSet_HT uniqueidentifier NOT NULL FOREIGN KEY REFERENCES ValueSetConceptSet_HT(id),
	CONSTRAINT PK_ValueSetCompose_HTExclude						PRIMARY KEY (id_ValueSetCompose_HT, id_ValueSetConceptSet_HT)
);

CREATE TABLE ValueSetFilter_HT
(
	id uniqueidentifier NOT NULL PRIMARY KEY,
	property nvarchar(255) NOT NULL,
	op nvarchar(255) NOT NULL,
	[value] nvarchar(255) NOT NULL
);

CREATE TABLE ValueSetConceptSet_HTFilter
(
	id_ValueSetConceptSet_HT uniqueidentifier NOT NULL FOREIGN KEY REFERENCES ValueSetConceptSet_HT(id),
	id_ValueSetFilter_HT uniqueidentifier NOT NULL FOREIGN KEY REFERENCES ValueSetFilter_HT(id),
	CONSTRAINT PK_ValueSetConceptSet_HTFilter					PRIMARY KEY (id_ValueSetConceptSet_HT, id_ValueSetFilter_HT)
);

CREATE TABLE ValueSetConceptReference_HT
(
	id uniqueidentifier NOT NULL PRIMARY KEY,
	[code] nvarchar(255) NOT NULL,
	display nvarchar(255)
);

CREATE TABLE ValueSetConceptSet_HTConcept
(
	id_ValueSetConceptSet_HT uniqueidentifier NOT NULL FOREIGN KEY REFERENCES ValueSetConceptSet_HT(id),
	id_ValueSetConceptReference_HT uniqueidentifier NOT NULL FOREIGN KEY REFERENCES ValueSetConceptReference_HT(id),
	CONSTRAINT PK_ValueSetConceptSet_HTConcept						PRIMARY KEY (id_ValueSetConceptSet_HT, id_ValueSetConceptReference_HT)
);

CREATE TABLE ValueSetConceptReference_HTDesignation
(
	id_ValueSetConceptReference_HT uniqueidentifier NOT NULL FOREIGN KEY REFERENCES ValueSetConceptReference_HT(id),
	id_ValueSetDesignation_HT uniqueidentifier NOT NULL FOREIGN KEY REFERENCES ValueSetDesignation_HT(id),
	CONSTRAINT PK_ValueSetConceptReference_HTDesignation			PRIMARY KEY (id_ValueSetConceptReference_HT, id_ValueSetDesignation_HT)
);

--------------------------------------------------------------------------------------------

CREATE TABLE ValueSet
(
	id uniqueidentifier NOT NULL PRIMARY KEY,
	url_Uri uniqueidentifier FOREIGN KEY REFERENCES Uri(id),
	[version] nvarchar(255),
	[name] nvarchar(255),
	title nvarchar(255),
	[status] nvarchar(255) NOT NULL,
	experimental bit,
	[date] datetime,
	publisher nvarchar(255),
	[description] nvarchar(255),
	-- OBS: Denne er av typen "markdown[0..1]" som er en type string
	immutable bit,
	purpose nvarchar(255),
	-- OBS: Denne er av typen "markdown[0..1]" som er en type string
	copyright nvarchar(255),
	-- OBS: Denne er av typen "markdown[0..1]" som er en type string
	expansion_ValueSetExpansion_HT uniqueidentifier FOREIGN KEY REFERENCES ValueSetExpansion_HT(id),
	compose_ValueSetCompose_HT uniqueidentifier FOREIGN KEY REFERENCES ValueSetCompose_HT(id)
);

CREATE TABLE ValueSetIdentifier
(
	id_ValueSet uniqueidentifier NOT NULL FOREIGN KEY REFERENCES ValueSet(id),
	id_Identifier uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Identifier(id),
	CONSTRAINT PK_ValueSetIdentifier						PRIMARY KEY (id_ValueSet, id_Identifier)
);

CREATE TABLE ValueSetContact
(
	id_ValueSet uniqueidentifier NOT NULL FOREIGN KEY REFERENCES ValueSet(id),
	id_ContactDetail uniqueidentifier NOT NULL FOREIGN KEY REFERENCES ContactDetail(id),
	CONSTRAINT PK_ValueSetContact							PRIMARY KEY (id_ValueSet, id_ContactDetail)
);

CREATE TABLE ValueSetUseContext
(
	id_ValueSet uniqueidentifier NOT NULL FOREIGN KEY REFERENCES ValueSet(id),
	id_UsageContext uniqueidentifier NOT NULL FOREIGN KEY REFERENCES UsageContext(id),
	CONSTRAINT PK_ValueSetUsageContext						PRIMARY KEY (id_ValueSet, id_UsageContext)
);

CREATE TABLE ValueSetJurisdiction
(
	id_ValueSet uniqueidentifier NOT NULL FOREIGN KEY REFERENCES ValueSet(id),
	id_CodeableConcept uniqueidentifier NOT NULL FOREIGN KEY REFERENCES CodeableConcept(id),
	CONSTRAINT PK_ValueSetJurisdiction						PRIMARY KEY (id_ValueSet, id_CodeableConcept)
);