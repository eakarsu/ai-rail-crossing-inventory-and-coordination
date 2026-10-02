-- CreateEnum
CREATE TYPE "Role" AS ENUM ('ADMIN', 'MANAGER', 'ANALYST');

-- CreateTable
CREATE TABLE "User" (
    "active" BOOLEAN NOT NULL DEFAULT true,
    "id" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "passwordHash" TEXT NOT NULL,
    "role" "Role" NOT NULL DEFAULT 'ANALYST',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "AuditLog" (
    "id" TEXT NOT NULL,
    "actorId" TEXT,
    "actorName" TEXT,
    "action" TEXT NOT NULL,
    "entity" TEXT NOT NULL,
    "entityId" TEXT,
    "detail" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "AuditLog_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "WorkflowAnalysis" (
    "id" TEXT NOT NULL,
    "actorId" TEXT NOT NULL,
    "workflow" TEXT NOT NULL,
    "subjectEntity" TEXT NOT NULL,
    "subjectId" TEXT NOT NULL,
    "input" JSONB NOT NULL,
    "evidence" JSONB NOT NULL,
    "evidenceHash" TEXT NOT NULL,
    "result" JSONB NOT NULL,
    "model" TEXT NOT NULL,
    "receipt" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "WorkflowAnalysis_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RecordReview" (
    "id" TEXT NOT NULL,
    "actorId" TEXT NOT NULL,
    "entity" TEXT NOT NULL,
    "entityId" TEXT NOT NULL,
    "version" TEXT NOT NULL,
    "reason" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "RecordReview_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "UsageBucket" (
    "id" TEXT NOT NULL,
    "calls" INTEGER NOT NULL,

    CONSTRAINT "UsageBucket_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "IssuedCredential" (
    "token" TEXT NOT NULL,
    "entity" TEXT NOT NULL,
    "entityId" TEXT NOT NULL,
    "version" TEXT NOT NULL,
    "assertion" JSONB NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "revokedAt" TIMESTAMP(3),

    CONSTRAINT "IssuedCredential_pkey" PRIMARY KEY ("token")
);

-- CreateTable
CREATE TABLE "DomainArtifact" (
    "id" TEXT NOT NULL,
    "subjectEntity" TEXT NOT NULL,
    "subjectId" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "content" TEXT NOT NULL,
    "contentHash" TEXT NOT NULL,
    "actorId" TEXT NOT NULL,
    "approvedBy" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "DomainArtifact_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RecordApproval" (
    "id" TEXT NOT NULL,
    "version" TEXT NOT NULL,

    CONSTRAINT "RecordApproval_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "DomainExecution" (
    "id" TEXT NOT NULL,
    "actorId" TEXT NOT NULL,
    "connectorId" TEXT NOT NULL,
    "action" TEXT NOT NULL,
    "subjectEntity" TEXT NOT NULL,
    "subjectId" TEXT NOT NULL,
    "version" TEXT NOT NULL,
    "status" TEXT NOT NULL,
    "result" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "DomainExecution_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "WorkSession" (
    "id" TEXT NOT NULL,
    "actorId" TEXT NOT NULL,
    "respondentId" TEXT NOT NULL,
    "subjectEntity" TEXT NOT NULL,
    "subjectId" TEXT NOT NULL,
    "questions" JSONB NOT NULL,
    "answers" JSONB NOT NULL,
    "currentQuestion" TEXT,
    "status" TEXT NOT NULL,
    "deadline" TIMESTAMP(3) NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "WorkSession_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "SessionMedia" (
    "id" TEXT NOT NULL,
    "sessionId" TEXT NOT NULL,
    "questionId" TEXT NOT NULL,
    "actorId" TEXT NOT NULL,
    "contentType" TEXT NOT NULL,
    "bytes" BYTEA NOT NULL,
    "contentHash" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "SessionMedia_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "AppSetting" (
    "id" TEXT NOT NULL,
    "value" JSONB NOT NULL,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "AppSetting_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CrossingProgram" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "authority" TEXT NOT NULL,
    "region" TEXT NOT NULL,
    "coordinator" TEXT NOT NULL,
    "reportingYear" INTEGER NOT NULL,
    "reviewAt" TIMESTAMP(3) NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "CrossingProgram_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RailCrossing" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "crossingNumber" TEXT NOT NULL,
    "road" TEXT NOT NULL,
    "railroad" TEXT NOT NULL,
    "latitude" DOUBLE PRECISION NOT NULL,
    "longitude" DOUBLE PRECISION NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "crossingProgramId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "RailCrossing_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CrossingOwner" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "railCrossingId" TEXT NOT NULL,
    "party" TEXT NOT NULL,
    "responsibility" TEXT NOT NULL,
    "agreementReference" TEXT NOT NULL,
    "effectiveAt" TIMESTAMP(3) NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "crossingProgramId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "CrossingOwner_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "WarningDevice" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "railCrossingId" TEXT NOT NULL,
    "deviceType" TEXT NOT NULL,
    "serialNumber" TEXT NOT NULL,
    "installedAt" TIMESTAMP(3) NOT NULL,
    "testedAt" TIMESTAMP(3) NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "crossingProgramId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "WarningDevice_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CrossingInspection" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "railCrossingId" TEXT NOT NULL,
    "inspectedAt" TIMESTAMP(3) NOT NULL,
    "inspector" TEXT NOT NULL,
    "observations" TEXT NOT NULL,
    "nextDueAt" TIMESTAMP(3) NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "crossingProgramId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "CrossingInspection_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "TrafficObservation" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "railCrossingId" TEXT NOT NULL,
    "observedAt" TIMESTAMP(3) NOT NULL,
    "roadVehicles" INTEGER NOT NULL,
    "trains" INTEGER NOT NULL,
    "method" TEXT NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "crossingProgramId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "TrafficObservation_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CrossingProject" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "railCrossingId" TEXT NOT NULL,
    "scope" TEXT NOT NULL,
    "roadAuthority" TEXT NOT NULL,
    "railAuthority" TEXT NOT NULL,
    "budgetCents" INTEGER NOT NULL,
    "dueAt" TIMESTAMP(3) NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "crossingProgramId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "CrossingProject_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "InventoryChange" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "railCrossingId" TEXT NOT NULL,
    "fieldName" TEXT NOT NULL,
    "previousValue" TEXT NOT NULL,
    "proposedValue" TEXT NOT NULL,
    "sourceReference" TEXT NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "crossingProgramId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "InventoryChange_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CrossingSubmission" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "railCrossingId" TEXT NOT NULL,
    "submittedAt" TIMESTAMP(3) NOT NULL,
    "submitter" TEXT NOT NULL,
    "submissionReference" TEXT NOT NULL,
    "receipt" TEXT,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "crossingProgramId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "CrossingSubmission_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "OperationalTask" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "owner" TEXT NOT NULL,
    "priority" TEXT NOT NULL,
    "startAt" TIMESTAMP(3) NOT NULL,
    "dueAt" TIMESTAMP(3) NOT NULL,
    "done" BOOLEAN NOT NULL,
    "notes" TEXT,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "crossingProgramId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "OperationalTask_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RuleVersion" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "jurisdiction" TEXT NOT NULL,
    "version" TEXT NOT NULL,
    "effectiveAt" TIMESTAMP(3) NOT NULL,
    "expiresAt" TIMESTAMP(3),
    "sourceUrl" TEXT NOT NULL,
    "requirementText" TEXT NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "crossingProgramId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "RuleVersion_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "DocumentRequirement" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "category" TEXT NOT NULL,
    "requiredBy" TIMESTAMP(3) NOT NULL,
    "sourceReference" TEXT NOT NULL,
    "evidenceReference" TEXT,
    "reviewNotes" TEXT,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "crossingProgramId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "DocumentRequirement_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- CreateIndex
CREATE INDEX "WorkflowAnalysis_workflow_createdAt_idx" ON "WorkflowAnalysis"("workflow", "createdAt");

-- CreateIndex
CREATE UNIQUE INDEX "RecordReview_entity_entityId_version_actorId_key" ON "RecordReview"("entity", "entityId", "version", "actorId");

-- CreateIndex
CREATE INDEX "IssuedCredential_entity_entityId_createdAt_idx" ON "IssuedCredential"("entity", "entityId", "createdAt");

-- CreateIndex
CREATE INDEX "DomainArtifact_subjectEntity_subjectId_idx" ON "DomainArtifact"("subjectEntity", "subjectId");

-- CreateIndex
CREATE INDEX "WorkSession_respondentId_createdAt_idx" ON "WorkSession"("respondentId", "createdAt");

-- CreateIndex
CREATE INDEX "SessionMedia_sessionId_idx" ON "SessionMedia"("sessionId");

-- CreateIndex
CREATE INDEX "CrossingProgram_createdAt_idx" ON "CrossingProgram"("createdAt");

-- CreateIndex
CREATE INDEX "RailCrossing_createdAt_idx" ON "RailCrossing"("createdAt");

-- CreateIndex
CREATE INDEX "RailCrossing_crossingProgramId_idx" ON "RailCrossing"("crossingProgramId");

-- CreateIndex
CREATE INDEX "CrossingOwner_createdAt_idx" ON "CrossingOwner"("createdAt");

-- CreateIndex
CREATE INDEX "CrossingOwner_crossingProgramId_idx" ON "CrossingOwner"("crossingProgramId");

-- CreateIndex
CREATE INDEX "WarningDevice_createdAt_idx" ON "WarningDevice"("createdAt");

-- CreateIndex
CREATE INDEX "WarningDevice_crossingProgramId_idx" ON "WarningDevice"("crossingProgramId");

-- CreateIndex
CREATE INDEX "CrossingInspection_createdAt_idx" ON "CrossingInspection"("createdAt");

-- CreateIndex
CREATE INDEX "CrossingInspection_crossingProgramId_idx" ON "CrossingInspection"("crossingProgramId");

-- CreateIndex
CREATE INDEX "TrafficObservation_createdAt_idx" ON "TrafficObservation"("createdAt");

-- CreateIndex
CREATE INDEX "TrafficObservation_crossingProgramId_idx" ON "TrafficObservation"("crossingProgramId");

-- CreateIndex
CREATE INDEX "CrossingProject_createdAt_idx" ON "CrossingProject"("createdAt");

-- CreateIndex
CREATE INDEX "CrossingProject_crossingProgramId_idx" ON "CrossingProject"("crossingProgramId");

-- CreateIndex
CREATE INDEX "InventoryChange_createdAt_idx" ON "InventoryChange"("createdAt");

-- CreateIndex
CREATE INDEX "InventoryChange_crossingProgramId_idx" ON "InventoryChange"("crossingProgramId");

-- CreateIndex
CREATE INDEX "CrossingSubmission_createdAt_idx" ON "CrossingSubmission"("createdAt");

-- CreateIndex
CREATE INDEX "CrossingSubmission_crossingProgramId_idx" ON "CrossingSubmission"("crossingProgramId");

-- CreateIndex
CREATE INDEX "OperationalTask_createdAt_idx" ON "OperationalTask"("createdAt");

-- CreateIndex
CREATE INDEX "OperationalTask_crossingProgramId_idx" ON "OperationalTask"("crossingProgramId");

-- CreateIndex
CREATE INDEX "RuleVersion_createdAt_idx" ON "RuleVersion"("createdAt");

-- CreateIndex
CREATE INDEX "RuleVersion_crossingProgramId_idx" ON "RuleVersion"("crossingProgramId");

-- CreateIndex
CREATE INDEX "DocumentRequirement_createdAt_idx" ON "DocumentRequirement"("createdAt");

-- CreateIndex
CREATE INDEX "DocumentRequirement_crossingProgramId_idx" ON "DocumentRequirement"("crossingProgramId");

-- AddForeignKey
ALTER TABLE "RailCrossing" ADD CONSTRAINT "RailCrossing_crossingProgramId_fkey" FOREIGN KEY ("crossingProgramId") REFERENCES "CrossingProgram"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CrossingOwner" ADD CONSTRAINT "CrossingOwner_railCrossingId_fkey" FOREIGN KEY ("railCrossingId") REFERENCES "RailCrossing"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CrossingOwner" ADD CONSTRAINT "CrossingOwner_crossingProgramId_fkey" FOREIGN KEY ("crossingProgramId") REFERENCES "CrossingProgram"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "WarningDevice" ADD CONSTRAINT "WarningDevice_railCrossingId_fkey" FOREIGN KEY ("railCrossingId") REFERENCES "RailCrossing"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "WarningDevice" ADD CONSTRAINT "WarningDevice_crossingProgramId_fkey" FOREIGN KEY ("crossingProgramId") REFERENCES "CrossingProgram"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CrossingInspection" ADD CONSTRAINT "CrossingInspection_railCrossingId_fkey" FOREIGN KEY ("railCrossingId") REFERENCES "RailCrossing"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CrossingInspection" ADD CONSTRAINT "CrossingInspection_crossingProgramId_fkey" FOREIGN KEY ("crossingProgramId") REFERENCES "CrossingProgram"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TrafficObservation" ADD CONSTRAINT "TrafficObservation_railCrossingId_fkey" FOREIGN KEY ("railCrossingId") REFERENCES "RailCrossing"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TrafficObservation" ADD CONSTRAINT "TrafficObservation_crossingProgramId_fkey" FOREIGN KEY ("crossingProgramId") REFERENCES "CrossingProgram"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CrossingProject" ADD CONSTRAINT "CrossingProject_railCrossingId_fkey" FOREIGN KEY ("railCrossingId") REFERENCES "RailCrossing"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CrossingProject" ADD CONSTRAINT "CrossingProject_crossingProgramId_fkey" FOREIGN KEY ("crossingProgramId") REFERENCES "CrossingProgram"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "InventoryChange" ADD CONSTRAINT "InventoryChange_railCrossingId_fkey" FOREIGN KEY ("railCrossingId") REFERENCES "RailCrossing"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "InventoryChange" ADD CONSTRAINT "InventoryChange_crossingProgramId_fkey" FOREIGN KEY ("crossingProgramId") REFERENCES "CrossingProgram"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CrossingSubmission" ADD CONSTRAINT "CrossingSubmission_railCrossingId_fkey" FOREIGN KEY ("railCrossingId") REFERENCES "RailCrossing"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CrossingSubmission" ADD CONSTRAINT "CrossingSubmission_crossingProgramId_fkey" FOREIGN KEY ("crossingProgramId") REFERENCES "CrossingProgram"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "OperationalTask" ADD CONSTRAINT "OperationalTask_crossingProgramId_fkey" FOREIGN KEY ("crossingProgramId") REFERENCES "CrossingProgram"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RuleVersion" ADD CONSTRAINT "RuleVersion_crossingProgramId_fkey" FOREIGN KEY ("crossingProgramId") REFERENCES "CrossingProgram"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DocumentRequirement" ADD CONSTRAINT "DocumentRequirement_crossingProgramId_fkey" FOREIGN KEY ("crossingProgramId") REFERENCES "CrossingProgram"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

