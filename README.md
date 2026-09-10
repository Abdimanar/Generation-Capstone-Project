# Roblox Africa — Workforce Intelligence & Organizational Performance Analysis (Ghana Hub)

## Project Objective

Transition executive management from passive data reporting to actionable workforce intelligence by unifying disparate operational streams—workforce demographics, compensation structures, educational backgrounds, multi-year performance metrics, department-level financial ledgers, and health/insurance records—across Roblox Africa’s Ghana Hub.

## Workflow

The project execution followed a structured 5-stage data lifecycle pipeline:

* **Data Ingestion & Sourcing**: Consolidated multi-domain raw records covering 30,000 personnel spread across eight core departments.
* **Data Cleaning & Anomaly Resolution**: Addressed structural and data-entry discrepancies, including duplicate employee IDs, negative/zero age anomalies, and illogical chronological sequences (e.g., join dates predating graduation dates).
* **Database Architecture (MySQL)**: Designed a normalized relational database with structured foreign-key relationships and analytical views (`vw_employee_profile`, `vw_employee_performance_analysis`, `vw_department_performance_analysis`).
* **Data Modeling & Analytics (Power BI / DAX)**: Developed advanced calculated measures, star schema relationships, and dynamic visualizations to interrogate variables across dimensions.
* **Stakeholder Decision Support**: Delivered executive presentations and consolidated recommendations mapping key findings directly to actionable management interventions.

## Repository Structure

```text
├── Roblox_Africa_Final_Analytics_Report.docx   # Comprehensive stakeholder report & narrative
├── Roblox_Africa_Analysis_Script.sql           # Complete SQL scripts, views, and analytical queries
├── Roblox - Africa - Data_Dictionary.xlsx      # Detailed schema definitions and field descriptions
├── Roblox - Africa - Notes.docx                # Client requirements, meeting notes, and project objectives
└── Roblox- Africa- Mistakes Handout.docx       # Data cleaning log documenting anomalies and errors

```
## Tools Used
* **Database Management & Querying**: MySQL Workbench, SQL (Complex Joins, Views, Aggregations).
* **Data Modeling & Visualization**: Power BI (DAX, Power Query, Relational Modeling).
* **Data Processing & Inspection**: Microsoft Excel.
* **Presentation & Reporting**: Microsoft Word, PowerPoint.

## Key Analytical Themes
* **Workforce Availability vs. Headcount**: While nominal headcount sits at 30,000, active personnel account for only 33.6% (10,078 employees), with an identical third split across on-leave (33.5%) and inactive (32.9%) categories.
* **The Performance-Input Disconnect**: Individual employee performance scores remained identically static at 3.60 out of 5.0 across all five fiscal years (2021–2025). Statistical correlation tests revealed virtually zero predictive relationship between performance and traditional inputs: Training Hours ($r = 0.002$), Attendance ($r = -0.001$), and Projects Completed ($r = -0.004$).
* **Compensation & Equity**: Total compensation across the organization is highly compressed, falling within a narrow $97 band ($10,382 to $10,479). Gender pay equity is exemplary, registering a minimal gap of 0.1%, though bonus allocations currently show no meaningful differentiation based on performance scores.
* **Financial Efficiency & Divergence**: Total enterprise revenue grew by 27.6% (from $18.29M in 2021 to $23.34M in 2025), and net contribution improved by 37.7%. Departmental cost growth has heavily outpaced revenue in specific divisions—notably Customer Support (+60.1% cost vs. +12.0% revenue growth) and Data & Analytics (+70.0% cost vs. +47.5% revenue growth). Contribution margins vary widely, ranging from 44.47% (Human Resources) down to 31.62% (Product Management).
* **Workforce Health & Risk Exposure**: Health-insurance coverage is critically fragmented: 33% active, 33% pending, and 33% expired, exposing two-thirds of the workforce to regulatory compliance and operational risks.

## Data Handling
Raw entries underwent rigorous cleaning protocols to rectify historical tracking flaws, including resolving conflicting status values, mapping inconsistent department nomenclature, rectifying date anomalies, and establishing strict referential integrity across MySQL relational tables.

## Deliverables Included
Consolidated stakeholder analytical report in Microsoft Word format (Roblox_Africa_Final_Analytics_Report.docx).

Production-ready SQL script library containing table schemas, constraints, and analytical views (Roblox_Africa_Analysis_Script.sql).

Complete project documentation, data dictionaries, error correction logs, and meeting transcripts (Roblox - Africa - Data_Dictionary.xlsx, Roblox - Africa - Notes.docx, Roblox- Africa- Mistakes Handout.

## Dashboard Screenshots

## Recommended Next Steps
* **Align Staffing & Budgetary Control**: Intervene in high-cost-growth departments (Customer Support and Data & Analytics) by tying budget allocations directly to net contribution and efficiency KPIs rather than flat headcount models.

* **Redefine Performance Evaluation & Training**: Transition from tracking input metrics (such as raw training hours logged) to measuring output-based skill acquisition and competency improvements.

* **Resolve Workforce Availability & Health Backlogs**: Clear the pending and expired medical insurance backlogs immediately to mitigate compliance risks and safeguard workforce wellbeing.

* **Data Governance & Quality Control**: Implement strict validation rules for future data entry—specifically addressing date sequencing (graduation vs. join dates), age anomalies, and performance score rollup consistency between individual and departmental levels.
