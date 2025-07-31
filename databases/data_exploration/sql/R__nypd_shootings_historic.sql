CREATE TABLE IF NOT EXISTS NYPD_SHOOTINGS_HISTORIC (
    INCIDENT_KEY String,
    OCCUR_DATE Nullable(String),
    OCCUR_TIME Nullable(String),
    BORO Nullable(String),
    LOC_OF_OCCUR_DESC Nullable(String),
    PRECINCT Nullable(String),
    JURISDICTION_CODE Nullable(String),
    LOC_CLASSFCTN_DESC Nullable(String),
    LOCATION_DESC Nullable(String),
    STATISTICAL_MURDER_FLAG Nullable(String),
    PERP_AGE_GROUP Nullable(String),
    PERP_SEX Nullable(String),
    PERP_RACE Nullable(String),
    VIC_AGE_GROUP Nullable(String),
    VIC_SEX Nullable(String),
    VIC_RACE Nullable(String),
    X_COORD_CD Nullable(String),
    Y_COORD_CD Nullable(String),
    Latitude Nullable(String),
    Longitude Nullable(String),
    Lon_Lat Nullable(String)
)
ENGINE = MergeTree
ORDER BY INCIDENT_KEY;