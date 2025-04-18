import 'package:tugas3_mobile_teori/core/constants/string_constant.dart';

class SiteModel {
  String siteName;
  String siteUrl;
  String siteImage;
  String siteDetail;

  SiteModel({
    required this.siteName,
    required this.siteUrl,
    required this.siteImage,
    required this.siteDetail,
  });

  static List<SiteModel> getAllSiteData = [
    SiteModel(
      siteName: 'Netflix',
      siteUrl: 'https://www.netflix.com/id-en/',
      siteImage: '${StringConstant.pathImageAsset}/netflix.png',
      siteDetail:
          'Netflix adalah platform streaming terdepan di dunia yang menawarkan pengalaman menonton tanpa iklan dengan katalog konten eksklusif dan orisinal berkualitas tinggi seperti Stranger Things, The Crown, dan Money Heist. Tidak seperti platform lainnya, Netflix dikenal dengan investasi besar dalam produksi global dan teknologi personalisasi canggih yang merekomendasikan tontonan sesuai preferensi pengguna. Dengan dukungan multi-perangkat dan fitur unduhan untuk menonton offline, Netflix memberikan kebebasan, kenyamanan, dan variasi konten yang tak tertandingi oleh layanan streaming lainnya.',
    ),
    SiteModel(
      siteName: 'Disney+',
      siteUrl: 'https://www.hotstar.com/id/onboarding',
      siteImage: '${StringConstant.pathImageAsset}/disneyp.png',
      siteDetail:
          'Disney+ adalah platform streaming yang menonjol dengan koleksi eksklusif dari waralaba ikonik seperti Marvel, Star Wars, Pixar, National Geographic, dan tentu saja, Disney sendiri. Tidak seperti platform lainnya, Disney+ menawarkan pengalaman nostalgia sekaligus hiburan keluarga yang aman dan berkualitas tinggi, lengkap dengan konten orisinal seperti The Mandalorian dan Loki. Dengan satu langganan, pengguna dapat menikmati perpaduan antara film klasik dan rilisan terbaru yang jarang tersedia di layanan lain, menjadikannya pilihan utama bagi penggemar film dan keluarga di seluruh dunia.',
    ),
    SiteModel(
      siteName: 'Prime Video',
      siteUrl: 'https://www.primevideo.com/',
      siteImage: '${StringConstant.pathImageAsset}/primev.png',
      siteDetail:
          'Prime Video adalah platform streaming dari Amazon yang menonjol dengan kombinasi konten orisinal berkualitas seperti The Boys, Reacher, dan The Marvelous Mrs. Maisel, serta akses tambahan ke sewa dan beli film terbaru yang belum tersedia di layanan lain. Berbeda dari platform streaming lainnya, Prime Video menawarkan fleksibilitas luar biasa dengan integrasi ke berbagai saluran premium melalui fitur "Amazon Channels", serta keuntungan tambahan bagi pelanggan Amazon Prime. Dengan harga kompetitif dan jangkauan konten global yang luas, Prime Video memberikan nilai lebih dalam satu paket hiburan yang lengkap.',
    ),
    SiteModel(
      siteName: 'HBO GO',
      siteUrl: 'https://www.hbo.com/',
      siteImage: '${StringConstant.pathImageAsset}/hbogo.png',
      siteDetail:
          'HBO GO adalah platform streaming premium yang dikenal dengan konten eksklusif dan berkualitas tinggi, menghadirkan serial legendaris seperti Game of Thrones, Succession, dan The Last of Us yang jarang ditemukan di layanan lain. Tidak seperti kebanyakan platform streaming lainnya, HBO GO menawarkan pengalaman sinematik dengan fokus pada produksi berkelas, storytelling mendalam, dan nilai artistik tinggi. Selain serial, HBO GO juga menyediakan film blockbuster terbaru, dokumenter pemenang penghargaan, dan tayangan spesial langsung dari jaringan HBO, menjadikannya pilihan utama bagi penonton yang mencari hiburan berkualitas dan selektif.',
    ),
    SiteModel(
      siteName: 'Catchplay+',
      siteUrl: 'https://www.catchplay.com/id-en/home',
      siteImage: '${StringConstant.pathImageAsset}/catchplay.png',
      siteDetail:
          'Catchplay+ adalah platform streaming yang menonjol dengan fokus pada film-film Hollywood terbaru, termasuk rilisan box office yang belum tersedia di layanan lain. Berbeda dari platform streaming lain yang lebih menekankan pada serial atau konten orisinal, Catchplay+ memberikan akses cepat ke berbagai genre film internasional dan Asia berkualitas tinggi, dengan opsi sewa atau beli selain langganan reguler. Dengan kurasi konten yang selektif dan antarmuka yang simpel, Catchplay+ menjadi pilihan ideal bagi pecinta film yang ingin menikmati tayangan terkini tanpa harus menunggu lama.',
    ),
    SiteModel(
      siteName: 'Apple TV+',
      siteUrl: 'https://tv.apple.com/',
      siteImage: '${StringConstant.pathImageAsset}/appletv.png',
      siteDetail:
          'Apple TV+ adalah platform streaming eksklusif dari Apple yang menonjol dengan koleksi konten orisinal berkualitas tinggi dan sinematik, seperti Ted Lasso, Severance, dan The Morning Show. Tidak seperti platform lain yang mengandalkan katalog film dan serial dari berbagai studio, Apple TV+ berfokus sepenuhnya pada produksi eksklusif yang dikembangkan bersama kreator ternama dunia. Dengan pendekatan “quality over quantity”, Apple TV+ menghadirkan pengalaman menonton premium tanpa gangguan iklan, serta integrasi mulus dengan ekosistem Apple yang menjadikannya pilihan ideal bagi pengguna yang menghargai konten eksklusif, estetika visual, dan kualitas produksi kelas atas.',
    ),
    SiteModel(
      siteName: 'Vidio',
      siteUrl: 'https://www.vidio.com/',
      siteImage: '${StringConstant.pathImageAsset}/vidio.png',
      siteDetail:
          'Vidio adalah platform streaming lokal unggulan yang menonjol dengan tayangan olahraga eksklusif seperti Liga Inggris, Liga Champions, dan berbagai cabang olahraga nasional, serta konten hiburan Indonesia seperti sinetron, film, dan original series yang dekat dengan keseharian penonton. Berbeda dari platform streaming internasional, Vidio menyatukan live TV, berita, dan hiburan dalam satu aplikasi yang mudah diakses. Dengan dukungan konten lokal yang kuat dan pengalaman streaming langsung tanpa delay signifikan, Vidio menjadi pilihan utama bagi penonton Indonesia yang menginginkan hiburan yang relevan, real-time, dan variatif.',
    ),
    SiteModel(
      siteName: 'Viu',
      siteUrl: 'https://www.viu.com/ott/id',
      siteImage: '${StringConstant.pathImageAsset}/viu.png',
      siteDetail:
          'VIU adalah platform streaming yang menonjol dengan spesialisasi pada drama Korea, Asia, dan variety show populer, lengkap dengan subtitle Indonesia yang cepat dan akurat. Berbeda dari layanan streaming lain yang lebih umum atau berfokus pada konten Barat, VIU menghadirkan update cepat episode terbaru dari Korea Selatan hanya beberapa jam setelah tayang di negara asalnya. Selain itu, VIU juga menghadirkan konten orisinal dari Indonesia dan Asia Tenggara, menjadikannya pilihan favorit bagi penggemar K-Drama dan hiburan Asia yang ingin selalu up-to-date dengan tayangan terkini dalam satu platform yang mudah diakses dan ramah pengguna.',
    ),
    SiteModel(
      siteName: 'WeTV',
      siteUrl: 'https://wetv.vip/id',
      siteImage: '${StringConstant.pathImageAsset}/wetv.png',
      siteDetail:
          'WeTV adalah platform streaming yang menonjol dengan fokus kuat pada drama Asia, khususnya drama China, Korea, dan Indonesia, lengkap dengan subtitle lokal dan update episode yang cepat. Tidak seperti layanan streaming lainnya yang cenderung global dan beragam, WeTV menawarkan pengalaman khusus bagi pecinta serial Asia dengan konten eksklusif, seperti drama adaptasi populer dan original series lokal yang dekat dengan budaya penonton. Dengan antarmuka yang ramah pengguna, opsi VIP untuk akses lebih awal, dan katalog yang terus diperbarui, WeTV menjadi destinasi utama bagi penggemar hiburan Asia yang ingin menikmati tayangan favorit tanpa menunggu lama.',
    ),
  ];
}
