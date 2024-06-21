// import 'package:equatable/equatable.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import '../../bloc/form_status/form_status.dart';
//
// // State
// class MapsState extends Equatable {
//   final FormStatus formsStatus;
//   final String addressName;
//   final String errorText;
//   final LatLng userLatLng;
//   final LocationPermission? locationPermission;
//
//   const MapsState({
//     required this.formsStatus,
//     required this.addressName,
//     required this.errorText,
//     required this.userLatLng,
//     this.locationPermission,
//   });
//
//   MapsState copyWith({
//     FormStatus? formsStatus,
//     String? addressName,
//     String? errorText,
//     LatLng? userLatLng,
//     LocationPermission? locationPermission,
//   }) {
//     return MapsState(
//       formsStatus: formsStatus ?? this.formsStatus,
//       addressName: addressName ?? this.addressName,
//       errorText: errorText ?? this.errorText,
//       userLatLng: userLatLng ?? this.userLatLng,
//       locationPermission: locationPermission ?? this.locationPermission,
//     );
//   }
//
//   factory MapsState.initial() {
//     return const MapsState(
//       formsStatus: FormStatus.pure,
//       errorText: "",
//       addressName: '',
//       userLatLng: LatLng(41.311081, 69.240562),
//     );
//   }
//
//   @override
//   List<Object?> get props => [
//     formsStatus,
//     addressName,
//     errorText,
//     userLatLng,
//     locationPermission,
//   ];
// }

import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsState extends Equatable {
  final String currentPlaceName;
  final Completer<GoogleMapController> controller;
  final MapType mapType;
  final CameraPosition? initialCameraPosition;
  final CameraPosition? currentCameraPosition;
  final Set<Marker> markers;

  const MapsState({
    required this.currentPlaceName,
    required this.controller,
    required this.mapType,
    this.initialCameraPosition,
    this.currentCameraPosition,
    required this.markers,
  });

  factory MapsState.initial() {
    return MapsState(
      currentPlaceName: "",
      controller: Completer<GoogleMapController>(),
      mapType: MapType.normal,
      initialCameraPosition: null,
      currentCameraPosition: null,
      markers: const {},
    );
  }

  MapsState copyWith({
    String? currentPlaceName,
    Completer<GoogleMapController>? controller,
    MapType? mapType,
    CameraPosition? initialCameraPosition,
    CameraPosition? currentCameraPosition,
    Set<Marker>? markers,
  }) {
    return MapsState(
      currentPlaceName: currentPlaceName ?? this.currentPlaceName,
      controller: controller ?? this.controller,
      mapType: mapType ?? this.mapType,
      initialCameraPosition:
          initialCameraPosition ?? this.initialCameraPosition,
      currentCameraPosition:
          currentCameraPosition ?? this.currentCameraPosition,
      markers: markers ?? this.markers,
    );
  }

  @override
  List<Object?> get props => [
        currentPlaceName,
        controller,
        mapType,
        initialCameraPosition,
        currentCameraPosition,
        markers,
      ];
}
