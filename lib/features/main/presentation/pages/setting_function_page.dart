import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_universalprogram/features/main/domain/all_data.dart';
import 'package:flutter_universalprogram/features/main/domain/entities/user_function_entity.dart';
import 'package:flutter_universalprogram/features/main/presentation/widgets/setting_func/func_element.dart';
import 'package:get/get.dart';

import '../bloc/main_bloc.dart';

class SettingFunctionPage extends StatelessWidget {
  const SettingFunctionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.save),
          backgroundColor: Colors.green,
          onPressed: (() {
            final MainBloc mainBloc = BlocProvider.of<MainBloc>(context);
            mainBloc.add(CloseSettingFunctionEvent(context: context));
          }),
        ),
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                'Пользовательские функции: ',
                style: TextStyle(fontSize: 20),
              ),
            ),
            Expanded(
              child: Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.all(20),
                        child: Obx(() {
                          return ListView.builder(
                              itemCount: AllData.getInstance()
                                  .usersFunctionsEntities
                                  .length,
                              itemBuilder: (context, index) {
                                return FunctionElementWidget(
                                  userFunctionEntity: AllData.getInstance()
                                      .usersFunctionsEntities[index],
                                );
                              });
                        }),
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          AllData.getInstance()
                              .usersFunctionsEntities
                              .add(UserFunctionEntity());
                        },
                        child: const Text('Добавить'))
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
