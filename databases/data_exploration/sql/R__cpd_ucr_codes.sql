CREATE TABLE IF NOT EXISTS CPD_UCR_CODES (
    IUCR String,
    PRIMARY_DESCRIPTION Nullable(String),
    SECONDARY_DESCRIPTION Nullable(String),
    INDEX_CODE Nullable(String),
    ACTIVE Nullable(String)
)
ENGINE = MergeTree
ORDER BY IUCR;