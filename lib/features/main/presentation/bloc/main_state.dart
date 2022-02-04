part of 'main_bloc.dart';

abstract class MainState extends Equatable {
  const MainState();

  @override
  List<Object> get props => [];
}

class MainInitial extends MainState {
  const MainInitial();
}

class MainInitialState extends MainState {
  MainInitialState() {
//AllData.getInstance().
    var allData = AllData.getInstance();

    ElementEntity startElem = ElementEntity(nameElement: 'None', id: 0);
    allData.addEntity(startElem);
  }
}

class OpenSettingElementState extends MainState {
  BuildContext context;
  bool state = false;
  OpenSettingElementState(this.context, state) {
    Navigator.pushNamed(context, '/setting_element', arguments: state);
  }
}

class CloseSettingElementState extends MainState {
  int countEntities = 1;
  ElementEntity? elementEntity;
  BuildContext context;
  bool state = false;

  CloseSettingElementState(this.context, this.state,
      [ElementEntity? elemEntity]) {
    if (elemEntity != null) {
      Navigator.of(context).pop();
      elementEntity = elemEntity;
      if (state) AllData.getInstance().addEntity(elementEntity!);
    }
  }
}

class SetScaleState extends MainState {
  double scale = 1;
  SetScaleState(this.scale) {
    AllData.getInstance().scaleTimeLine = scale;
  }
}

class UpdateState extends MainState {}

class UpdatePaintBoardState extends MainState {}

class ScrollState extends MainState {}

class AddCutOnBoardState extends MainState {
  ElementEntity elementEntity;
  double width;
  double dx;
  AddCutOnBoardState(
      {required this.dx, required this.elementEntity, required this.width}) {
    LineContainerSourse lineContainerSourse = LineContainerSourse();
    ScaleParams params = lineContainerSourse.getScalePoint(width);
    var scale = AllData.getInstance().scaleTimeLine;
    var x = (dx + params.start) / scale;

    elementEntity.lineEntity.addCut(x);
  }
}

class ChangeTypeEnterState extends MainState {
  String newValue;
  ChangeTypeEnterState({required this.newValue}) {
    print('az');
  }
}
