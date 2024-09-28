import 'package:payuung_pribadi_app/app/commons/models/wellness_model.dart';

class DummyHelper {
  static const String fullname = 'Wahyu Adhe Triwibowo';
  static const String dob = '02 Oktober 1996';
  static const String gender = 'Laki-laki';
  static const String email = 'adhedewa1996@gmail.com';
  static const String phone = '0895376710616';
  static const List<String> genders = ['Laki-laki', 'Perempuan'];
  static const List<String> education = ['SD', 'SMP', 'SMA', 'D1', 'D2', 'D3', 'S1', 'S2', 'S3'];
  static const List<String> maritalStatus = ['Belum Kawin', 'Kawin', 'Janda', 'Duda'];
  static const List<String> provinces = [
    'Bali',
    'Bangka Belitung',
    'Banteng',
    'Bengkulu',
    'DI Yogyakarta',
    'DKI Jakarta',
    'Gorontalo',
    'Jambi',
    'Jawa barat',
    'Jawa Tengah',
    'Jawa Timur',
    'Kalimantan Barat',
    'Kalimantan Selatan',
    'Kalimantan Tengah',
    'Kalimantan Timur',
    'Kalimantan Utara',
    'Kepulauan Riau',
    'Lampung',
    'Maluku Utara',
    'Maluku',
    'Aceh',
    'Nusa Tenggara Barat',
    'Nusa Tenggara Timur',
    'Papua Barat',
    'Papua',
    'Riau',
    'Sulawesi Barat',
    'Sulawesi Selatan',
    'Sulawesi Tengah',
    'Sulawesi Tenggara',
    'Sulawesi Utara',
    'Sumatera Barat',
    'Sumatera Selatan',
    'Sumatera Utara',
  ];

  static List<String> cities = [
    'Kota 1',
    'Kota 2',
    'Kota 3',
    'Kota 4',
    'Kota 5',
    'Kota 6',
  ];

  static List<String> subdistricts = [
    'Kecamatan 1',
    'Kecamatan 2',
    'Kecamatan 3',
    'Kecamatan 4',
    'Kecamatan 5',
    'Kecamatan 6',
  ];

  static List<String> urbanVillage = [
    'Kelurahan 1',
    'Kelurahan 2',
    'Kelurahan 3',
    'Kelurahan 4',
    'Kelurahan 5',
    'Kelurahan 6',
  ];

  static List<String> positions = [
    'Non-Staf',
    'Staf',
    'Supervisor',
    'Manajer',
    'Direktur',
    'Lainnya',
  ];

  static List<String> lengthOfWork = [
    '< 6 Bulan',
    '6 Bulan - 1 Tahun',
    '1 - 2 Tahun',
    '> 2 Tahun',
  ];

  static List<String> sourceOfIncome = [
    'Gaji',
    'Keuntungan Bisnis',
    'Bunga Tabungan',
    'Warisan',
    'Dana dari orang tua atau anak',
    'Undian',
    'Keuntungan Investasi',
    'Lainnya',
  ];

  static List<String> annualGrossIncome = [
    '< 10 Juta>',
    '10 - 50 Juta>',
    '50 - 100 Juta>',
    '100 - 500 Juta>',
    '500 Juta - 1 Milyar>',
    '> 1 Milyar>',
  ];

  static List<String> bankName = [
    'Bank 1',
    'Bank 2',
    'Bank 3',
    'Bank 4',
    'Bank 5',
    'Bank 6',
    'Bank 7',
  ];

