import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_universalprogram/features/main/domain/all_data.dart';
import 'package:flutter_universalprogram/features/main/domain/entities/element_entity.dart';
import 'package:flutter_universalprogram/features/main/domain/entities/pin_entity.dart';

import 'package:flutter_universalprogram/features/main/domain/sourse/line_container_sourse.dart';
import 'package:get/get.dart';

import '../../domain/sourse/reserved_variables_sourse.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(MainInitialState()) {
    on<OpenSettingElementEvent>((event, emit) {
      emit(
        OpenSettingElementState(
          context: event.context,
          elementEntity: event.elementEntity,
        ),
      );
    });

    on<AddElementEvent>((event, emit) {
      emit(
        AddElementState(context: event.context),
      );
    });

    on<SetScaleEvent>((event, emit) {
      emit(SetScaleState(event.scale));
    });
    on<CloseSettingElementEvent>(
      (event, emit) {
        emit(
          CloseSettingElementState(event.context, event.elementEntity),
        );
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

    on<ChangeTypeEnterEvent>((event, emit) {
      emit(ChangeTypeEnterState(
          newValue: event.newValue, typeEnter: event.typeEnter));
    });

    on<AddPinEvent>(((event, emit) => emit(AddPinState(
        typePin: event.typePin,
        number: event.number,
        elementEntity: event.elementEntity))));

    on<OpenSettingFunctionEvent>((event, emit) {
      emit(
        OpenSettingFunctionState(context: event.context),
      );
    });

    on<CloseSettingFunctionEvent>((event, emit) {
      emit(CloseSettingFunctionState(context: event.context));
    });
  }
}
