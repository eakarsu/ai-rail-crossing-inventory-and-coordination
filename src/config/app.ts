export interface PageConfig {
  label: string;
  href: string;
  description: string;
  entities: string[];
  workflows: string[];
}

export interface EntityConfig {
  name: string;
  label: string;
  fields: Array<{ name: string; kind: "string" | "number" | "boolean" | "date" }>;
}

export interface WorkflowConfig {
  slug: string;
  title: string;
  description: string;
  prompt: string;
  fields: string[];
}

export const appConfig = {
  "slug": "ai-rail-crossing-inventory-and-coordination",
  "title": "Rail Crossing Inventory and Coordination",
  "tagline": "Reconcile crossing identifiers, shared ownership, inspections, warning-device records, project agreements and inventory submissions.",
  "accent": "rose"
};
export const pages: PageConfig[] = [
  {
    "label": "Intake & registers",
    "href": "/registers",
    "description": "Reconcile crossing identifiers, shared ownership, inspections, warning-device records, project agreements and inventory submissions.",
    "entities": [
      "CrossingProgram",
      "RailCrossing",
      "CrossingOwner"
    ],
    "workflows": [
      "inspection-change-extraction",
      "owner-responsibility-review"
    ]
  },
  {
    "label": "Operational records",
    "href": "/workflow",
    "description": "Reconcile crossing identifiers, shared ownership, inspections, warning-device records, project agreements and inventory submissions.",
    "entities": [
      "WarningDevice",
      "CrossingInspection",
      "TrafficObservation"
    ],
    "workflows": [
      "device-record-reconciliation",
      "project-coordination-brief"
    ]
  },
  {
    "label": "Review & delivery",
    "href": "/delivery",
    "description": "Reconcile crossing identifiers, shared ownership, inspections, warning-device records, project agreements and inventory submissions.",
    "entities": [
      "CrossingProject",
      "InventoryChange",
      "CrossingSubmission"
    ],
    "workflows": [
      "inventory-discrepancy-packet",
      "agency-submission-narrative"
    ]
  },
  {
    "label": "Tasks & requirements",
    "href": "/operations",
    "description": "Assignments, versioned rules and document requirements.",
    "entities": [
      "OperationalTask",
      "RuleVersion",
      "DocumentRequirement"
    ],
    "workflows": [
      "evidence-completeness-review",
      "operations-handoff-draft"
    ]
  }
];
export const entities: Record<string, EntityConfig> = {
  "CrossingProgram": {
    "name": "CrossingProgram",
    "label": "Crossing Program",
    "fields": [
      {
        "name": "name",
        "kind": "string"
      },
      {
        "name": "authority",
        "kind": "string"
      },
      {
        "name": "region",
        "kind": "string"
      },
      {
        "name": "coordinator",
        "kind": "string"
      },
      {
        "name": "reportingYear",
        "kind": "number"
      },
      {
        "name": "reviewAt",
        "kind": "date"
      },
      {
        "name": "status",
        "kind": "string"
      }
    ]
  },
  "RailCrossing": {
    "name": "RailCrossing",
    "label": "Rail Crossing",
    "fields": [
      {
        "name": "name",
        "kind": "string"
      },
      {
        "name": "crossingNumber",
        "kind": "string"
      },
      {
        "name": "road",
        "kind": "string"
      },
      {
        "name": "railroad",
        "kind": "string"
      },
      {
        "name": "latitude",
        "kind": "number"
      },
      {
        "name": "longitude",
        "kind": "number"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "crossingProgramId",
        "kind": "string"
      }
    ]
  },
  "CrossingOwner": {
    "name": "CrossingOwner",
    "label": "Crossing Owner",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "railCrossingId",
        "kind": "string"
      },
      {
        "name": "party",
        "kind": "string"
      },
      {
        "name": "responsibility",
        "kind": "string"
      },
      {
        "name": "agreementReference",
        "kind": "string"
      },
      {
        "name": "effectiveAt",
        "kind": "date"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "crossingProgramId",
        "kind": "string"
      }
    ]
  },
  "WarningDevice": {
    "name": "WarningDevice",
    "label": "Warning Device",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "railCrossingId",
        "kind": "string"
      },
      {
        "name": "deviceType",
        "kind": "string"
      },
      {
        "name": "serialNumber",
        "kind": "string"
      },
      {
        "name": "installedAt",
        "kind": "date"
      },
      {
        "name": "testedAt",
        "kind": "date"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "crossingProgramId",
        "kind": "string"
      }
    ]
  },
  "CrossingInspection": {
    "name": "CrossingInspection",
    "label": "Crossing Inspection",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "railCrossingId",
        "kind": "string"
      },
      {
        "name": "inspectedAt",
        "kind": "date"
      },
      {
        "name": "inspector",
        "kind": "string"
      },
      {
        "name": "observations",
        "kind": "string"
      },
      {
        "name": "nextDueAt",
        "kind": "date"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "crossingProgramId",
        "kind": "string"
      }
    ]
  },
  "TrafficObservation": {
    "name": "TrafficObservation",
    "label": "Traffic Observation",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "railCrossingId",
        "kind": "string"
      },
      {
        "name": "observedAt",
        "kind": "date"
      },
      {
        "name": "roadVehicles",
        "kind": "number"
      },
      {
        "name": "trains",
        "kind": "number"
      },
      {
        "name": "method",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "crossingProgramId",
        "kind": "string"
      }
    ]
  },
  "CrossingProject": {
    "name": "CrossingProject",
    "label": "Crossing Project",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "railCrossingId",
        "kind": "string"
      },
      {
        "name": "scope",
        "kind": "string"
      },
      {
        "name": "roadAuthority",
        "kind": "string"
      },
      {
        "name": "railAuthority",
        "kind": "string"
      },
      {
        "name": "budgetCents",
        "kind": "number"
      },
      {
        "name": "dueAt",
        "kind": "date"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "crossingProgramId",
        "kind": "string"
      }
    ]
  },
  "InventoryChange": {
    "name": "InventoryChange",
    "label": "Inventory Change",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "railCrossingId",
        "kind": "string"
      },
      {
        "name": "fieldName",
        "kind": "string"
      },
      {
        "name": "previousValue",
        "kind": "string"
      },
      {
        "name": "proposedValue",
        "kind": "string"
      },
      {
        "name": "sourceReference",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "crossingProgramId",
        "kind": "string"
      }
    ]
  },
  "CrossingSubmission": {
    "name": "CrossingSubmission",
    "label": "Crossing Submission",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "railCrossingId",
        "kind": "string"
      },
      {
        "name": "submittedAt",
        "kind": "date"
      },
      {
        "name": "submitter",
        "kind": "string"
      },
      {
        "name": "submissionReference",
        "kind": "string"
      },
      {
        "name": "receipt",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "crossingProgramId",
        "kind": "string"
      }
    ]
  },
  "OperationalTask": {
    "name": "OperationalTask",
    "label": "Operational Task",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "owner",
        "kind": "string"
      },
      {
        "name": "priority",
        "kind": "string"
      },
      {
        "name": "startAt",
        "kind": "date"
      },
      {
        "name": "dueAt",
        "kind": "date"
      },
      {
        "name": "done",
        "kind": "boolean"
      },
      {
        "name": "notes",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "crossingProgramId",
        "kind": "string"
      }
    ]
  },
  "RuleVersion": {
    "name": "RuleVersion",
    "label": "Rule Version",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "jurisdiction",
        "kind": "string"
      },
      {
        "name": "version",
        "kind": "string"
      },
      {
        "name": "effectiveAt",
        "kind": "date"
      },
      {
        "name": "expiresAt",
        "kind": "date"
      },
      {
        "name": "sourceUrl",
        "kind": "string"
      },
      {
        "name": "requirementText",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "crossingProgramId",
        "kind": "string"
      }
    ]
  },
  "DocumentRequirement": {
    "name": "DocumentRequirement",
    "label": "Document Requirement",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "category",
        "kind": "string"
      },
      {
        "name": "requiredBy",
        "kind": "date"
      },
      {
        "name": "sourceReference",
        "kind": "string"
      },
      {
        "name": "evidenceReference",
        "kind": "string"
      },
      {
        "name": "reviewNotes",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "crossingProgramId",
        "kind": "string"
      }
    ]
  }
};
export const workflows: WorkflowConfig[] = [
  {
    "slug": "inspection-change-extraction",
    "title": "Inspection change extraction",
    "description": "Inspection change extraction using selected crossing program records and supplied evidence.",
    "prompt": "Inspection change extraction for Rail Crossing Inventory and Coordination. Operational scope: Reconcile crossing identifiers, shared ownership, inspections, warning-device records, project agreements and inventory submissions. Specific AI scope: Extract inspection changes and prepare discrepancy packets for agency review. Produce an editable, source-linked draft for the responsible professional. Distinguish observations, missing evidence and proposed next actions. Do not invent facts, decide legal eligibility, authorize clinical release, profile individuals, submit externally or invent calibrated probabilities. Use supplied rule versions only. For translation preserve identifiers, dates, names and numbers and mark uncertain terms.",
    "fields": [
      "objective",
      "sourceContext",
      "applicableRules",
      "knownDiscrepancies",
      "constraints",
      "requestedOutput",
      "optionalReviewerNotes",
      "optionalAdditionalEvidence"
    ]
  },
  {
    "slug": "owner-responsibility-review",
    "title": "Owner responsibility review",
    "description": "Owner responsibility review using selected crossing program records and supplied evidence.",
    "prompt": "Owner responsibility review for Rail Crossing Inventory and Coordination. Operational scope: Reconcile crossing identifiers, shared ownership, inspections, warning-device records, project agreements and inventory submissions. Specific AI scope: Extract inspection changes and prepare discrepancy packets for agency review. Produce an editable, source-linked draft for the responsible professional. Distinguish observations, missing evidence and proposed next actions. Do not invent facts, decide legal eligibility, authorize clinical release, profile individuals, submit externally or invent calibrated probabilities. Use supplied rule versions only. For translation preserve identifiers, dates, names and numbers and mark uncertain terms.",
    "fields": [
      "objective",
      "sourceContext",
      "applicableRules",
      "knownDiscrepancies",
      "constraints",
      "requestedOutput",
      "optionalReviewerNotes",
      "optionalAdditionalEvidence"
    ]
  },
  {
    "slug": "device-record-reconciliation",
    "title": "Device record reconciliation",
    "description": "Device record reconciliation using selected crossing program records and supplied evidence.",
    "prompt": "Device record reconciliation for Rail Crossing Inventory and Coordination. Operational scope: Reconcile crossing identifiers, shared ownership, inspections, warning-device records, project agreements and inventory submissions. Specific AI scope: Extract inspection changes and prepare discrepancy packets for agency review. Produce an editable, source-linked draft for the responsible professional. Distinguish observations, missing evidence and proposed next actions. Do not invent facts, decide legal eligibility, authorize clinical release, profile individuals, submit externally or invent calibrated probabilities. Use supplied rule versions only. For translation preserve identifiers, dates, names and numbers and mark uncertain terms.",
    "fields": [
      "objective",
      "sourceContext",
      "applicableRules",
      "knownDiscrepancies",
      "constraints",
      "requestedOutput",
      "optionalReviewerNotes",
      "optionalAdditionalEvidence"
    ]
  },
  {
    "slug": "project-coordination-brief",
    "title": "Project coordination brief",
    "description": "Project coordination brief using selected crossing program records and supplied evidence.",
    "prompt": "Project coordination brief for Rail Crossing Inventory and Coordination. Operational scope: Reconcile crossing identifiers, shared ownership, inspections, warning-device records, project agreements and inventory submissions. Specific AI scope: Extract inspection changes and prepare discrepancy packets for agency review. Produce an editable, source-linked draft for the responsible professional. Distinguish observations, missing evidence and proposed next actions. Do not invent facts, decide legal eligibility, authorize clinical release, profile individuals, submit externally or invent calibrated probabilities. Use supplied rule versions only. For translation preserve identifiers, dates, names and numbers and mark uncertain terms.",
    "fields": [
      "objective",
      "sourceContext",
      "applicableRules",
      "knownDiscrepancies",
      "constraints",
      "requestedOutput",
      "optionalReviewerNotes",
      "optionalAdditionalEvidence"
    ]
  },
  {
    "slug": "inventory-discrepancy-packet",
    "title": "Inventory discrepancy packet",
    "description": "Inventory discrepancy packet using selected crossing program records and supplied evidence.",
    "prompt": "Inventory discrepancy packet for Rail Crossing Inventory and Coordination. Operational scope: Reconcile crossing identifiers, shared ownership, inspections, warning-device records, project agreements and inventory submissions. Specific AI scope: Extract inspection changes and prepare discrepancy packets for agency review. Produce an editable, source-linked draft for the responsible professional. Distinguish observations, missing evidence and proposed next actions. Do not invent facts, decide legal eligibility, authorize clinical release, profile individuals, submit externally or invent calibrated probabilities. Use supplied rule versions only. For translation preserve identifiers, dates, names and numbers and mark uncertain terms.",
    "fields": [
      "objective",
      "sourceContext",
      "applicableRules",
      "knownDiscrepancies",
      "constraints",
      "requestedOutput",
      "optionalReviewerNotes",
      "optionalAdditionalEvidence"
    ]
  },
  {
    "slug": "agency-submission-narrative",
    "title": "Agency submission narrative",
    "description": "Agency submission narrative using selected crossing program records and supplied evidence.",
    "prompt": "Agency submission narrative for Rail Crossing Inventory and Coordination. Operational scope: Reconcile crossing identifiers, shared ownership, inspections, warning-device records, project agreements and inventory submissions. Specific AI scope: Extract inspection changes and prepare discrepancy packets for agency review. Produce an editable, source-linked draft for the responsible professional. Distinguish observations, missing evidence and proposed next actions. Do not invent facts, decide legal eligibility, authorize clinical release, profile individuals, submit externally or invent calibrated probabilities. Use supplied rule versions only. For translation preserve identifiers, dates, names and numbers and mark uncertain terms.",
    "fields": [
      "objective",
      "sourceContext",
      "applicableRules",
      "knownDiscrepancies",
      "constraints",
      "requestedOutput",
      "optionalReviewerNotes",
      "optionalAdditionalEvidence"
    ]
  },
  {
    "slug": "evidence-completeness-review",
    "title": "Evidence completeness review",
    "description": "Evidence completeness review using selected crossing program records and supplied evidence.",
    "prompt": "Evidence completeness review for Rail Crossing Inventory and Coordination. Operational scope: Reconcile crossing identifiers, shared ownership, inspections, warning-device records, project agreements and inventory submissions. Specific AI scope: Extract inspection changes and prepare discrepancy packets for agency review. Produce an editable, source-linked draft for the responsible professional. Distinguish observations, missing evidence and proposed next actions. Do not invent facts, decide legal eligibility, authorize clinical release, profile individuals, submit externally or invent calibrated probabilities. Use supplied rule versions only. For translation preserve identifiers, dates, names and numbers and mark uncertain terms.",
    "fields": [
      "objective",
      "sourceContext",
      "applicableRules",
      "knownDiscrepancies",
      "constraints",
      "requestedOutput",
      "optionalReviewerNotes",
      "optionalAdditionalEvidence"
    ]
  },
  {
    "slug": "operations-handoff-draft",
    "title": "Operations handoff draft",
    "description": "Operations handoff draft using selected crossing program records and supplied evidence.",
    "prompt": "Operations handoff draft for Rail Crossing Inventory and Coordination. Operational scope: Reconcile crossing identifiers, shared ownership, inspections, warning-device records, project agreements and inventory submissions. Specific AI scope: Extract inspection changes and prepare discrepancy packets for agency review. Produce an editable, source-linked draft for the responsible professional. Distinguish observations, missing evidence and proposed next actions. Do not invent facts, decide legal eligibility, authorize clinical release, profile individuals, submit externally or invent calibrated probabilities. Use supplied rule versions only. For translation preserve identifiers, dates, names and numbers and mark uncertain terms.",
    "fields": [
      "objective",
      "sourceContext",
      "applicableRules",
      "knownDiscrepancies",
      "constraints",
      "requestedOutput",
      "optionalReviewerNotes",
      "optionalAdditionalEvidence"
    ]
  }
];
export function findPage(href:string){return pages.find(p=>p.href===href);}
