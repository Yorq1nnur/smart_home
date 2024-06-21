// // import 'dart:async';
// // import 'package:bloc_concurrency/bloc_concurrency.dart';
// // import 'package:flutter_bloc/flutter_bloc.dart';
// // import 'package:geocoding/geocoding.dart';
// // import 'package:geolocator/geolocator.dart';
// // import 'package:google_maps_flutter/google_maps_flutter.dart';
// // import 'package:smart_home/bloc/form_status/form_status.dart';
// // import 'package:smart_home/bloc/map/map_event.dart';
// // import 'package:smart_home/bloc/map/map_state.dart';
// // import 'package:smart_home/services/map_service.dart';
// // import 'package:smart_home/utils/utility_functions.dart';
// // import 'package:url_launcher/url_launcher.dart';
// //
// // class MapBloc extends Bloc<MapEvent, MapState> {
// //   MapBloc() : super(MapState.initial()) {
// //     on<GetAddressName>(
// //       _onGetAddressName,
// //       transformer: restartable(),
// //     );
// //     on<LaunchMapsUrl>(_onLaunchMapsUrl);
// //     on<GetLocation>(_onGetLocation);
// //     on<RequestPermission>(_onRequestPermission);
// //     on<GetUserLocationEvent>(_onUserScreenOpened);
// //   }
// //
// //   void _onUserScreenOpened(
// //       GetUserLocationEvent event, Emitter<MapState> emit) async {
// //     _onGetLocation(GetLocation(), emit);
// //   }
// //
// //   void _onGetAddressName(GetAddressName event, Emitter<MapState> emit) async {
// //     Placemark? placeMark =
// //         await MapService.getPlaceAddressByLatLng(event.latLng);
// //     if (placeMark != null) {
// //       emit(state.copyWith(
// //           addressName: "${placeMark.country},${placeMark.street}"));
// //     } else {
// //       emit(state.copyWith(addressName: ''));
// //     }
// //   }
// //
// //   void _onLaunchMapsUrl(LaunchMapsUrl event, Emitter<MapState> emit) async {
// //     final Uri url = Uri.parse(
// //         'https://www.google.com/maps/dir/?api=1&origin=${event.userLocation.latitude},${event.userLocation.longitude}&destination=${event.companyLocation.latitude},${event.companyLocation.longitude}&travelmode=driving');
// //     if (await canLaunchUrl(url)) {
// //       await launchUrl(url);
// //     } else {
// //       throw 'Could not launch $url';
// //     }
// //   }
// //
// //   void _onGetLocation(GetLocation event, Emitter<MapState> emit) async {
// //     emit(state.copyWith(formsStatus: FormStatus.loading));
// //
// //     LocationPermission? permission = state.locationPermission;
// //
// //     if (permission == null) {
// //       permission = await Geolocator.checkPermission();
// //
// //       if (permission == LocationPermission.denied ||
// //           permission == LocationPermission.deniedForever) {
// //         permission = await _getRequestPermission();
// //       }
// //     }
// //
// //     Position? position = await _getLocation(permission);
// //
// //     if (emit.isDone) return;
// //
// //     if (position != null) {
// //       emit(state.copyWith(
// //         locationPermission: permission,
// //         userLatLng: LatLng(position.latitude, position.longitude),
// //         formsStatus: FormStatus.success,
// //       ));
// //       UtilityFunctions.methodPrint(
// //         'CURRENT LAT LONG IS: ${state.userLatLng.latitude}, ${state.userLatLng.longitude} AND CURRENT ADDRESS NAME IS: ${state.addressName}',
// //       );
// //     } else {
// //       emit(
// //         state.copyWith(
// //           formsStatus: FormStatus.error,
// //         ),
// //       );
// //     }
// //   }
// //
// //   Future<LocationPermission> _getRequestPermission() async {
// //     return await Geolocator.requestPermission();
// //   }
// //
// //   Future<Position?> _getLocation(LocationPermission? permission) async {
// //     if (permission == LocationPermission.always ||
// //         permission == LocationPermission.whileInUse) {
// //       return await Geolocator.getCurrentPosition(
// //         desiredAccuracy: LocationAccuracy.high,
// //       );
// //     }
// //     return null;
// //   }
// //
// //   // Future<LocationPermission> _getRequestPermission() async {
// //   //   return await Geolocator.requestPermission();
// //   // }
// //   //
// //   // Future<Position?> _getLocation(LocationPermission? permission) async {
// //   //   if (permission == LocationPermission.always ||
// //   //       permission == LocationPermission.whileInUse) {
// //   //     return await Geolocator.getCurrentPosition(
// //   //         desiredAccuracy: LocationAccuracy.high);
// //   //   }
// //   //
// //   //   return null;
// //   // }
// //
// //   void _onRequestPermission(
// //       RequestPermission event, Emitter<MapState> emit) async {
// //     LocationPermission permission = await Geolocator.requestPermission();
// //     emit(state.copyWith(locationPermission: permission));
// //   }
// // }
//
// import 'dart:async';
// import 'package:bloc_concurrency/bloc_concurrency.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:geocoding/geocoding.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:location/location.dart' as loc;
// import 'package:smart_home/bloc/form_status/form_status.dart';
// import 'package:smart_home/bloc/map/map_event.dart';
// import 'package:smart_home/bloc/map/map_state.dart';
// import 'package:smart_home/services/map_service.dart';
// import 'package:smart_home/utils/utility_functions.dart';
// import 'package:url_launcher/url_launcher.dart';
//
// class MapsBloc extends Bloc<MapsEvent, MapsState> {
//   MapsBloc() : super(MapsState.initial()) {
//     on<GetAddressName>(
//       _onGetAddressName,
//       transformer: restartable(),
//     );
//     on<LaunchMapsUrl>(_onLaunchMapsUrl);
//     on<GetLocation>(_onGetLocation);
//     on<RequestPermission>(_onRequestPermission);
//     on<GetUserLocation>(_onGetUserLocation);
//   }
//
//   void _onGetUserLocation(GetUserLocation event, Emitter<MapsState> emit) async {
//     emit(state.copyWith(formsStatus: FormStatus.loading));
//
//     Location location = Location();
//     bool serviceEnabled = false;
//     late PermissionStatus permissionGranted;
//     late LocationData locationData;
//
//     serviceEnabled = await location.serviceEnabled();
//     if (!serviceEnabled) {
//       serviceEnabled = await location.requestService();
//       if (!serviceEnabled) {
//         emit(state.copyWith(formsStatus: FormStatus.error));
//         return;
//       }
//     }
//
//     permissionGranted = await location.hasPermission();
//     if (permissionGranted == PermissionStatus.denied) {
//       permissionGranted = await location.requestPermission();
//       if (permissionGranted != PermissionStatus.granted) {
//         emit(state.copyWith(formsStatus: FormStatus.error));
//         return;
//       }
//     }
//
//     locationData = await location.getLocation();
//
//     if (emit.isDone) return;
//
//     emit(state.copyWith(
//       userLatLng: LatLng(locationData.latitude!, locationData.longitude!),
//       formsStatus: FormStatus.success,
//     ));
//
//     UtilityFunctions.methodPrint("LONGITUDE:${locationData.longitude}");
//     UtilityFunctions.methodPrint(("LATITUDE:${locationData.latitude}");
//         UtilityFunctions.methodPrint(("SPEED:${locationData.speed}");
//     UtilityFunctions.methodPrint(("ALTITUDE:${locationData.altitude}");
//   }
//
//   void _onGetAddressName(GetAddressName event, Emitter<MapsState> emit) async {
//     Placemark? placeMark = await MapService.getPlaceAddressByLatLng(event.latLng);
//     if (placeMark != null) {
//       emit(state.copyWith(
//           addressName: "${placeMark.country},${placeMark.street}"));
//     } else {
//       emit(state.copyWith(addressName: ''));
//     }
//   }
//
//   void _onLaunchMapsUrl(LaunchMapsUrl event, Emitter<MapsState> emit) async {
//     final Uri url = Uri.parse(
//         'https://www.google.com/maps/dir/?api=1&origin=${event.userLocation.latitude},${event.userLocation.longitude}&destination=${event.companyLocation.latitude},${event.companyLocation.longitude}&travelmode=driving');
//     if (await canLaunchUrl(url)) {
//       await launchUrl(url);
//     } else {
//       throw 'Could not launch $url';
//     }
//   }
//
//   void _onGetLocation(GetLocation event, Emitter<MapsState> emit) async {
//     emit(state.copyWith(formsStatus: FormStatus.loading));
//
//     LocationPermission? permission = state.locationPermission;
//
//     if (permission == null) {
//       permission = await Geolocator.checkPermission();
//
//       if (permission == LocationPermission.denied ||
//           permission == LocationPermission.deniedForever) {
//         permission = await _getRequestPermission();
//       }
//     }
//
//     Position? position = await _getLocation(permission);
//
//     if (emit.isDone) return;
//
//     if (position != null) {
//       emit(state.copyWith(
//         locationPermission: permission,
//         userLatLng: LatLng(position.latitude, position.longitude),
//         formsStatus: FormStatus.success,
//       ));
//       UtilityFunctions.methodPrint(
//         'CURRENT LAT LONG IS: ${state.userLatLng.latitude}, ${state.userLatLng.longitude} AND CURRENT ADDRESS NAME IS: ${state.addressName}',
//       );
//     } else {
//       emit(
//         state.copyWith(
//           formsStatus: FormStatus.error,
//         ),
//       );
//     }
//   }
//
//   Future<LocationPermission> _getRequestPermission() async {
//     return await Geolocator.requestPermission();
//   }
//
//   Future<Position?> _getLocation(LocationPermission? permission) async {
//     if (permission == LocationPermission.always ||
//         permission == LocationPermission.whileInUse) {
//       return await Geolocator.getCurrentPosition(
//         desiredAccuracy: LocationAccuracy.high,
//       );
//     }
//     return null;
//   }
//
//   void _onRequestPermission(
//       RequestPermission event, Emitter<MapsState> emit) async {
//     LocationPermission permission = await Geolocator.requestPermission();
//     emit(state.copyWith(locationPermission: permission));
//   }
// }

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import '../../data/network/api_provider.dart';
import 'map_event.dart';
import 'map_state.dart';

