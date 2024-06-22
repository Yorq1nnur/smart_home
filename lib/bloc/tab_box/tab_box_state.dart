part of 'tab_box_bloc.dart';

class TabBoxState extends Equatable {
  final int activeIndex;

  const TabBoxState({
    required this.activeIndex,
  });

  TabBoxState copyWith({
    int? activeIndex,
  }) =>
      TabBoxState(
        activeIndex: activeIndex ?? this.activeIndex,
      );

  static TabBoxState initial() => const TabBoxState(
        activeIndex: 0,
      );

  @override
  List<Object?> get props => [
        activeIndex,
      ];
}
