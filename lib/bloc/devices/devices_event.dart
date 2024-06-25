part of 'devices_bloc.dart';

sealed class DevicesEvent extends Equatable {
  const DevicesEvent();
}

class GetAllDevicesFromListEvent extends DevicesEvent {
  @override
  List<Object?> get props => [];
}

class GetCategoryDevicesFromListEvent extends DevicesEvent {
  final String categoryName;

  const GetCategoryDevicesFromListEvent(
    this.categoryName,
  );

  @override
  List<Object?> get props => [
        categoryName,
      ];
}

class GetAllDevicesFromDbEvent extends DevicesEvent {
  @override
  List<Object?> get props => [];
}

class AddDeviceToDbEvent extends DevicesEvent {
  final DeviceModel deviceModel;

  const AddDeviceToDbEvent(
    this.deviceModel,
  );

  @override
  List<Object?> get props => [
        deviceModel,
      ];
}
