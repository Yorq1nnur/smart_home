import 'package:equatable/equatable.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class MapsEvent extends Equatable {
  const MapsEvent();
}

class GetAddressName extends MapsEvent {
  final LatLng latLng;

  const GetAddressName(this.latLng);

  @override
  List<Object> get props => [latLng];
}

class CheckLocationPermissionStatusEvent extends MapsEvent {
  @override
  List<Object?> get props => [];
}

class ChangeStatusInitialEvent extends MapsEvent {
  @override
  List<Object?> get props => [];
}

class GetUserLocationEvent extends MapsEvent {
  @override
  List<Object?> get props => [];
}

class LaunchMapsUrl extends MapsEvent {
  final LatLng userLocation;
  final LatLng companyLocation;

  const LaunchMapsUrl(this.userLocation, this.companyLocation);

  @override
  List<Object> get props => [userLocation, companyLocation];
}

class GetLocation extends MapsEvent {
  @override
  List<Object?> get props => [];
}

class RequestPermission extends MapsEvent {
  @override
  List<Object?> get props => [];
}