  static final exploreWellness = <WellnewssItem>[
    WellnewssItem(
      image: 'https://seeklogo.com/images/I/indomaret-logo-DBC7AF66C5-seeklogo.com.png',
      title: 'Voucher Digital Indomaret Rp 25.000',
      price: 25000,
      finalPrice: 25000,
    ),
    WellnewssItem(
      image: 'https://seeklogo.com/images/I/indomaret-logo-DBC7AF66C5-seeklogo.com.png',
      title: 'Voucher Digital Indomaret Rp 25.000',
      price: 25000,
      finalPrice: 25000,
    ),
    WellnewssItem(
      image: 'https://images.seeklogo.com/logo-png/52/1/hm-logo-png_seeklogo-520857.png',
      title: 'Voucher Digital H&M Rp 100.000',
      price: 100000,
      finalPrice: 97000,
      discount: 3,
      isDiscountApplyed: true,
    ),
    WellnewssItem(
      image: 'https://logowik.com/content/uploads/images/531_grab.jpg',
      title: 'Voucher Digital Grab Transport Rp 20.000',
      price: 20000,
      finalPrice: 20000,
    ),
    WellnewssItem(
      image: 'https://static.wikia.nocookie.net/logopedia/images/7/7c/Excelso.png/revision/latest/scale-to-width-down/300?cb=20230826051957',
      title: 'Voucher Digital Excelso Rp 50.000',
      price: 50000,
      finalPrice: 48000,
      discount: 4,
      isDiscountApplyed: true,
    ),
    WellnewssItem(
      image: 'https://seeklogo.com/images/I/indomaret-logo-DBC7AF66C5-seeklogo.com.png',
      title: 'Voucher Digital Indomaret Rp 25.000',
      price: 25000,
      finalPrice: 25000,
    ),
    WellnewssItem(
      image: 'https://static.wikia.nocookie.net/logopedia/images/7/7c/Excelso.png/revision/latest/scale-to-width-down/300?cb=20230826051957',
      title: 'Voucher Digital Excelso Rp 50.000',
      price: 50000,
      finalPrice: 48000,
      discount: 4,
      isDiscountApplyed: true,
    ),
    WellnewssItem(
      image: 'https://images.seeklogo.com/logo-png/52/1/hm-logo-png_seeklogo-520857.png',
      title: 'Voucher Digital H&M Rp 100.000',
      price: 100000,
      finalPrice: 97000,
      discount: 3,
      isDiscountApplyed: true,
    ),
    WellnewssItem(
      image: 'https://www.uob.co.id/web-resources/images/personal/kartu-kredit/promo/microsite/Logo-Bakmi-GM.jpg',
      title: 'Voucher Digital Bakmi GM Rp 100.000',
      price: 100000,
      finalPrice: 95000,
      discount: 5,
      isDiscountApplyed: true,
    ),
    WellnewssItem(
      image: 'https://static.wikia.nocookie.net/logopedia/images/0/07/Keds.svg/revision/latest/scale-to-width-down/284?cb=20190707031253',
      title: 'Voucher Digital Keds Rp 50.000',
      price: 50000,
      finalPrice: 49000,
      discount: 2,
      isDiscountApplyed: true,
    ),
    WellnewssItem(
      image: 'https://seeklogo.com/images/I/indomaret-logo-DBC7AF66C5-seeklogo.com.png',
      title: 'Voucher Digital Indomaret Rp 25.000',
      price: 25000,
      finalPrice: 25000,
    ),
    WellnewssItem(
      image: 'https://www.uob.co.id/web-resources/images/personal/kartu-kredit/promo/microsite/Logo-Bakmi-GM.jpg',
      title: 'Voucher Digital Bakmi GM Rp 100.000',
      price: 100000,
      finalPrice: 95000,
      discount: 5,
      isDiscountApplyed: true,
    ),
    WellnewssItem(
      image: 'https://static.wikia.nocookie.net/logopedia/images/7/7c/Excelso.png/revision/latest/scale-to-width-down/300?cb=20230826051957',
      title: 'Voucher Digital Excelso Rp 50.000',
      price: 50000,
      finalPrice: 48000,
      discount: 4,
      isDiscountApplyed: true,
    ),
    WellnewssItem(
      image: 'https://seeklogo.com/images/I/indomaret-logo-DBC7AF66C5-seeklogo.com.png',
      title: 'Voucher Digital Indomaret Rp 25.000',
      price: 25000,
      finalPrice: 25000,
    ),
  ];
}
