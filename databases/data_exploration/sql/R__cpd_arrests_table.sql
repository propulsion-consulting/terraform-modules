CREATE TABLE IF NOT EXISTS CPD_ARRESTS (
    CB_NO String,
    CASE_NUMBER Nullable(String),
    ARREST_DATE Nullable(String),
    RACE Nullable(String),
    CHARGE_1_STATUTE Nullable(String),
    CHARGE_1_DESCRIPTION Nullable(String),
    CHARGE_1_TYPE Nullable(String),
    CHARGE_1_CLASS Nullable(String),
    CHARGE_2_STATUTE Nullable(String),
    CHARGE_2_DESCRIPTION Nullable(String),
    CHARGE_2_TYPE Nullable(String),
    CHARGE_2_CLASS Nullable(String),
    CHARGE_3_STATUTE Nullable(String),
    CHARGE_3_DESCRIPTION Nullable(String),
    CHARGE_3_TYPE Nullable(String),
    CHARGE_3_CLASS Nullable(String),
    CHARGE_4_STATUTE Nullable(String),
    CHARGE_4_DESCRIPTION Nullable(String),
    CHARGE_4_TYPE Nullable(String),
    CHARGE_4_CLASS Nullable(String),
    CHARGES_STATUTE Nullable(String),
    CHARGES_DESCRIPTION Nullable(String),
    CHARGES_TYPE Nullable(String),
    CHARGES_CLASS Nullable(String)
)
ENGINE = MergeTree
ORDER BY CB_NO;