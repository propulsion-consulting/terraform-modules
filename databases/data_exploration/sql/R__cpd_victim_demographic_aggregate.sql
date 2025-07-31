CREATE TABLE IF NOT EXISTS CPD_VICTIM_DEMOGRAPHIC_AGGREGATE (
    TIME_PERIOD Nullable(String),
    TIME_PERIOD_START String,
    TIME_PERIOD_END Nullable(String),
    PRIMARY_TYPE Nullable(String),
    AGE Nullable(String),
    SEX Nullable(String),
    RACE Nullable(String),
    JUVENILE_I Nullable(String),
    DOMESTIC_I Nullable(String),
    GUNSHOT_INJURY_I Nullable(String),
    NUMBER_OF_VICTIMS Nullable(String)
)
ENGINE = MergeTree
ORDER BY TIME_PERIOD_START;