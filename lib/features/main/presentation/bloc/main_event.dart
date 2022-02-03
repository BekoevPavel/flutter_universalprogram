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
  bool state = false;
  OpenSettingElementEvent(this.context, this.state);
}

class CloseSettingElementEvent extends MainEvent {
  ElementEntity? elementEntity;
  BuildContext context;
  bool state = false;
  CloseSettingElementEvent(this.context, this.state,
      [ElementEntity? elemEntity]) {
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
