# Data Dictionary: Edmonton 311 Requests

- **Source:** City of Edmonton Open Data Portal (data.edmonton.ca), "311 Requests" dataset, CSV downloaded 2026-10-19
- **Rows / columns:** 3,488,753 and 26
- **Date range:**  2023-01-01 00:04 to 2026-10-17 23:45 - 2026 is partial


## Columns

| Column | Meaning | Example | % Missing | Quality notes |
|---|---|---|---|---|
| Row ID | Unique ID of the request | 10000041828616 | 0% | Unique; works as primary key |
| Date Closed | The time the request was closed | Apr 13, 2026 11:37 AM | 1.09% | Text in format `Mon DD, YYYY HH12:MI AM`, local time, no time zone. Empty for all 37,665 Open requests (expected). 311 Closed requests also have no close date (data error) |
| Date Created | The time the request was opened | Dec 29, 2025 04:44 PM | 0% | Text in format `Mon DD, YYYY HH12:MI AM`, local time, no time zone; needs parsing |
| Request Status | Current state of the request | Closed | 0% | 2 values: Closed (3,451,088), Open (37,665) |

## Key findings from exploration

## Issues to fix in Week 2
- 311 Closed requests have no close date: flag them and exclude from resolution-time analysis
