CREATE TABLE transaksi IF NOT EXISTS (
    transaksi_id INT PRIMARY KEY NOT NULL,
    akun_id INT NOT NULL,
    tanggal_transaksi DATE,
    jumlah DECIMAL(15, 2) NOT NULL,
    deskripsi VARCHAR(255) NOT NULL,
    FOREIGN KEY (akun_id) REFERENCES akun(akun_id)
);

CREATE INDEX idx_akun_tanggal ON transaksi (akun_id, tanggal_transaksi);

ALTER TABLE transaksi 
ADD COLUMN updated_at TIMESTAMP NOT NULL DEFAULT NOW();

RENAME TABLE transaksi TO transaction;

DROP TABLE IF EXISTS transaksi;