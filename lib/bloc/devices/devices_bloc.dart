import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home/bloc/form_status/form_status.dart';
import 'package:smart_home/data/local/local_db.dart';
import 'package:smart_home/data/models/device_model.dart';
import 'package:smart_home/data/network/network_response.dart';
import 'package:smart_home/utils/utility_functions.dart';

part 'devices_event.dart';

part 'devices_state.dart';

class DevicesBloc extends Bloc<DevicesEvent, DevicesState> {
  DevicesBloc() : super(DevicesState.initial()) {
    on<GetAllDevicesFromListEvent>(_getAllDevicesFromList);
    on<GetAllDevicesFromDbEvent>(_getAllDevicesFromDb);
    on<AddDeviceToDbEvent>(_insertDeviceToDb);
    on<ChangeDevicesInitialStateEvent>(_changeToInitial);
    on<UpdateDeviceEvent>(_updateDevice);
    on<GetCategoryDevicesFromListEvent>(_getCategoryDevicesFromList);
  }

  _updateDevice(UpdateDeviceEvent event, emit) async {
    NetworkResponse networkResponse = await LocalDb().updateDevice(
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

  _changeToInitial(ChangeDevicesInitialStateEvent event, emit) {
    emit(
      state.copyWith(
        formStatus: FormStatus.pure,
        errorText: '',
        devices: [],
      ),
    );
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

  _getCategoryDevicesFromList(
    GetCategoryDevicesFromListEvent event,
    emit,
  ) async {
    UtilityFunctions.methodPrint(
      'SELECTED ROOM IS: ${event.categoryName}',
    );

    NetworkResponse networkResponse = await LocalDb().getDevices();

    if (networkResponse.errorText.isEmpty) {
      final List<DeviceModel> devices = networkResponse.data;
      for (DeviceModel element in devices) {
        UtilityFunctions.methodPrint(
          element.roomName,
        );
      }
      UtilityFunctions.methodPrint(
        'CURRENT DEVICES OF LENGTH IS: ${devices.length}',
      );
      final List<DeviceModel> categoryDevices = devices
          .where(
            (e) => e.roomName.toLowerCase().contains(
                  event.categoryName.toLowerCase(),
                ),
          )
          .toList();
      emit(
        state.copyWith(
          devices: categoryDevices,
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
    UtilityFunctions.methodPrint(
      'CATEGORY DEVICES OF LENGTH IS: ${state.devices.length}',
    );
  }
}
