class BankAccount {
  constructor(pemilik, saldo = 0) {
    this.owner = pemilik;
    this.balance = saldo;
  }

  deposit(jumlah) {
    if (jumlah > 0) {
      this.balance += jumlah;
      return this.balance;
    } else {
      throw new Error("Jumlah deposit harus lebih dari 0.");
    }
  }

  withdraw(jumlah) {
    if (jumlah > 0 && jumlah <= this.balance) {
      this.balance -= jumlah;
      return this.balance;
    } else if (jumlah > this.balance) {
      throw new Error("Saldo tidak mencukupi.");
    } else {
      throw new Error("Jumlah penarikan harus lebih dari 0.");
    }
  }
}

module.exports = BankAccount;
