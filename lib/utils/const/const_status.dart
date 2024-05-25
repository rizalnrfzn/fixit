enum Status {
  konfirmasiTeknisi('Konfirmasi Teknisi', 'Technician Confirmation'),
  menungguTeknisi('Menunggu Teknisi', 'Waiting Technician'),
  pengecekanElektronik('Pengecekan Elektronik', 'Electronic Checking'),
  konfirmasiPerbaikan('Konfirmasi Perbaikan', 'Repair Confirmation'),
  perbaikanElektronik('Perbaikan Elektronik', 'Electronic Repair'),
  pembayaran('Pembayaran', 'Payment'),
  pesananSelesai('Pesanan Selesai', 'Order Completed'),
  beriUlasan('Beri Ulasan', 'Add Review'),
  ;

  const Status(this.text, this.englishText);

  final String text;
  final String englishText;
}

Status getStatus(String status) {
  if (status == Status.konfirmasiTeknisi.name) {
    return Status.konfirmasiTeknisi;
  } else if (status == Status.menungguTeknisi.name) {
    return Status.menungguTeknisi;
  } else if (status == Status.pengecekanElektronik.name) {
    return Status.pengecekanElektronik;
  } else if (status == Status.konfirmasiPerbaikan.name) {
    return Status.konfirmasiPerbaikan;
  } else if (status == Status.perbaikanElektronik.name) {
    return Status.perbaikanElektronik;
  } else if (status == Status.pembayaran.name) {
    return Status.pembayaran;
  } else if (status == Status.beriUlasan.name) {
    return Status.beriUlasan;
  } else if (status == Status.pesananSelesai.name) {
    return Status.pesananSelesai;
  } else {
    return Status.konfirmasiTeknisi;
  }
}
