import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_universalprogram/features/main/domain/all_data.dart';
import 'package:flutter_universalprogram/features/main/domain/entities/element_entity.dart';
import 'package:flutter_universalprogram/features/main/domain/entities/line_entity.dart';
import 'package:flutter_universalprogram/features/main/domain/sourse/line_container_sourse.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(MainInitialState()) {
    on<OpenSettingElementEvent>((event, emit) {
      emit(OpenSettingElementState(event.context, event.state));
    });
    on<SetScaleEvent>((event, emit) {
      emit(SetScaleState(event.scale));
    });
    on<CloseSettingElementEvent>(
      (event, emit) {
        emit(CloseSettingElementState(
            event.context, event.state, event.elementEntity));
      },
    );

    on<UpdateEvent>((event, emit) {
      emit(
        UpdateState(),
      );
    });

    on<ScrollEvent>((event, emit) {
      emit(ScrollState());
    });

    on<AddCutOnBoardEvent>((event, emit) {
      emit(AddCutOnBoardState(
          elementEntity: event.elementEntity,
          width: event.width,
          dx: event.dx));
    });
  }
}
