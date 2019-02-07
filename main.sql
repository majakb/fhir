
-- localPath
:setvar localPath C:\Users\qb528qn\Documents\Puppet\

-- Dropping all tables
:r $(localPath)31_supplyRequest\dropSupplyRequest.sql
:r $(localPath)30_deviceRequest\dropDeviceRequest.sql
:r $(localPath)29_serviceRequest\dropServiceRequest.sql
:r $(localPath)28_goal\dropGoal.sql
:r $(localPath)27_careTeam\dropCareTeam.sql
:r $(localPath)26_carePlan\dropCarePlan.sql
:r $(localPath)25_immunization\dropImmunization.sql
:r $(localPath)24_medication\dropMedication.sql
:r $(localPath)23_medicationStatement\dropMedicationStatement.sql
:r $(localPath)21_diagnosticReport\dropDiagnosticReport.sql
:r $(localPath)20_observation\dropObservation.sql
:r $(localPath)18_procedure\dropProcedure.sql
:r $(localPath)17_condition\dropCondition.sql
:r $(localPath)16_adverseEvent\dropAdverseEvent.sql
:r $(localPath)15_allergyIntolerance\dropAllergyIntolerance.sql
:r $(localPath)14_episodeOfCare\dropEpisodeOfCare.sql
:r $(localPath)13_encounter\dropEncounter.sql
:r $(localPath)12_schedule\dropSchedule.sql
:r $(localPath)11_appointment\dropAppointment.sql
:r $(localPath)10_task\dropTask.sql
:r $(localPath)08_location\dropLocation.sql
:r $(localPath)07_organization\dropOrganization.sql
:r $(localPath)06_person\dropPerson.sql
:r $(localPath)05_relatedPerson\dropRelatedPerson.sql
:r $(localPath)04_practitionerRole\dropPractitionerRole.sql
:r $(localPath)03_practitioner\dropPractitioner.sql
:r $(localPath)02_patient\dropPatient.sql
:r $(localPath)01_baseTables\dropBaseTables.sql

-- Create tables
:r $(localPath)01_baseTables\createBaseTables.sql
:r $(localPath)02_patient\createPatient.sql
:r $(localPath)03_practitioner\createPractitioner.sql
:r $(localPath)04_practitionerRole\createPractitionerRole.sql
:r $(localPath)05_relatedPerson\createRelatedPerson.sql
:r $(localPath)06_person\createPerson.sql
:r $(localPath)07_organization\createOrganization.sql
:r $(localPath)08_location\createLocation.sql
:r $(localPath)10_task\createTask.sql
:r $(localPath)11_appointment\createAppointment.sql
:r $(localPath)12_schedule\createSchedule.sql
:r $(localPath)13_encounter\createEncounter.sql
:r $(localPath)14_episodeOfCare\createEpisodeOfCare.sql
:r $(localPath)15_allergyIntolerance\createAllergyIntolerance.sql
:r $(localPath)16_adverseEvent\createAdverseEvent.sql
:r $(localPath)17_condition\createCondition.sql
:r $(localPath)18_procedure\createProcedure.sql
:r $(localPath)19_clinicalImpression\dropClinicalImpression.sql
:r $(localPath)20_observation\createObservation.sql
:r $(localPath)21_diagnosticReport\createDiagnosticReport.sql
:r $(localPath)23_medicationStatement\createMedicationStatement.sql
:r $(localPath)24_medication\createMedication.sql
:r $(localPath)25_immunization\createImmunization.sql
:r $(localPath)26_carePlan\createCarePlan.sql
:r $(localPath)27_careTeam\createCareTeam.sql
:r $(localPath)28_goal\createGoal.sql
:r $(localPath)29_serviceRequest\createServiceRequest.sql
:r $(localPath)30_deviceRequest\createDeviceRequest.sql
:r $(localPath)31_supplyRequest\createSupplyRequest.sql