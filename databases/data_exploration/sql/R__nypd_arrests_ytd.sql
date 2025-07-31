CREATE TABLE IF NOT EXISTS NYPD_ARRESTS_YTD (
    ARREST_KEY String,
    ARREST_DATE Nullable(String),
    PD_CD Nullable(String),
    PD_DESC Nullable(String),
    KY_CD Nullable(String),
    OFNS_DESC Nullable(String),
    LAW_CODE Nullable(String),
    LAW_CAT_CD Nullable(String),
    ARREST_BORO Nullable(String),
    ARREST_PRECINCT Nullable(String),
    JURISDICTION_CODE Nullable(String),
    AGE_GROUP Nullable(String),
    PERP_SEX Nullable(String),
    PERP_RACE Nullable(String),
    X_COORD_CD Nullable(String),
    Y_COORD_CD Nullable(String),
    Latitude Nullable(String),
    Longitude Nullable(String),
    NEW_GEOREFERENCED_COLUMN Nullable(String)
)
ENGINE = MergeTree
ORDER BY ARREST_KEY;