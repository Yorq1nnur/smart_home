import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home/bloc/form_status/form_status.dart';
import 'package:smart_home/data/local/local_db.dart';
import 'package:smart_home/data/models/device_model.dart';
import 'package:smart_home/data/network/network_response.dart';

part 'devices_event.dart';

part 'devices_state.dart';

class DevicesBloc extends Bloc<DevicesEvent, DevicesState> {
  DevicesBloc() : super(DevicesState.initial()) {
    on<GetAllDevicesFromListEvent>(_getAllDevicesFromList);
    on<GetAllDevicesFromDbEvent>(_getAllDevicesFromDb);
    on<AddDeviceToDbEvent>(_insertDeviceToDb);
    on<GetCategoryDevicesFromListEvent>(_getCategoryDevicesFromList);
  }


  _insertDeviceToDb(AddDeviceToDbEvent event, emit) async {
    emit(
      state.copyWith(
        formStatus: FormStatus.loading,
      ),
    );

    NetworkResponse networkResponse = await LocalDb().insertDevice(
      event.deviceModel,
    );

    if (networkResponse.errorText.isEmpty) {
      emit(
        state.copyWith(
          formStatus: FormStatus.success,
        ),
      );
    } else {
      emit(
        state.copyWith(
          formStatus: FormStatus.error,
          errorText: networkResponse.errorText,
        ),
      );
    }
  }

  _getAllDevicesFromDb(GetAllDevicesFromDbEvent event, emit) async {
    emit(
      state.copyWith(
        formStatus: FormStatus.loading,
      ),
    );

    NetworkResponse networkResponse = await LocalDb().getDevices();

    if (networkResponse.errorText.isEmpty) {
      emit(
        state.copyWith(
          devices: networkResponse.data,
          formStatus: FormStatus.success,
        ),
      );
    } else {
      emit(
        state.copyWith(
          formStatus: FormStatus.error,
          errorText: networkResponse.errorText,
        ),
      );
    }
  }

  _getAllDevicesFromList(GetAllDevicesFromListEvent event, emit) {
    emit(
      state.copyWith(
        devices: activeDevices,
      ),
    );
  }

  _getCategoryDevicesFromList(GetCategoryDevicesFromListEvent event, emit) {
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
