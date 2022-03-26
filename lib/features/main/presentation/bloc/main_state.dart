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
    allData.elementEntities.add(startElem);
  }
}

class OpenSettingElementState extends MainState {
  BuildContext context;
  ElementEntity elementEntity;

  OpenSettingElementState(
      {required this.context, required this.elementEntity}) {
    Navigator.pushNamed(context, '/setting_element', arguments: elementEntity);
  }
}

class OpenSettingFunctionState extends MainState {
  BuildContext context;

  OpenSettingFunctionState({required this.context}) {
    Navigator.pushNamed(context, '/setting_function');
  }
}

class AddElementState extends MainState {
  BuildContext context;
  AddElementState({required this.context}) {
    ElementEntity elementEntity = ElementEntity(
      nameElement: 'None',
      id: AllData.getInstance().elementEntities.length,
    );

    AllData.getInstance().elementEntities.add(elementEntity);

    Navigator.pushNamed(context, '/setting_element', arguments: elementEntity);
  }
}

class CloseSettingFunctionState extends MainState {
  BuildContext context;
  CloseSettingFunctionState({required this.context}) {
    AllData.getInstance().userFunctionsReserved.clear();
    for (var i in AllData.getInstance().usersFunctionsEntities) {
      i.addToListVariables();
      //if (i.name != null && i.function != null) {
      //AllData.getInstance().reservedVariables.add(i.reservedVariable);
      //}
    }
    Navigator.of(context).pop();
  }
}

class CloseSettingElementState extends MainState {
  int countEntities = 1;
  ElementEntity? elementEntity;
  BuildContext context;
  bool state = false;

  CloseSettingElementState(this.context, this.elementEntity) {
    print('var: ${elementEntity}');

    var mass = AllData.getInstance()
        .reservedVariables
        .where((element) => element == elementEntity!.reservedVariable);

    if (elementEntity?.inputVariable != null) {
      if (mass.isEmpty) {
        AllData.getInstance()
            .reservedVariables
            .add(elementEntity!.reservedVariable);
      } else {
        //mass.first.function = elementEntity!.inputFunction!;
      }
    }

    Navigator.of(context).pop();

    // if (state) AllData.getInstance().addEntity(elementEntity!);
  }
}

class SetScaleState extends MainState {
  double scale = 1;
  SetScaleState(this.scale) {
    AllData.getInstance().scaleTimeLine = scale;
    LineContainerSourse().calculeTimeOnLine();
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
  TypeEnter typeEnter;
  ChangeTypeEnterState({required this.newValue, required this.typeEnter}) {}
}

class AddPinState extends MainState {
  ElementEntity elementEntity;
  int number;
  TypePin typePin;
  AddPinState(
      {required this.typePin,
      required this.number,
      required this.elementEntity}) {
    elementEntity.pins.add(Pin(typePin: typePin, number: number));
    print('pin added');
  }
}
