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

CREATE OR REPLACE VIEW BTC_AVG_DAILY_PRICES AS
SELECT 
	toDate(Timestamp) as my_date,
	count(my_date),
	min(Open) as minOpen,
	max(Open) as maxOpen,
	avg(Open) as averageOpen,
	min(High) as minHigh,
	max(High) as maxHigh,
	avg(High) as avgHigh,
	min(Low) as minLow,
	max(Low) as maxLow,
	avg(Low) as avgLow,
	min(Close) as minClose,
	max(Close) as maxClose,
	avg(Close) as avgClose,
	min(Volume) as minVolume,
	max(Volume)  as maxVolume,
	avg(Volume) as avgVolume
FROM BTC_US_HISTORICAL
GROUP BY my_date;