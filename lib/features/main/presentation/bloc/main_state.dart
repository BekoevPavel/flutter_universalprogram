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

    ElementEntity startElem = ElementEntity(nameElement: 'None', lastId: 0);
    allData.elementEntities.add(startElem);
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
      if (state) AllData.getInstance().elementEntities.add(elementEntity!);
    }
  }
}

class SetScaleState extends MainState {
  double scale = 1;
  SetScaleState(this.scale) {
    AllData.getInstance().scaleTimeLine = scale;
    print('scale ${AllData.getInstance().scaleTimeLine}');
  }
}

class UpdateState extends MainState {}
