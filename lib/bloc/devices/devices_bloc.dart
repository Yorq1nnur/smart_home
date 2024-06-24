import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home/data/models/device_model.dart';
part 'devices_event.dart';

part 'devices_state.dart';

class DevicesBloc extends Bloc<DevicesEvent, DevicesState> {
  DevicesBloc() : super(DevicesState.initial()) {
    on<GetAllDevicesEvent>(_getAllDevices);
    on<GetCategoryDevicesEvent>(_getCategoryDevices);
  }

  _getAllDevices(GetAllDevicesEvent event, emit) {
    emit(
      state.copyWith(
        devices: activeDevices,
      ),
    );
  }

  _getCategoryDevices(GetCategoryDevicesEvent event, emit) {
    emit(
      state.copyWith(
        devices: activeDevices
            .where(
              (e) => e.deviceCategoryName.toLowerCase().contains(
                    event.categoryName.toLowerCase(),
                  ),
            )
            .toList(),
      ),
    );
  }
}
