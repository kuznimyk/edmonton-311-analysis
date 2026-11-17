-- 00_load_raw_requests.sql
-- Purpose: load the City of Edmonton 311 CSV export, untouched, into raw_requests.
--
-- Every column is TEXT on purpose: the raw layer should be an exact copy of the source,
-- so nothing is silently lost to a failed type cast. Parsing dates, numbers and text
-- clean-up happens in the cleaning step (Week 2), which builds clean_requests from this.
--
-- Run:  docker compose exec db psql -U analyst -d edmonton_311 -f /sql/00_load_raw_requests.sql

DROP TABLE IF EXISTS raw_requests;

CREATE TABLE raw_requests (
    row_id                          TEXT,
    date_closed                     TEXT,
    date_created                    TEXT,
    year                            TEXT,
    month_number                    TEXT,
    month                           TEXT,
    request_status                  TEXT,
    status_detail                   TEXT,
    service_category                TEXT,
    service_description             TEXT,
    interaction_channel             TEXT,
    service_area                    TEXT,
    referral_type                   TEXT,
    neighbourhood_id                TEXT,
    neighbourhood                   TEXT,
    ward                            TEXT,
    service_category_service_area   TEXT,  -- "Service Category (Service Area)"
    service_area_service_category   TEXT,  -- "(Service Area) Service Category"
    service_area_service_description TEXT, -- "(Service Area) Service Description"
    nbhd_latitude                   TEXT,
    nbhd_longitude                  TEXT,
    nbhd_location                   TEXT,
    ward_latitude                   TEXT,
    ward_longitude                  TEXT,
    ward_location                   TEXT,
    count                           TEXT
);

\timing on
COPY raw_requests
FROM '/data/raw/311_Requests_20261019.csv'
WITH (FORMAT csv, HEADER true, ENCODING 'UTF8');

-- Sanity check: should match the CSV line count minus the header (3,488,753)
SELECT COUNT(*) AS rows_loaded FROM raw_requests;
