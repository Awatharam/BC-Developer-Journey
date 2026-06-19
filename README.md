BC Developer Journey
My AL development learning journey — 21-day plan building from table extensions to API integration.
Progress
Week 1 — Table & Page Extensions ✅

Day 1: AL project setup, sandbox connection
Day 2: Customer Priority Enum (High / Medium / Low)
Day 3: Customer table extension (Customer Priority field)
Day 4: Customer Card page extension + OnValidate trigger
Day 5: Full end-to-end test and review

Week 2 — Codeunit & Event Architecture ✅

Day 1: Codeunit structure, event publishers and subscribers theory
Day 2: Custom Table 50100 "Gold Customer Log" (Entry No., Customer No., Customer Name, Posting Date, Sales Order No.)
Day 3: Codeunit 50101 "Gold Customer Subscriber" — subscribes to OnAfterPostSalesDoc on Codeunit 80 "Sales-Post", logs High priority customer orders
Day 4: Page 50101 "Gold Customer Log List" — searchable List page inside BC; negative + positive flow tests passed
Day 5: Full regression test, code review, README update

Week 3 — AL Reports with Word Layouts ✅

Day 1: Report 50110 "Gold Customer Report" — dataset structure (No., Name, Balance (LCY), Posting Group, Credit Limit)
Day 2: Word layout (.docx) wired up via rendering block
Day 3: XML Mapping Pane used to bind all 5 columns to the Word layout — report prints all 70 customers with data
Day 4: Word layout styling — title, dark header row, column widths, table borders
Day 5: Added running row number column, fixed dormant Minimum Balance filter (SetFilter in OnPreDataItem), full report testing, PDF export, project cleanup
