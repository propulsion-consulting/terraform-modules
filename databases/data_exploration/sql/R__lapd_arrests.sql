CREATE TABLE IF NOT EXISTS LAPD_ARRESTS (
    DR_NO String,
    DATE_RPTD Nullable(String),
    DATE_OCC Nullable(String),
    TIME_OCC Nullable(String),
    AREA Nullable(String),
    AREA_NAME Nullable(String),
    RPT_DIST_NO Nullable(String),
    PART_1_2 Nullable(String),
    CRM_CD Nullable(String),
    CRM_CD_DESC Nullable(String),
    MOCODES Nullable(String),
    VICT_AGE Nullable(String),
    VICT_SEX Nullable(String),
    VICT_DESCENT Nullable(String),
    PREMIS_CD Nullable(String),
    PREMIS_DESC Nullable(String),
    WEAPON_USED_CD Nullable(String),
    WEAPON_DESC Nullable(String),
    STATUS Nullable(String),
    STATUS_DESC Nullable(String),
    CRM_CD_1 Nullable(String),
    CRM_CD_2 Nullable(String),
    CRM_CD_3 Nullable(String),
    CRM_CD_4 Nullable(String),
    LOCATION Nullable(String),
    CROSS_STREET Nullable(String),
    LAT Nullable(String),
    LON Nullable(String)
)
ENGINE = MergeTree
ORDER BY DR_NO;

-- Dropped because files are too large
DROP TABLE IF EXISTS LAPD_ARRESTS; 