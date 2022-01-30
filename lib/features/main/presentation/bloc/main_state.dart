part of 'main_bloc.dart';

abstract class MainState extends Equatable {
  const MainState();

  @override
  List<Object> get props => [];
}

class MainInitial extends MainState {}

class OpenSettingElementState extends MainState {
  BuildContext context;
  bool state = false;
  OpenSettingElementState(this.context, state) {
    Navigator.pushNamed(context, '/setting_element', arguments: state);
  }
}

class CloseSettingElementState extends MainState {
  int countEntities = 0;
  ElementEntity? elementEntity;
  BuildContext context;
  bool state = false;

  CloseSettingElementState(this.context, this.state,
      [ElementEntity? elemEntity]) {
    if (elemEntity != null) {
      Navigator.of(context).pop();
      elementEntity = elemEntity;
    } else {
      ElementEntity elem = ElementEntity(nameElement: 'None', lastId: 0);
      elementEntity = elem;
    }
    var allData = AllData.getInstance();

    if (state) {
      allData.elementEntities.add(elementEntity!);
    } else {}
    countEntities = allData.elementEntities.length;
  }
}
