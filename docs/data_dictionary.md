# Data Dictionary: Edmonton 311 Requests

- **Source:** City of Edmonton Open Data Portal (data.edmonton.ca), "311 Requests" dataset, CSV downloaded 2026-10-19
- **Rows / columns:** 3,488,753 and 26
- **Date range:**  2023-01-01 00:04 to 2026-10-17 23:45 - 2026 is partial


## Columns

| Column | Meaning(inferred) | Example | % Missing | Quality notes |
|---|---|---|---|---|
| Row ID | Unique ID of the request | 10000041828616 | 0% | Unique; works as primary key |
| Date Closed | The time the request was closed | Apr 13, 2026 11:37 AM | 1.09% | Text in format `Mon DD, YYYY HH12:MI AM`, local time, no time zone. Empty for all 37,665 Open requests (expected). 311 Closed requests also have no close date (data error) |
| Date Created | The time the request was opened | Dec 29, 2025 04:44 PM | 0% | Text in format `Mon DD, YYYY HH12:MI AM`, local time, no time zone; needs parsing |
| Request Status | Current state of the request | Closed | 0% | 2 values: Closed (3,451,088), Open (37,665) |
| Referral Type | Request resolved during the contact or referred to a City department(inferred) | Full Service | 0.75% | Full Service (2,003,560), Referral (1,459,159), blank (26,034). 72% of Referral requests have a ward vs. 12% of Full Service. |

## Key findings from exploration
Going through the requests 63% of them had a missing ward. Missing ward services come primarily from a service not having a specific location eg. a lot of public transport have missing ward because majority of them refer to a bus route. This is supported by the fact that only 11.9% of Requests with Full Service had a ward while 72% of referral had it. Which means that most of Full Service requests were not location related and were resolved on the spot, meanwhile Referral requests primarily needed on site treatment thus were referred to a City department. The location analysis will use Referral requests only with 72% of them having a ward

## Issues to fix in Week 2
- 26,034 requests with a blank referral type.
- 311 Closed requests have no close date: flag them and exclude from resolution-time analysis
