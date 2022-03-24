import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_universalprogram/features/main/domain/entities/element_entity.dart';
import 'package:flutter_universalprogram/features/main/presentation/bloc/main_bloc.dart';
import 'package:flutter_universalprogram/features/main/presentation/pages/search_page.dart';
import 'package:flutter_universalprogram/features/main/presentation/widgets/setting/change_entertype_widget.dart';
import 'package:flutter_universalprogram/features/main/presentation/widgets/setting/input_widget.dart';
import 'package:flutter_universalprogram/features/main/presentation/widgets/setting/list_frypins_widget.dart';
import 'package:flutter_universalprogram/features/main/presentation/widgets/setting/output_widget.dart';

class SettingElementPage extends StatelessWidget {
  ElementEntity elementEntity;
  late String dropdownValue;

  SettingElementPage({Key? key, required this.elementEntity})
      : super(key: key) {
    dropdownValue = elementEntity.typeEnter == TypeEnter.input
        ? 'Input Element'
        : 'OutPut Element';
  }

  //Controllers
  TextEditingController _nameController = TextEditingController();
  TextEditingController _functionController = TextEditingController();
  List<TextEditingController> _pinsFuncController = [];
  //late Future<List<dynamic>> datas;

  @override
  Widget build(BuildContext context) {
    _nameController.text = elementEntity.nameElement;
    // typeEnter = elementEntity.typeEnter ?? TypeEnter.output;
    // if (typeEnter == TypeEnter.input) {
    //   dropdownValue == 'Input Element';
    // } else {
    //   dropdownValue == 'OutPut Element';
    // }
    // print(typeEnter);
    return Scaffold(
      body: Container(
        //width: 400,
        decoration: BoxDecoration(
          color: Colors.grey[100],
          border: Border.all(
            color: Colors.green,
          ),
        ),
        padding: const EdgeInsets.all(20),
        child: BlocBuilder<MainBloc, MainState>(
          builder: (context, state) {
            MainBloc mainBloc = BlocProvider.of<MainBloc>(context);
            if (state is ChangeTypeEnterState) {
              dropdownValue = (state as ChangeTypeEnterState).newValue;
              elementEntity.typeEnter =
                  (state as ChangeTypeEnterState).typeEnter;
            }
            //print('set');

            return Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text(
                        'Тип элемента:',
                        style: TextStyle(fontSize: 16),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      ChangeEnterTypeWidget(
                        mainBloc: mainBloc,
                        dropdownValue: dropdownValue,
                        typeEnter: elementEntity.typeEnter ?? TypeEnter.output,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 300,
                    child: TextFormField(
                      controller: _nameController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green),
                        ),
                        labelText: 'Название элемента *',
                        hintText: 'Введите название элемента',
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Divider(),
                  elementEntity.typeEnter == TypeEnter.input
                      ? InputElementWidget(
                          elementEntity: elementEntity,
                        )
                      : OutPutElementWidget(
                          elementEntity: elementEntity,
                        ),
                  const SizedBox(
                    height: 15,
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: IconButton(
                      iconSize: 50,
                      onPressed: () {
                        elementEntity.typeEnter ??= TypeEnter.output;
                        elementEntity.nameElement = _nameController.text;
                        MainBloc userBloc = BlocProvider.of<MainBloc>(context);
                        print('element: ${elementEntity}');
                        userBloc.add(
                          CloseSettingElementEvent(
                            context,
                            elementEntity,
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.save,
                        color: Colors.green,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
