import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:tugas3_mobile_teori/app/models/address_model.dart';

class AddressService {
  final _url = 'https://nominatim.openstreetmap.org';

  Future<AddressModel> getDetailAddress({
    required String latitude,
    required String longitude,
  }) async {
    final dataUrl = '$_url/reverse?lat=$latitude&lon=$longitude&format=json';
    try {
      final res = await http.get(Uri.parse(dataUrl));

      if (res.statusCode < 300) {
        final data = json.decode(res.body);
        final value = data['address'];
        if (value != null) {
          return AddressModel.fromMap(value);
        } else {
          return _defaultReturnFalue();
        }
      } else {
        return _defaultReturnFalue();
      }
    } catch (e) {
      return _defaultReturnFalue();
    }
  }

  AddressModel _defaultReturnFalue() {
    return AddressModel(
      desa: '',
      kabupaten: '',
      provinsi: '',
      negara: '',
    );
  }
}
