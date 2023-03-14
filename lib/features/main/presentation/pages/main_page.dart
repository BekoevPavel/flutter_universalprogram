import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_universalprogram/features/main/domain/all_data.dart';
import 'package:flutter_universalprogram/features/main/presentation/bloc/main_bloc.dart';
import 'package:flutter_universalprogram/features/main/presentation/widgets/main/buttons_add_remove_widget.dart';
import 'package:flutter_universalprogram/features/main/presentation/widgets/lines_container_widget.dart';
import 'package:flutter_universalprogram/features/main/presentation/widgets/main/progresbar_widget.dart';
import 'package:get/get.dart';

import '../../domain/sourse/line_container_sourse.dart';

class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);

  double startValue = 300.0;

  var posAnimate = AllData.getInstance().posAnimate;
//  BlocBuilder<MainBloc, MainState>(
//           builder: (context, state) {
//             MainBloc userBloc = BlocProvider.of<MainBloc>(context);
//             userBloc.add(UpdateEvent());
//             return listLines(context);
//           },
//         ),
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
              Expanded(
                child: BlocBuilder<MainBloc, MainState>(
                  builder: ((context, state) {
                    MainBloc userBloc = BlocProvider.of<MainBloc>(context);
                    if (state is AddCutOnBoardState) {
                      userBloc.add(UpdateEvent());
                      return LineContainer();
                    }

                    print('pdate');
                    userBloc.add(UpdateEvent());
                    return LineContainer();
                  }),
                  //LineContainer(),
                ),
              ),
              _settingLinesWidget(context),
            ],
          ),
          Obx(() {
            return Positioned(
              left: posAnimate.value,
              top: 90,
              //bottom: 65,
              child: Column(
                children: [
                  Container(
                    width: 1,
                    height: 600,
                    color: Colors.red,
                  ),
                  GestureDetector(
                    onTapDown: (onTap) {
                      startValue = onTap.globalPosition.dx;
                      if (posAnimate.value == 170.0) {
                        posAnimate.value = 170.001;
                      }
                    },
                    onVerticalDragUpdate: (onDrag) {
                      if (posAnimate.value > 170.0) {
                        posAnimate.value =
                            onDrag.localPosition.dx + startValue - 20;
                      } else {
                        posAnimate.value = 170.0;
                      }

                      //
                      //print('pos:${posAnimate.value}');
                      LineContainerSourse().calculeTimeOnLine();
                    },
                    child: Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(
                                20.0) //                 <--- border radius here
                            ),
                        color: const Color.fromARGB(200, 188, 226, 237),
                        border: Border.all(
                          color: Colors.black87,
                          width: 1.1,
                          style: BorderStyle.solid,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            );
          }),
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
      const SizedBox(
        width: 10,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx(() => Text(
                't = ${AllData.getInstance().currentTime.toStringAsFixed(3).substring(0, 5)} ok ${AllData.getInstance().tcpVal.value}',
                style: const TextStyle(
                  fontSize: 20,
                ),
              )),
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
        ],
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
//обновить виджет по новому!
// Container(
//                 width: 1000,
//                 height: 500,
//                 child: SingleChildScrollView(
//                   scrollDirection: Axis.horizontal,
//                   child: Container(
//                     width: 10000,
//                     height: 150,
//                     child: LineContainer(),
//                   ),
//                 ),
//               ),