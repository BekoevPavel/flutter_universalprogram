part of 'main_bloc.dart';

abstract class MainEvent extends Equatable {
  //const MainEvent();
  const MainEvent();

  @override
  List<Object> get props => [];
}

class MainInitialEvent extends MainEvent {}

class OpenSettingElementEvent extends MainEvent {
  BuildContext context;
  ElementEntity elementEntity;
  OpenSettingElementEvent({required this.context, required this.elementEntity});
}

class AddElementEvent extends MainEvent {
  BuildContext context;
  AddElementEvent({required this.context});
}

class CloseSettingElementEvent extends MainEvent {
  ElementEntity? elementEntity;
  BuildContext context;

  CloseSettingElementEvent(this.context, [ElementEntity? elemEntity]) {
    if (elemEntity != null) {
      elementEntity = elemEntity;
    }
  }
}

class SetScaleEvent extends MainEvent {
  double scale = 1;
  SetScaleEvent(this.scale);
}

class UpdateEvent extends MainEvent {}

class AddCutOnBoardEvent extends MainEvent {
  ElementEntity elementEntity;
  double width;
  double dx;
  AddCutOnBoardEvent(
      {required this.dx, required this.elementEntity, required this.width});
}

class ScrollEvent extends MainEvent {}

class ChangeTypeEnterEvent extends MainEvent {
  String newValue;
  TypeEnter typeEnter;

  ChangeTypeEnterEvent({required this.newValue, required this.typeEnter});
}

class AddPinEvent extends MainEvent {
  ElementEntity elementEntity;
  int number;
  TypePin typePin;
  AddPinEvent(
      {required this.typePin,
      required this.number,
      required this.elementEntity});
}
