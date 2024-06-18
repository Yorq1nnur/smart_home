part of 'my_home_bloc.dart';

sealed class MyHomeEvent extends Equatable {
  const MyHomeEvent();
}

class MakeMyHomeEvent extends MyHomeEvent {
  final dynamic data;
  final MyHomeModelFields modelFields;

  const MakeMyHomeEvent(
    this.modelFields,
    this.data,
  );

  @override
  List<Object?> get props => [
        data,
        modelFields,
      ];
}
