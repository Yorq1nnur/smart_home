import 'dart:ffi';

import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../bloc/form_status/form_status.dart';

class MapsState extends Equatable {
  final FormStatus formsStatus;
  final String addressName;
  final String errorText;
  final LatLng userLatLng;
  final LocationPermission? locationPermission;
  final bool isLocationGranted;

  const MapsState({
    required this.formsStatus,
    required this.addressName,
    required this.errorText,
    required this.userLatLng,
    required this.isLocationGranted,
    this.locationPermission,
  });

  MapsState copyWith({
    FormStatus? formsStatus,
    String? addressName,
    String? errorText,
    LatLng? userLatLng,
    LocationPermission? locationPermission,
    bool? isLocationGranted,
  }) {
    return MapsState(
        formsStatus: formsStatus ?? this.formsStatus,
        addressName: addressName ?? this.addressName,
        errorText: errorText ?? this.errorText,
        userLatLng: userLatLng ?? this.userLatLng,
        locationPermission: locationPermission ?? this.locationPermission,
        isLocationGranted: isLocationGranted ?? this.isLocationGranted);
  }

  factory MapsState.initial() {
    return const MapsState(
      formsStatus: FormStatus.pure,
      errorText: "",
      addressName: '',
      userLatLng: LatLng(41.311081, 69.240562),
      isLocationGranted: false,
    );
  }

  @override
  List<Object?> get props => [
        formsStatus,
        addressName,
        errorText,
        userLatLng,
        locationPermission,
        isLocationGranted,
      ];
}
