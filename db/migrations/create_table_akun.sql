-- CREATE
CREATE TABLE akun IF NOT EXISTS (
    akun_id INT PRIMARY KEY NOT NULL,
    nasabah_id INT NOT NULL,
    jenis_akun VARCHAR(50) NOT NULL,
    saldo DECIMAL(15, 2) NOT NULL,
    FOREIGN KEY (nasabah_id) REFERENCES nasabah(nasabah_id)
);

CREATE INDEX idx_jenis_akun_saldo ON akun (jenis_akun, saldo);

ALTER TABLE akun 
ADD COLUMN updated_at TIMESTAMP NOT NULL DEFAULT NOW();

RENAME TABLE akun TO account;

DROP TABLE IF EXISTS akun;