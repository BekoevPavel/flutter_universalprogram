import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_universalprogram/features/main/presentation/bloc/main_bloc.dart';
import 'package:flutter_universalprogram/features/main/presentation/widgets/main/buttons_add_remove_widget.dart';
import 'package:flutter_universalprogram/features/main/presentation/widgets/lines_container_widget.dart';
import 'package:flutter_universalprogram/features/main/presentation/widgets/main/progresbar_widget.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              const AddRemoveButttons(),
              const SizedBox(
                height: 20,
              ),
              const Expanded(
                child: LineContainer(),
              ),
              _settingLinesWidget(context),
            ],
          ),
          Positioned(
            left: 400,
            bottom: 65,
            child: Container(
              width: 1,
              height: 800,
              color: Colors.red,
            ),
          )
        ],
      ),
    );
  }
}

Widget _settingLinesWidget(BuildContext context) {
  final MainBloc mainBloc = BlocProvider.of<MainBloc>(context);

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
        onPressed: () => mainBloc.add(
          SetScaleEvent(
            double.parse(_scaleController.text),
          ),
        ),
        child: const Text('OK'),
      ),
      const SizedBox(
        width: 10,
      ),
      ProgressBarWidget(
        mainBloc: mainBloc,
      ),
      const SizedBox(
        width: 10,
      ),
    ],
  );
}
