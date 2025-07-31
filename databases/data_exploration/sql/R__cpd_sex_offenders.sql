CREATE TABLE IF NOT EXISTS CPD_SEX_OFFENDERS (
    LAST Nullable(String),
    FIRST Nullable(String),
    BLOCK Nullable(String),
    GENDER Nullable(String),
    RACE Nullable(String),
    BIRTH_DATE String,
    HEIGHT Nullable(String),
    WEIGHT Nullable(String),
    VICTIM_MINOR Nullable(String)
)
ENGINE = MergeTree
ORDER BY BIRTH_DATE;