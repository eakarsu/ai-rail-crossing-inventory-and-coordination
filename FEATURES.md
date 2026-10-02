# Rail Crossing Inventory and Coordination

Reconcile crossing identifiers, shared ownership, inspections, warning-device records, project agreements and inventory submissions.

## Implemented records

- **Crossing Program**: name, authority, region, coordinator, reporting Year, review At, status.
- **Rail Crossing**: name, crossing Number, road, railroad, latitude, longitude, status.
- **Crossing Owner**: title, party, responsibility, agreement Reference, effective At, status.
- **Warning Device**: title, device Type, serial Number, installed At, tested At, status.
- **Crossing Inspection**: title, inspected At, inspector, observations, next Due At, status.
- **Traffic Observation**: title, observed At, road Vehicles, trains, method, status.
- **Crossing Project**: title, scope, road Authority, rail Authority, budget Cents, due At, status.
- **Inventory Change**: title, field Name, previous Value, proposed Value, source Reference, status.
- **Crossing Submission**: title, submitted At, submitter, submission Reference, receipt, status.
- **Operational Task**: title, owner, priority, start At, due At, done, notes, status.
- **Rule Version**: title, jurisdiction, version, effective At, expires At, source Url, requirement Text, status.
- **Document Requirement**: title, category, required By, source Reference, evidence Reference, review Notes, status.

## AI workflows

- Inspection change extraction: source-linked draft, saved history, three real AI input suggestion styles and three complete fictional examples.
- Owner responsibility review: source-linked draft, saved history, three real AI input suggestion styles and three complete fictional examples.
- Device record reconciliation: source-linked draft, saved history, three real AI input suggestion styles and three complete fictional examples.
- Project coordination brief: source-linked draft, saved history, three real AI input suggestion styles and three complete fictional examples.
- Inventory discrepancy packet: source-linked draft, saved history, three real AI input suggestion styles and three complete fictional examples.
- Agency submission narrative: source-linked draft, saved history, three real AI input suggestion styles and three complete fictional examples.
- Evidence completeness review: source-linked draft, saved history, three real AI input suggestion styles and three complete fictional examples.
- Operations handoff draft: source-linked draft, saved history, three real AI input suggestion styles and three complete fictional examples.

## Calculations

- Crossing inventory difference report: Compare two supplied inventories by crossing identifier and report changed, missing and added entries.
- Crossing Program evidence checklist: Check source presence against an explicitly supplied document list; reviewer assesses adequacy.
- Operational deadline queue: Compute overdue items from entered dates and completed flags; no external notifications.

## Workspace features

Role-based login and account management; validated create/edit/delete; required parent and sibling relationships; search and pagination; atomic JSON imports; CSV/JSON exports; optimistic concurrency; two independent human reviews; immutable source-text uploads with independent review; dated task calendar; aggregate reports; searchable audit trail; model catalog and administrator AI settings; configured HTTPS connectors with approval, idempotency and receipt checks.

## Integration boundaries

A finite working scope, not every conceivable feature. No production regulator, insurer, carrier, court, university or clinical integration is preconfigured. Source uploads support text/CSV/JSON/Markdown, not OCR/PDF parsing. AI produces drafts and cannot authorize clinical handling, adjudicate rights, select recipients or jurors, establish eligibility, certify regulatory compliance or send submissions. Live external execution requires a configured adapter and independent human approval of the current record. Calculations use supplied rules and units; example rules are fictional.
