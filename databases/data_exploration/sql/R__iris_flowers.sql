CREATE TABLE IF NOT EXISTS IRIS_FLOWERS (
    Id UInt32,
    SepalLengthCm Float32,
    SepalWidthCm Float32,
    PetalLengthCm Float32,
    PetalWidthCm Float32,
    Species String
)
ENGINE = MergeTree
ORDER BY Id;