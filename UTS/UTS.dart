abstract class Transportasi {
  String nama;
  double _tarifDasar;
  int kapasitas;

  Transportasi(this.nama, this._tarifDasar, this.kapasitas);
  double hitungTarif(int penumpang);
  void tampilInfo();

  double get tarifDasar => _tarifDasar;
}

class Motor extends Transportasi {
  Motor(String nama, double tarifDasar, int kapasitas)
    : super(nama, tarifDasar, kapasitas);
  @override
  double hitungTarif(int penumpang) => tarifDasar * penumpang + 2000;

  @override
  void tampilInfo() => print("Motor $nama, Kapasitas : $kapasitas");
}

class Mobil extends Transportasi {
  Mobil(String nama, double tarifDasar, int kapasitas)
    : super(nama, tarifDasar, kapasitas);
  @override
  double hitungTarif(int penumpang) => tarifDasar * penumpang * 1.5;

  @override
  void tampilInfo() => print("Mobil $nama, Kapasitas : $kapasitas");
}

class Pemesanan {
  String namaPelanggan;
  Transportasi transportasi;
  int jumlahPenumpang;
  double total;

  Pemesanan(this.namaPelanggan, this.transportasi, this.jumlahPenumpang)
    : total = transportasi.hitungTarif(jumlahPenumpang);

  void cetakStruk() {
    print("\n---Struk Pemesanan---");
    print("Pelanggan: $namaPelanggan");
    transportasi.tampilInfo();
    print("Penumpang: $jumlahPenumpang");
    print("Total Bayar: Rp${total.toStringAsFixed(2)}");
  }
}

Pemesanan buatPemesanan(Transportasi t, String nama, int jml) =>
    Pemesanan(nama, t, jml);
void tampilSemua(List<Pemesanan> daftar) {
  print("\n===Daftar Pemesanan===");
  for (var p in daftar) {
    p.cetakStruk();
  }
}

void main() {
  var motor = Motor("Honda beat", 3000, 2);
  var mobil = Mobil("Avanza", 5000, 4);

  var daftar = [
    buatPemesanan(motor, "Hamdani", 2),
    buatPemesanan(mobil, "Taufiq", 3),
  ];
  tampilSemua(daftar);
}
