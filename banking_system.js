const BankAccount = require("./bank_account");
const readline = require("readline");

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout,
});

const rekeningSaya = new BankAccount("Naufal", 10000);

const mainTransaction = async () => {
  rl.question(
    'Apakah Anda ingin melakukan deposit atau penarikan? (Ketik "deposit" atau "penarikan"): ',
    async (tipeTransaksi) => {
      if (tipeTransaksi === "deposit") {
        rl.question("Masukkan jumlah deposit: ", (jumlah) => {
          console.log("Sedang memproses deposit...");
          setTimeout(() => {
            try {
              const saldoBaru = rekeningSaya.deposit(parseFloat(jumlah));
              console.log(`Saldo setelah deposit: ${saldoBaru}`);
            } catch (err) {
              console.error(`Error: ${err.message}`);
            } finally {
              ask();
            }
          }, 2000);
        });
      } else if (tipeTransaksi === "penarikan") {
        rl.question("Masukkan jumlah penarikan: ", (jumlah) => {
          console.log("Sedang memproses penarikan...");
          setTimeout(() => {
            try {
              const saldoBaru = rekeningSaya.withdraw(parseFloat(jumlah));
              console.log(`Saldo setelah penarikan: ${saldoBaru}`);
            } catch (err) {
              console.error(`Error: ${err.message}`);
            } finally {
              ask();
            }
          }, 2000);
        });
      } else {
        console.log(
          'Tipe transaksi tidak valid. Silakan ketik "deposit" atau "penarikan".'
        );
        mainTransaction();
      }
    }
  );
};
