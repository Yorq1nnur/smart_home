import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:smart_home/utils/size.dart';
import '../../../bloc/map/map_bloc.dart';
import '../../../bloc/map/map_event.dart';
import '../../../bloc/map/map_state.dart';
import '../../../utils/app_images.dart';
import '../../../utils/app_text_style.dart';

class MapItem extends StatefulWidget {
  const MapItem({
    super.key,
  });

  @override
  State<MapItem> createState() => _MapItemState();
}

class _MapItemState extends State<MapItem> {
  @override
  void initState() {
    Future.microtask(() => context.read<MapBloc>().add(
          GetUserLocationEvent(),
        ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    CameraPosition? cameraPosition;
    final Completer<GoogleMapController> controller =
        Completer<GoogleMapController>();
    return Column(
      children: [
        Expanded(
          flex: 6,
          child: Container(
            height: height / 2.33,
            width: double.infinity,
            color: Colors.red,
            child: BlocConsumer<MapBloc, MapState>(
              listener: (context, state) {},
              builder: (context, state) {
                return Stack(
                  children: [
                    GoogleMap(
                      onCameraIdle: () async {
                        if (cameraPosition != null) {
                          context.read<MapBloc>().add(
                              GetAddressName(cameraPosition?.target as LatLng));
                        }
                      },
                      onCameraMove: (CameraPosition currentCameraPosition) {
                        cameraPosition = currentCameraPosition;
                        debugPrint(
                            "CURRENT POSITION:${currentCameraPosition.target.longitude}");
                      },
                      mapType: MapType.hybrid,
                      initialCameraPosition:
                          CameraPosition(target: state.userLatLng, zoom: 15),
                      onMapCreated: (GoogleMapController createdController) {
                        controller.complete(createdController);
                      },
                    ),
                    Positioned(
                      top: 10,
                      right: 0,
                      left: 0,
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white70,
                          borderRadius: BorderRadius.circular(20.w),
                        ),
                        child: Text(
                          state.addressName,
                          textAlign: TextAlign.center,
                          style: AppTextStyle.urbanistW700.copyWith(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      child: SvgPicture.asset(
                        AppImages.gps,
                        width: 50,
                        height: 50,
                      ),
                    ),
                    Positioned(
                      left: 20, // Adjust as needed
                      bottom: 20, // Adjust as needed
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        child: IconButton(
                          onPressed: () async {
                            final controller1 = await controller.future;
                            LatLng latLng = LatLng(state.userLatLng.latitude,
                                state.userLatLng.longitude);
                            controller1.animateCamera(
                              CameraUpdate.newCameraPosition(
                                CameraPosition(
                                  target: latLng,
                                  zoom: 15,
                                ),
                              ),
                            );
                          },
                          icon: const Icon(
                            Icons.my_location,
                            color: Colors.orange,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
