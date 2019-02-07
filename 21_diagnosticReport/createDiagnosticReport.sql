CREATE TABLE DiagnosticReport
(
	id uniqueidentifier NOT NULL PRIMARY KEY,
	[status] nvarchar(255) NOT NULL,
	code_CodeableConcept uniqueidentifier NOT NULL FOREIGN KEY REFERENCES CodeableConcept(id),
	subject_Reference uniqueidentifier FOREIGN KEY REFERENCES Reference(id),
	encounter_Reference uniqueidentifier FOREIGN KEY REFERENCES Reference(id),
	-- effective[x]: Type[0..1]
	issued datetime,
	conclusion nvarchar(255)
	-- presentedForm
	-- conclusionCode
	-- imagingStudy
	-- result
	-- specimen
	-- resultsInterpreter
	-- performer
	-- category
	-- basedOn
	-- media
);

CREATE TABLE DiagnosticReportBasedOn
(
	id_DiagnosticReport uniqueidentifier NOT NULL FOREIGN KEY REFERENCES DiagnosticReport(id),
	id_Reference uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Reference(id),
	CONSTRAINT PK_DiagnosticReportBasedOn								PRIMARY KEY (id_DiagnosticReport, id_Reference)
);

CREATE TABLE DiagnosticReportCategory
(
	id_DiagnosticReport uniqueidentifier NOT NULL FOREIGN KEY REFERENCES DiagnosticReport(id),
	id_CodeableConcept uniqueidentifier NOT NULL FOREIGN KEY REFERENCES CodeableConcept(id),
	CONSTRAINT PK_DiagnosticReportCategory								PRIMARY KEY (id_DiagnosticReport, id_CodeableConcept)
);

CREATE TABLE DiagnosticReportPerformer
(
	id_DiagnosticReport uniqueidentifier NOT NULL FOREIGN KEY REFERENCES DiagnosticReport(id),
	id_Reference uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Reference(id),
	CONSTRAINT PK_DiagnosticReportPerformer								PRIMARY KEY (id_DiagnosticReport, id_Reference)
);

CREATE TABLE DiagnosticReportResultsInterpreter
(
	id_DiagnosticReport uniqueidentifier NOT NULL FOREIGN KEY REFERENCES DiagnosticReport(id),
	id_Reference uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Reference(id),
	CONSTRAINT PK_DiagnosticReportResultsInterpreter					PRIMARY KEY (id_DiagnosticReport, id_Reference)
);

CREATE TABLE DiagnosticReportSpecimen
(
	id_DiagnosticReport uniqueidentifier NOT NULL FOREIGN KEY REFERENCES DiagnosticReport(id),
	id_Reference uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Reference(id),
	CONSTRAINT PK_DiagnosticReportSpecimen								PRIMARY KEY (id_DiagnosticReport, id_Reference)
);

CREATE TABLE DiagnosticReportResult
(
	id_DiagnosticReport uniqueidentifier NOT NULL FOREIGN KEY REFERENCES DiagnosticReport(id),
	id_Reference uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Reference(id),
	CONSTRAINT PK_DiagnosticReportResult								PRIMARY KEY (id_DiagnosticReport, id_Reference)
);

CREATE TABLE DiagnosticReportImagingStudy
(
	id_DiagnosticReport uniqueidentifier NOT NULL FOREIGN KEY REFERENCES DiagnosticReport(id),
	id_Reference uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Reference(id),
	CONSTRAINT PK_DiagnosticReportImagingStudy PRIMARY KEY (id_DiagnosticReport, id_Reference)
);

CREATE TABLE DiagnosticReportConclusionCode
(
	id_DiagnosticReport uniqueidentifier NOT NULL FOREIGN KEY REFERENCES DiagnosticReport(id),
	id_CodeableConcept uniqueidentifier NOT NULL FOREIGN KEY REFERENCES CodeableConcept(id),
	CONSTRAINT PK_DiagnosticReportConclusionCode						PRIMARY KEY (id_DiagnosticReport, id_CodeableConcept)
);

CREATE TABLE DiagnosticReportPresentedForm
(
	id_DiagnosticReport uniqueidentifier NOT NULL FOREIGN KEY REFERENCES DiagnosticReport(id),
	id_Attachment uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Attachment(id),
	CONSTRAINT PK_DiagnosticReportPresentedForm							PRIMARY KEY (id_DiagnosticReport, id_Attachment)
);

-- Hjelpetabeller og tilhørende referanser

CREATE TABLE DiagnosticReportMedia_HT
(
	id uniqueidentifier NOT NULL PRIMARY KEY,
	comment nvarchar(255),
	link uniqueidentifier NOT NULL FOREIGN KEY REFERENCES Media(id) -- Denne tror jeg kanskje er feil. Er av typen Reference [1..1] <<Media>>
);

CREATE TABLE DiagnosticReportMedia
(
	id_DiagnosticReport uniqueidentifier NOT NULL FOREIGN KEY REFERENCES DiagnosticReport(id),
	id_DiagnosticReportMedia_HT uniqueidentifier FOREIGN KEY REFERENCES DiagnosticReportMedia_HT(id),
	CONSTRAINT PK_DiagnosticReportMedia PRIMARY KEY (id_DiagnosticReport, id_DiagnosticReportMedia_HT)
);



