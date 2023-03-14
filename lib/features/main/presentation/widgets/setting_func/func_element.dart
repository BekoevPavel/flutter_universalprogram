import 'package:flutter/material.dart';
import 'package:flutter_universalprogram/features/main/domain/all_data.dart';
import 'package:flutter_universalprogram/features/main/domain/entities/user_function_entity.dart';
import 'package:flutter_universalprogram/features/main/domain/sourse/convet_simbol_num.dart';

class FunctionElementWidget extends StatelessWidget {
  late FocusNode myFocusNodeName = FocusNode();
  late FocusNode myFocusNodeFunction = FocusNode();
  late TextEditingController _nameController =
      TextEditingController(text: correctStrToNum(userFunctionEntity.name));
  late TextEditingController _functionController =
      TextEditingController(text: correctStrToNum(userFunctionEntity.function));
  UserFunctionEntity userFunctionEntity;
  FunctionElementWidget({Key? key, required this.userFunctionEntity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 50,
          child: TextFormField(
            controller: _nameController,
            focusNode: myFocusNodeName,
            onEditingComplete: () {
              userFunctionEntity.name = _nameController.text;
              userFunctionEntity.name = _nameController.text;
              myFocusNodeName.unfocus();
            },
            decoration: const InputDecoration(
              labelText: 'Имя функции',
              hintText: 'Введите имя функции',
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 15.0),
          child: Text(
            ' = f(t) = ',
            style: TextStyle(fontSize: 20),
          ),
        ),
        Container(
          width: 300,
          child: TextFormField(
            controller: _functionController,
            focusNode: myFocusNodeFunction,
            onEditingComplete: () {
              userFunctionEntity.function = _functionController.text;
              userFunctionEntity.function = _functionController.text;
              myFocusNodeFunction.unfocus();
            },
            decoration: const InputDecoration(
              labelText: 'Функция',
              hintText: 'Введите функцию',
            ),
          ),
        ),
        IconButton(
          onPressed: () {
            AllData.getInstance()
                .usersFunctionsEntities
                .remove(userFunctionEntity);
            AllData.getInstance().reservedVariables.remove(userFunctionEntity);
          },
          icon: const Icon(
            Icons.highlight_remove,
            color: Colors.red,
          ),
        ),
      ],
    );
  }
}
