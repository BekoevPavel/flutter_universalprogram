import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_universalprogram/features/main/presentation/bloc/main_bloc.dart';
import 'package:flutter_universalprogram/features/main/presentation/widgets/buttons_add_remove_widget.dart';
import 'package:flutter_universalprogram/features/main/presentation/widgets/lines_container.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //userBloc.add(MainInitialEvent());
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          const AddRemoveButttons(),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: LineContainer(),
          ),
          _settingLinesWidget(context),
        ],
      ),
    );
  }
}

Widget _settingLinesWidget(BuildContext context) {
  final MainBloc userBloc = BlocProvider.of<MainBloc>(context);

  TextEditingController _scaleController = TextEditingController();
  _scaleController.text = '1';
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const Text('Масштаб'),
      const SizedBox(
        width: 10,
      ),
      Container(
        width: 100,
        height: 50,
        child: TextField(
          decoration: const InputDecoration(
            labelText: 'Scale',
            hintText: 'Введите название элемента',
          ),
          controller: _scaleController,
        ),
      ),
      ElevatedButton(
        onPressed: () => userBloc.add(
          SetScaleEvent(
            double.parse(_scaleController.text),
          ),
        ),
        child: const Text('OK'),
      ),
    ],
  );
}
