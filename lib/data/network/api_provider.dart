import 'dart:convert';
import 'package:smart_home/data/models/country_model.dart';
import 'package:http/http.dart' as http;
import 'package:smart_home/data/network/network_response.dart';
import '../../utils/app_constants.dart';

class ApiProvider {
  static Future<NetworkResponse> getAllCountryData() async {
    try {
      http.Response response = await http.get(
        Uri.parse(AppConstants.countriesUrl),
      );
      if (response.statusCode == 200) {
        List<CountryModel> countries = (jsonDecode(response.body) as List?)
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
