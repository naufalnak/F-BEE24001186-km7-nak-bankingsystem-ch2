CREATE TABLE nasabah IF NOT EXISTS (
    nasabah_id INT PRIMARY KEY NOT NULL,
    nama VARCHAR(100) NOT NULL,
    alamat TEXT NOT NULL,
    no_telepon VARCHAR(15) NOT NULL
);

CREATE INDEX idx_nama_no_telepon ON nasabah (nama, no_telepon);

ALTER TABLE nasabah 
ADD COLUMN updated_at TIMESTAMP NOT NULL DEFAULT NOW();

RENAME TABLE nasabah TO customer;

DROP TABLE IF EXISTS nasabah;