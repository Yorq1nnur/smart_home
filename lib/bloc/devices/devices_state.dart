part of 'devices_bloc.dart';

class DevicesState extends Equatable {
  final List<DeviceModel> devices;

  const DevicesState({
    required this.devices,
  });

  static DevicesState initial() => const DevicesState(
        devices: [],
      );

  DevicesState copyWith({
    List<DeviceModel>? devices,
  }) =>
      DevicesState(
        devices: devices ?? this.devices,
      );

  @override
  List<Object?> get props => [
        devices,
      ];
}
