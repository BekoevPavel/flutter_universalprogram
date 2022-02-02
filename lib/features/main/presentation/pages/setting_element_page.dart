import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_universalprogram/features/main/domain/all_data.dart';
import 'package:flutter_universalprogram/features/main/domain/entities/element_entity.dart';
import 'package:flutter_universalprogram/features/main/presentation/bloc/main_bloc.dart';

class SettingElementPage extends StatelessWidget {
  bool? addedWidget = false;
  SettingElementPage(this.addedWidget, {Key? key}) : super(key: key);
  TextEditingController _nameController = TextEditingController();
  TextEditingController _functionController = TextEditingController();
  List<TextEditingController> _pinsFuncController = [];

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
          child: Form(
            child: Column(
              children: [
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
                const Text(
                  'y = F(t)',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(
                  height: 30,
                ),
                _pinsController(),
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
          ),
        ),
      ),
    );
  }
}

Widget _pinsController() {
  return Container(
    height: 300,
    decoration: BoxDecoration(
      color: Colors.grey[200],
      border: Border.all(
        color: Colors.green,
      ),
    ),
    child: Column(
      children: [
        const Text('Функции для пинов'),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.add),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.remove),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          color: Colors.grey[350],
          width: 300,
          height: 200,
          child: _listPins(),
        ),
      ],
    ),
  );
}

Widget _listPins() {
  return ListView.builder(
      itemCount: 3,
      itemBuilder: (BuildContext context, index) {
        return _pinFuncWidget();
      });
}

Widget _pinFuncWidget() {
  return TextFormField(
    decoration: const InputDecoration(
      labelText: 'Функция F(t) *',
      hintText: 'Введите функцию F(t)',
      prefixIcon: Icon(
        Icons.fiber_pin_outlined,
        color: Colors.green,
      ),
    ),
  );
}
