part of 'my_home_bloc.dart';

class MyHomeState extends Equatable {
  final MyHomeModel myHomeModel;

  const MyHomeState(
    this.myHomeModel,
  );

  static MyHomeState initial() => MyHomeState(
        MyHomeModel.initial(),
      );

  MyHomeState copyWith({
    MyHomeModel? myHomeModel,
  }) =>
      MyHomeState(
        myHomeModel ?? this.myHomeModel,
      );

  @override
  List<Object?> get props => [
        myHomeModel,
      ];
}
