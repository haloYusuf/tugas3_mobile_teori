class AboutModel {
  final String title;
  final String content;

  AboutModel({required this.title, required this.content});

  static List<AboutModel> getHelpContent() {
    return [
      AboutModel(
        title: "Stopwatch",
        content: """
- Buka menu Stopwatch yang ada di Home Page.
- Tekan tombol Start untuk memulai stopwatch.
- Tekan Pause untuk menghentikan sementara waktu.
- Tekan Reset untuk mengatur ulang stopwatch ke 00:00:00.
        """,
      ),
      AboutModel(
        title: "Number Detection",
        content: """
- Buka menu Number Detection yang ada di Home Page.
- Masukkan angka ke dalam kolom input.
- Tekan tombol Cek Bilangan.
- Aplikasi akan menampilkan apakah bilangan tersebut merupakan prima, desimal, bulat positif/negatif, atau cacah.
        """,
      ),
      AboutModel(
        title: "LBS Tracker",
        content: """
- Buka menu LBS Tracker yang ada di Home Page.
- Izinkan aplikasi mengakses lokasi di device masing-masing.
- Aplikasi akan menampilkan lokasi Anda saat ini di peta.
- Menu ini digunakan untuk melacak lokasi pengguna.
        """,
      ),
      AboutModel(
        title: "Time Conversion",
        content: """
- Buka menu Time Conversion yang ada di Home Page.
- Pilih jenis konversi (misalnya ...).
- Masukkan nilai angka pada kolom input.
- Tekan tombol Konversi.
- Hasil konversi waktu akan muncul di bawahnya.
        """,
      ),
      AboutModel(
        title: "Site Recommendations",
        content: """
- Buka menu Site Recommendations yang ada di Home Page.
- Ikon Favorite (⭐) untuk menyimpan situs ke daftar favorit Anda.
- Akan muncul daftar situs yang direkomendasikan lengkap dengan gambar dan link.
- Tekan link untuk membuka situs di browser.
        """,
      ),
    ];
  }
}
