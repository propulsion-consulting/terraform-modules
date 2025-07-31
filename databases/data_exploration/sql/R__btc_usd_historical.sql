CREATE TABLE IF NOT EXISTS BTC_US_HISTORICAL (
    Timestamp Float64,
    Open Float32,
    High Float32,
    Low Float32,
    Close Float32,
    Volume Float32
)
ENGINE = MergeTree
ORDER BY Timestamp;