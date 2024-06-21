import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:smart_home/bloc/form_status/form_status.dart';
import 'package:smart_home/bloc/map/map_event.dart';
import 'package:smart_home/bloc/map/map_state.dart';
import 'package:smart_home/services/app_permissions.dart';
import 'package:smart_home/utils/utility_functions.dart';
import 'package:url_launcher/url_launcher.dart';

class MapsBloc extends Bloc<MapsEvent, MapsState> {
  MapsBloc() : super(MapsState.initial()) {
    on<GetAddressName>(_onGetAddressName);
    on<LaunchMapsUrl>(_onLaunchMapsUrl);
    on<GetLocation>(_onGetLocation);
    on<RequestPermission>(_onRequestPermission);
    on<GetUserLocation>(_onGetUserLocation);
    on<CheckLocationPermissionStatusEvent>(_checkStatus);
  }

  _checkStatus(CheckLocationPermissionStatusEvent event, emit) async {
    bool status = await AppPermissions.checkLocationPermission();

    emit(
      state.copyWith(
        isLocationGranted: status,
      ),
    );
  }

  void _onGetUserLocation(
      GetUserLocation event, Emitter<MapsState> emit) async {
    emit(state.copyWith(formsStatus: FormStatus.loading));

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        emit(state.copyWith(formsStatus: FormStatus.error));
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      emit(state.copyWith(formsStatus: FormStatus.error));
      return;
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    emit(state.copyWith(
      userLatLng: LatLng(position.latitude, position.longitude),
      formsStatus: FormStatus.success,
    ));

    UtilityFunctions.methodPrint("LONGITUDE:${position.longitude}");
    UtilityFunctions.methodPrint("LATITUDE:${position.latitude}");
    UtilityFunctions.methodPrint("SPEED:${position.speed}");
    UtilityFunctions.methodPrint("ALTITUDE:${position.altitude}");
  }

  void _onGetAddressName(GetAddressName event, Emitter<MapsState> emit) async {
    try {
      List<Placemark> placeMarks = await placemarkFromCoordinates(
          event.latLng.latitude, event.latLng.longitude);
      if (placeMarks.isNotEmpty) {
        Placemark placeMark = placeMarks.first;
        emit(state.copyWith(
          addressName: "${placeMark.country}, ${placeMark.street}",
        ));
      } else {
        emit(state.copyWith(addressName: ''));
      }
    } catch (e) {
      emit(state.copyWith(addressName: ''));
    }
  }

  void _onLaunchMapsUrl(LaunchMapsUrl event, Emitter<MapsState> emit) async {
    final Uri url = Uri.parse(
        'https://www.google.com/maps/dir/?api=1&origin=${event.userLocation.latitude},${event.userLocation.longitude}&destination=${event.companyLocation.latitude},${event.companyLocation.longitude}&travelmode=driving');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _onGetLocation(GetLocation event, Emitter<MapsState> emit) async {
    emit(state.copyWith(formsStatus: FormStatus.loading));

    LocationPermission permission =
        state.locationPermission ?? await Geolocator.checkPermission();

    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      permission = await Geolocator.requestPermission();
    }

    Position? position = await _getLocation(permission);

    if (emit.isDone) return;

    if (position != null) {
      emit(state.copyWith(
        locationPermission: permission,
        userLatLng: LatLng(position.latitude, position.longitude),
        formsStatus: FormStatus.success,
      ));
      UtilityFunctions.methodPrint(
        'CURRENT LAT LONG IS: ${position.latitude}, ${position.longitude}',
      );
    } else {
      emit(state.copyWith(formsStatus: FormStatus.error));
    }
  }

  Future<Position?> _getLocation(LocationPermission permission) async {
    if (permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse) {
      return await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
    }
    return null;
  }

  void _onRequestPermission(
      RequestPermission event, Emitter<MapsState> emit) async {
    LocationPermission permission = await Geolocator.requestPermission();
    emit(state.copyWith(locationPermission: permission));
  }
}
