part of 'devices_bloc.dart';

sealed class DevicesEvent extends Equatable {
  const DevicesEvent();
}

class GetAllDevicesEvent extends DevicesEvent {
  @override
  List<Object?> get props => [];
}

class GetCategoryDevicesEvent extends DevicesEvent {
  final String categoryName;

  const GetCategoryDevicesEvent(
    this.categoryName,
  );

  @override
  List<Object?> get props => [
        categoryName,
      ];
}
