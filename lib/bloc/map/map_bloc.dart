import 'dart:async';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:smart_home/bloc/form_status/form_status.dart';
import 'package:smart_home/bloc/map/map_event.dart';
import 'package:smart_home/bloc/map/map_state.dart';
import 'package:smart_home/services/map_service.dart';
import 'package:url_launcher/url_launcher.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  MapBloc() : super(MapState.initial()) {
    on<GetAddressName>(
      _onGetAddressName,
      transformer: restartable(),
    );
    on<LaunchMapsUrl>(_onLaunchMapsUrl);
    on<GetLocation>(_onGetLocation);
    on<RequestPermission>(_onRequestPermission);
    on<GetUserLocationEvent>(_onUserScreenOpened); // Yangi eventni qo'shish
  }

  void _onUserScreenOpened(GetUserLocationEvent event, Emitter<MapState> emit) async {
    // Joylashuvni olish uchun _onGetLocation metodini chaqirish
    _onGetLocation(GetLocation(), emit);
  }

  void _onGetAddressName(GetAddressName event, Emitter<MapState> emit) async {
    Placemark? placeMark =
    await MapService.getPlaceAddressByLatLng(event.latLng);
    if (placeMark != null) {
      emit(state.copyWith(
          addressName: "${placeMark.country},${placeMark.street}"));
    } else {
      emit(state.copyWith(addressName: ''));
    }
  }

  void _onLaunchMapsUrl(LaunchMapsUrl event, Emitter<MapState> emit) async {
    final Uri url = Uri.parse(
        'https://www.google.com/maps/dir/?api=1&origin=${event.userLocation.latitude},${event.userLocation.longitude}&destination=${event.companyLocation.latitude},${event.companyLocation.longitude}&travelmode=driving');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _onGetLocation(GetLocation event, Emitter<MapState> emit) async {
    emit(state.copyWith(formsStatus: FormStatus.loading));
    LocationPermission? permission = state.locationPermission;

    if (permission == null) {
      permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        permission = await _getRequestPermission();
      }
    }

    Position? position = await _getLocation(permission);

    if (position != null) {
      emit(state.copyWith(
        locationPermission: permission,
        userLatLng: LatLng(position.latitude, position.longitude),
        formsStatus: FormStatus.success,
      ));
    } else {
      emit(state.copyWith(formsStatus: FormStatus.error));
    }
  }

  Future<LocationPermission> _getRequestPermission() async {
    return await Geolocator.requestPermission();
  }

  Future<Position?> _getLocation(LocationPermission? permission) async {
    if (permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse) {
      return await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
    }

    return null;
  }

  void _onRequestPermission(
      RequestPermission event, Emitter<MapState> emit) async {
    LocationPermission permission = await Geolocator.requestPermission();
    emit(state.copyWith(locationPermission: permission));
  }
}

