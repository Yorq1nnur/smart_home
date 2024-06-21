import 'dart:convert';
import 'dart:io';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:smart_home/data/models/country_model.dart';
import 'package:http/http.dart' as http;
import 'package:smart_home/data/network/network_response.dart';
import '../../utils/app_constants.dart';

class ApiProvider {
  static Future<String> getPlaceNameByLocation(LatLng latLng) async {
    String place = "Hudud noma'lum";

    Uri uri = Uri.https("geocode-maps.yandex.ru", "/1.x/", {
      "apikey": "8b8b8f84-9b23-4b53-965d-92698b338711",
      "geocode": "${latLng.longitude}, ${latLng.latitude}",
      "lang": "uz",
      "format": "json",
      "kind": "house",
      "rspn": "1",
      "results": "5"
    });

    http.Response response = await http.get(uri);

    if (response.statusCode == HttpStatus.ok) {
      var data = jsonDecode(response.body);
      var list =
          data["response"]["GeoObjectCollection"]["featureMember"] as List?;
      if (list != null && list.isNotEmpty) {
        String? placeName = list[0]["GeoObject"]["metaDataProperty"]
            ["GeocoderMetaData"]["text"];
        place = placeName ?? "Hudud noma'lum";
      }
    }
    return place;
  }

  static Future<NetworkResponse> getAllCountryData() async {
    try {
      http.Response response = await http.get(
        Uri.parse(AppConstants.countriesUrl),
      );
      if (response.statusCode == 200) {
        List<CountryModel> countries =
            (jsonDecode(response.body)['data']['countries'] as List?)
                    ?.map((e) => CountryModel.fromJson(e))
                    .toList() ??
                [];

        return NetworkResponse(data: countries);
      }
    } catch (error) {
      return NetworkResponse(errorText: error.toString());
    }

    return NetworkResponse(errorText: 'ERROR');
  }
}
