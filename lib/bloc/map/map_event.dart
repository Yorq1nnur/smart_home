
import 'package:equatable/equatable.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class MapEvent extends Equatable {
  const MapEvent();

  @override
  List<Object?> get props => [];
}

class GetAddressName extends MapEvent {
  final LatLng latLng;

  const GetAddressName(this.latLng);

  @override
  List<Object> get props => [latLng];
}

class GetUserLocationEvent extends MapEvent {}


class LaunchMapsUrl extends MapEvent {
  final LatLng userLocation;
  final LatLng companyLocation;

  const LaunchMapsUrl( this.userLocation, this.companyLocation);

  @override
  List<Object> get props => [userLocation, companyLocation];
}

class GetLocation extends MapEvent {}

class RequestPermission extends MapEvent {}