class AddressModel {
  String desa;
  String kabupaten;
  String provinsi;
  String negara;

  AddressModel({
    this.desa = '',
    this.kabupaten = '',
    this.provinsi = '',
    this.negara = '',
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