class MapsBloc extends Bloc<MapsEvent, MapsState> {
  MapsBloc() : super(MapsState.initial()) {
    on<GetUserLocation>(_onGetUserLocation);
    on<SetLatInitialLong>(_onSetLatInitialLong);
    on<ChangeMapType>(_onChangeMapType);
    on<MoveToInitialPosition>(_onMoveToInitialPosition);
    on<ChangeCurrentCameraPosition>(_onChangeCurrentCameraPosition);
    on<ChangeCurrentLocation>(_onChangeCurrentLocation);
  }

  void _onGetUserLocation(
      GetUserLocation event, Emitter<MapsState> emit) async {
    Location location = Location();
    bool serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) return;
    }

    PermissionStatus permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) return;
    }

    LocationData locationData = await location.getLocation();
    LatLng latLng = LatLng(locationData.latitude!, locationData.longitude!);
    add(SetLatInitialLong(latLng));
  }

  void _onSetLatInitialLong(SetLatInitialLong event, Emitter<MapsState> emit) {
    CameraPosition initialCameraPosition = CameraPosition(
      target: event.latLng,
      zoom: 15,
    );
    emit(state.copyWith(
      initialCameraPosition: initialCameraPosition,
    ));
  }

  void _onChangeMapType(ChangeMapType event, Emitter<MapsState> emit) {
    emit(state.copyWith(mapType: event.newMapType));
  }

  void _onMoveToInitialPosition(
      MoveToInitialPosition event, Emitter<MapsState> emit) async {
    final GoogleMapController mapController = await state.controller.future;
    await mapController.animateCamera(
        CameraUpdate.newCameraPosition(state.initialCameraPosition!));
  }

  void _onChangeCurrentCameraPosition(
      ChangeCurrentCameraPosition event, Emitter<MapsState> emit) async {
    final GoogleMapController mapController = await state.controller.future;
    await mapController
        .animateCamera(CameraUpdate.newCameraPosition(event.cameraPosition));
  }

  void _onChangeCurrentLocation(
      ChangeCurrentLocation event, Emitter<MapsState> emit) async {
    String placeName =
        await ApiProvider.getPlaceNameByLocation(event.cameraPosition.target);
    emit(state.copyWith(
      currentCameraPosition: event.cameraPosition,
      currentPlaceName: placeName,
    ));
  }
}
