part of 'main_bloc.dart';

abstract class MainEvent extends Equatable {
  const MainEvent();

  @override
  List<Object> get props => [];
}

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
