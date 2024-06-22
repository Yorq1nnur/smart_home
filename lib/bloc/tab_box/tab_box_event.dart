part of 'tab_box_bloc.dart';

sealed class TabBoxEvent extends Equatable {
  const TabBoxEvent();
}

class ChangeActiveIndexEvent extends TabBoxEvent {
  final int activeIndex;

  const ChangeActiveIndexEvent(
    this.activeIndex,
  );

  @override
  List<Object?> get props => [
        activeIndex,
      ];
}
