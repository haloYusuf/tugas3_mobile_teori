class AddressModel {
  String desa;
  String kabupaten;
  String provinsi;
  String negara;

  AddressModel({
    required this.desa,
    required this.kabupaten,
    required this.provinsi,
    required this.negara,
  });

  factory AddressModel.fromMap(Map<String, dynamic> map) {
    return AddressModel(
      desa: map['village'],
      kabupaten: map['county'],
      provinsi: map['state'],
      negara: map['country'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'desa': desa,
      'kabupaten': kabupaten,
      'provinsi': provinsi,
      'negara': negara,
    };
  }
}
