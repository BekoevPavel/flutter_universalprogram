import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_universalprogram/features/main/domain/all_data.dart';
import 'package:flutter_universalprogram/features/main/domain/entities/element_entity.dart';
import 'package:flutter_universalprogram/features/main/presentation/bloc/main_bloc.dart';
import 'package:flutter_universalprogram/features/main/presentation/widgets/setting/change_entertype_widget.dart';
import 'package:flutter_universalprogram/features/main/presentation/widgets/setting/input_widget.dart';
import 'package:flutter_universalprogram/features/main/presentation/widgets/setting/list_frypins_widget.dart';
import 'package:flutter_universalprogram/features/main/presentation/widgets/setting/listpin_widget.dart';
import 'package:flutter_universalprogram/features/main/presentation/widgets/setting/output_widget.dart';

class SettingElementPage extends StatelessWidget {
  bool? addedWidget = false;
  SettingElementPage(this.addedWidget, {Key? key}) : super(key: key);
  TextEditingController _nameController = TextEditingController();
  TextEditingController _functionController = TextEditingController();
  List<TextEditingController> _pinsFuncController = [];
  late Future<List<dynamic>> datas;
  String dropdownValue = 'Input Element';

  @override
  Widget build(BuildContext context) {
    //final MainBloc userBloc = BlocProvider.of<MainBloc>(context);
    return Scaffold(
      body: Center(
        child: Container(
            width: 400,
            decoration: BoxDecoration(
              color: Colors.grey[100],
              border: Border.all(
                color: Colors.green,
              ),
            ),
            padding: const EdgeInsets.all(20),
            child: BlocBuilder<MainBloc, MainState>(builder: (context, state) {
              MainBloc mainBloc = BlocProvider.of<MainBloc>(context);
              if (state is ChangeTypeEnterState) {
                dropdownValue = (state as ChangeTypeEnterState).newValue;
              }
              //print('set');

              return Form(
                child: Column(
                  children: [
                    ChangeEnterTypeWidget(
                      mainBloc: mainBloc,
                      dropdownValue: dropdownValue,
                    ),
                    ListFryPinsWidget(),
                    TextFormField(
                      controller: _nameController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green),
                        ),
                        labelText: 'Название элемента *',
                        hintText: 'Введите название элемента',
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    dropdownValue == 'Input Element'
                        ? InputElementWidget()
                        : OutPutElementWidget(),
                    const SizedBox(
                      height: 15,
                    ),
                    IconButton(
                      iconSize: 50,
                      onPressed: () {
                        var id = AllData.getInstance()
                            .elementEntities
                            .length; // изменить когда сделаю удаление, что корректно считался номер id
                        ElementEntity elementEntity = ElementEntity(
                            nameElement: _nameController.text, id: id);
                        MainBloc userBloc = BlocProvider.of<MainBloc>(context);
                        userBloc.add(CloseSettingElementEvent(
                            context, addedWidget!, elementEntity));
                      },
                      icon: const Icon(
                        Icons.save,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              );
            })),
      ),
    );
  }
}
