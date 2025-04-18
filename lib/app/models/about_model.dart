class AboutModel {
  final String title;
  final String content;

  AboutModel({required this.title, required this.content});

  static List<AboutModel> getHelpContent() {
    return [
      AboutModel(
        title: "Stopwatch",
        content: """

1. Buka menu Stopwatch yang ada di Home Page.

2. Tekan tombol Start untuk memulai stopwatch.

3. Tekan Pause untuk menghentikan sementara waktu.

4. Tekan Reset untuk mengatur ulang stopwatch ke 00:00:00.
        """,
      ),
      AboutModel(
        title: "Number Detection",
        content: """

1. Buka menu Number Detection yang ada di Home Page.

2. Masukkan angka ke dalam kolom input.

3. Tekan tombol Cek Bilangan.

4. Aplikasi akan menampilkan apakah bilangan tersebut merupakan prima, desimal, bulat positif/negatif, atau cacah.
        """,
      ),
      AboutModel(
        title: "LBS Tracker",
        content: """

1. Buka menu LBS Tracker yang ada di Home Page.

2. Izinkan aplikasi mengakses lokasi di device masing-masing.

3. Aplikasi akan menampilkan lokasi Anda saat ini di peta.

4. Menu ini digunakan untuk melacak lokasi anda.
        """,
      ),
      AboutModel(
        title: "Time Conversion",
        content: """

1. Buka menu Time Conversion yang ada di Home Page.

2. Masukkan total waktu tahun pada kolom input.

3. Tekan tombol Konversi.

4. Hasil konversi waktu akan muncul di bawahnya.
        """,
      ),
      AboutModel(
        title: "Site Recommendations",
        content: """

1. Buka menu Site Recommendations yang ada di Home Page.

2. Anda bisa melihat detail dari tiap site yang direkomendasikan (Tekan listnya saja).

3. Ikon Favorite (❤️) untuk menyimpan situs ke daftar Favorit Anda.

4. Pergi ke menu List Favorite untuk melihat semua situs Favorite dengan cara menekan tombol love di pojok kanan atas.

5. Akan muncul daftar situs Favorite lengkap dengan gambar.
        """,
      ),
    ];
  }
}
