import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_universalprogram/features/main/domain/all_data.dart';
import 'package:flutter_universalprogram/features/main/domain/entities/element_entity.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(MainInitial()) {
    on<MainEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<OpenSettingElementEvent>((event, emit) {
      emit(OpenSettingElementState(event.context, event.state));
    });

    on<CloseSettingElementEvent>(
      (event, emit) {
        emit(CloseSettingElementState(
            event.context, event.state, event.elementEntity));
      },
    );
  }
}
