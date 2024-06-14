import 'package:smart_home/data/network/api_provider.dart';
import '../network/network_response.dart';

class CountryRepository {
  Future<NetworkResponse> getCountries() => ApiProvider.getAllCountryData();
}
