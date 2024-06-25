part of 'devices_bloc.dart';

class DevicesState extends Equatable {
  final List<DeviceModel> devices;
  final FormStatus formStatus;
  final String errorText;

  const DevicesState({
    required this.devices,
    required this.formStatus,
    required this.errorText,
  });

  static DevicesState initial() => const DevicesState(
        devices: [],
        errorText: '',
        formStatus: FormStatus.pure,
      );

  DevicesState copyWith({
    List<DeviceModel>? devices,
    FormStatus? formStatus,
    String? errorText,
  }) =>
      DevicesState(
        devices: devices ?? this.devices,
        errorText: errorText ?? this.errorText,
        formStatus: formStatus ?? this.formStatus,
      );

  @override
  List<Object?> get props => [
        devices,
        errorText,
        formStatus,
      ];
}
