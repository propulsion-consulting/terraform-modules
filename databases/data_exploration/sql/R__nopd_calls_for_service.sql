CREATE TABLE IF NOT EXISTS NOPD_CALLS_FOR_SERVICE (
    NOPD_Item String,
    Type Nullable(String),
    TypeText Nullable(String),
    Priority Nullable(String),
    InitialType Nullable(String),
    InitialTypeText Nullable(String),
    InitialPriority Nullable(String),
    MapX Nullable(String),
    MapY Nullable(String),
    TimeCreate Nullable(String),
    TimeDispatch Nullable(String),
    TimeArrive Nullable(String),
    TimeClosed Nullable(String),
    Disposition Nullable(String),
    DispositionText Nullable(String),
    SelfInitiated Nullable(String),
    Beat Nullable(String),
    BLOCK_ADDRESS Nullable(String),
    Zip Nullable(String),
    PoliceDistrict Nullable(String),
    Location Nullable(String)
)
ENGINE = MergeTree
ORDER BY NOPD_Item;