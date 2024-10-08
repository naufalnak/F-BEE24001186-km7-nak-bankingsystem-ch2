-- Getlist From Table
SELECT * FROM nasabah;
SELECT * FROM akun;
SELECT * FROM transaksi;


-- DELETE 
DELETE FROM akun;


-- Insert data Nasabah with Generate Series
INSERT INTO nasabah (nasabah_id, nama, alamat, no_telepon)
SELECT 
    gs.nasabah_id,
    'Nasabah ' || gs.nasabah_id AS nama,
    'Alamat Nasabah ' || gs.nasabah_id AS alamat,
    '081234567' || lpad(gs.nasabah_id::text, 3, '0') AS no_telepon
FROM generate_series(1, 100) AS gs(nasabah_id);

-- Insert data Akun with Generate Series
INSERT INTO akun (akun_id, nasabah_id, jenis_akun, saldo)
SELECT 
    gs.akun_id,
    n.nasabah_id,
    CASE
        WHEN random() < 0.5 THEN 'Tabungan'
        ELSE 'Giro'
    END AS jenis_akun,
    floor(random() * 1000000)::int AS saldo
FROM generate_series(1, 100) AS gs(akun_id)
JOIN nasabah n ON n.nasabah_id = gs.akun_id % 100 + 1 ORDER BY random();

-- Insert data Transaksi with Generate Series
INSERT INTO transaksi (transaksi_id, akun_id, tanggal_transaksi, jumlah, deskripsi)
SELECT 
    gs.transaksi_id,
    a.akun_id,
    CURRENT_DATE - (random() * 30)::int AS tanggal_transaksi,
    floor(random() * 1000000) AS jumlah,
    CASE
        WHEN random() > 0.5 THEN 'Setor Tunai'
        ELSE 'Tarik Tunai'
    END AS deskripsi
FROM generate_series(1, 100) AS gs(transaksi_id)
JOIN akun a ON a.akun_id = gs.transaksi_id % 100 + 1 ORDER BY random();


-- Sorting Data
SELECT * FROM akun ORDER BY akun_id;
SELECT * FROM transaksi ORDER BY transaksi_id;

-- Update
UPDATE nasabah 
SET alamat = 'Jl. Melaju No. 20', no_telepon = '0874279348' 
WHERE nasabah_id = 1;

-- DELETE
DELETE FROM nasabah WHERE nasabah_id = 2;
DELETE FROM akun WHERE akun_id = 17;
DELETE FROM transaksi WHERE transaksi_id = 2;


