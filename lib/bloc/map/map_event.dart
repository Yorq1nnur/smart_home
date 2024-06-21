// import 'package:equatable/equatable.dart';
//
// import 'package:google_maps_flutter/google_maps_flutter.dart';
//
// abstract class MapsEvent extends Equatable {
//   const MapsEvent();
//
//   @override
//   List<Object?> get props => [];
// }
//
// class GetAddressName extends MapsEvent {
//   final LatLng latLng;
//
//   const GetAddressName(this.latLng);
//
//   @override
//   List<Object> get props => [latLng];
// }
//
// class GetUserLocationEvent extends MapsEvent {}
//
// class GetUserLocation extends MapsEvent {}
//
// class LaunchMapsUrl extends MapsEvent {
//   final LatLng userLocation;
//   final LatLng companyLocation;
//
//   const LaunchMapsUrl(this.userLocation, this.companyLocation);
//
//   @override
//   List<Object> get props => [userLocation, companyLocation];
// }
//
// class GetLocation extends MapsEvent {}
//
// class RequestPermission extends MapsEvent {}

import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class MapsEvent extends Equatable {
  const MapsEvent();

  @override
  List<Object?> get props => [];
}

class GetUserLocation extends MapsEvent {}

class SetLatInitialLong extends MapsEvent {
  final LatLng latLng;

  const SetLatInitialLong(this.latLng);

  @override
  List<Object> get props => [latLng];
}

class ChangeMapType extends MapsEvent {
  final MapType newMapType;

  const ChangeMapType(this.newMapType);

  @override
  List<Object> get props => [newMapType];
}

class MoveToInitialPosition extends MapsEvent {}

class ChangeCurrentCameraPosition extends MapsEvent {
  final CameraPosition cameraPosition;

  const ChangeCurrentCameraPosition(this.cameraPosition);

  @override
  List<Object> get props => [cameraPosition];
}

class ChangeCurrentLocation extends MapsEvent {
  final CameraPosition cameraPosition;

  const ChangeCurrentLocation(this.cameraPosition);

  @override
  List<Object> get props => [cameraPosition];
}

// class AddNewMarker extends MapsEvent {
//   final PlaceModel placeModel;
//
//   const AddNewMarker(this.placeModel);
//
//   @override
//   List<Object> get props => [placeModel];
// }
//
// class SavePlace extends MapsEvent {
//   final PlaceModel placeModel;
//
//   const SavePlace(this.placeModel);
//
//   @override
//   List<Object> get props => [placeModel];
// }
