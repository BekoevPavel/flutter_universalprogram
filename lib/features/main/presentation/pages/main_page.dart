import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_universalprogram/features/main/domain/all_data.dart';
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

class ProgressBarWidget extends StatefulWidget {
  MainBloc mainBloc;
  ProgressBarWidget({Key? key, required this.mainBloc}) : super(key: key);

  @override
  State<ProgressBarWidget> createState() => _ProgressBarWidgetState(mainBloc);
}

class _ProgressBarWidgetState extends State<ProgressBarWidget> {
  MainBloc mainBloc;

  double width = 1;

  _ProgressBarWidgetState(this.mainBloc);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  final double heightBar = 20;
  GlobalKey progres_key = GlobalKey();
  double delta_x = 0;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        key: progres_key,
        height: heightBar,
        color: Colors.grey,
        child: GestureDetector(
          onVerticalDragUpdate: (onDrag) {
            delta_x = onDrag.localPosition.dx;

            if (delta_x > 0 &&
                delta_x < progres_key.currentContext!.size!.width) {
              width = progres_key.currentContext!.size!.width;
              setState(
                () {
                  delta_x = onDrag.localPosition.dx;

                  AllData.getInstance().scrollK = delta_x;

                  mainBloc.add(ScrollEvent());
                },
              );
            }
          },
          child: Stack(
            children: [
              Positioned(
                left: posLeft(delta_x, width - 15),
                child: Container(
                  width: heightBar,
                  height: 30,
                  color: Colors.black54,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

double posLeft(double delta_x, double width) {
  if (delta_x > 0 && delta_x < width)
    return delta_x;
  else if (delta_x > 0 && delta_x > width) {
    return width;
  }

  return 0;
}
