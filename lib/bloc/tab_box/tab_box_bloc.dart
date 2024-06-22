import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'tab_box_event.dart';

part 'tab_box_state.dart';

class TabBoxBloc extends Bloc<TabBoxEvent, TabBoxState> {
  TabBoxBloc() : super(TabBoxState.initial()) {
    on<ChangeActiveIndexEvent>((ChangeActiveIndexEvent event, emit) {
      emit(
        state.copyWith(
          activeIndex: event.activeIndex,
        ),
      );
    });
  }
}
