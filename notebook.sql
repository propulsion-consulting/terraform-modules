-- Active: 1753916380304@@192.168.4.58@8123@DATA_EXPLORATION
SELECT *
FROM file(
    'crime_data/nypd/nypd_ytd_arrest_data.csv',
    'CSV',
    'ARREST_KEY String,
     ARREST_DATE String,
     PD_CD String,
     PD_DESC String,
     KY_CD String,
     OFNS_DESC String,
     LAW_CODE String,
     LAW_CAT_CD String,
     ARREST_BORO String,
     ARREST_PRECINCT String,
     JURISDICTION_CODE String,
     AGE_GROUP String,
     PERP_SEX String,
     PERP_RACE String,
     X_COORD_CD String,
     Y_COORD_CD String,
     Latitude String,
     Longitude String,
     NEW_GEOREFERENCED_COLUMN String'
);

SELECT * FROM "NOPD_CALLS_FOR_SERVICE"; 
INSERT INTO CPD_UCR_CODES
SELECT
    IUCR,
    PRIMARY_DESCRIPTION,
    SECONDARY_DESCRIPTION,
    INDEX_CODE,
    ACTIVE
FROM file(
    'crime_data/chicago/cpd_ucr_codes.csv',
    'CSV',
    'IUCR String,
     PRIMARY_DESCRIPTION String,
     SECONDARY_DESCRIPTION String,
     INDEX_CODE String,
     ACTIVE String'
);

INSERT INTO CPD_VICTIM_DEMOGRAPHIC_AGGREGATE
SELECT
    TIME_PERIOD,
    TIME_PERIOD_START,
    TIME_PERIOD_END,
    PRIMARY_TYPE,
    AGE,
    SEX,
    RACE,
    JUVENILE_I,
    DOMESTIC_I,
    GUNSHOT_INJURY_I,
    NUMBER_OF_VICTIMS
FROM file(
    'crime_data/chicago/violence_reduction_victim_demographics_aggregated.csv',
    'CSV',
    'TIME_PERIOD String,
     TIME_PERIOD_START String,
     TIME_PERIOD_END String,
     PRIMARY_TYPE String,
     AGE String,
     SEX String,
     RACE String,
     JUVENILE_I String,
     DOMESTIC_I String,
     GUNSHOT_INJURY_I String,
     NUMBER_OF_VICTIMS String'
);

DROP TABLE TESTING; 


