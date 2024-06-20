import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapService {
  static Future<Placemark?> getPlaceAddressByLatLng(LatLng latLng) async {
    final List<Placemark> placeMarks = await placemarkFromCoordinates(
      latLng.latitude,
      latLng.longitude,
    );

    if (placeMarks.isNotEmpty) return placeMarks[0];
    return null;
  }
}
