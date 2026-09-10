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

## Tools Used
* **Database Management & Querying**: MySQL Workbench, SQL (Complex Joins, Views, Aggregations).
* **Data Modeling & Visualization**: Power BI (DAX, Power Query, Relational Modeling).
* **Data Processing & Inspection**: Microsoft Excel.
* **Presentation & Reporting**: Microsoft Word, PowerPoint.
