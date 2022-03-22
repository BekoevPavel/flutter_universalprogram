import 'package:flutter/material.dart';
import 'package:flutter_universalprogram/features/main/domain/all_data.dart';
import 'package:flutter_universalprogram/features/main/presentation/bloc/main_bloc.dart';

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
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
              Radius.circular(2.0) //                 <--- border radius here
              ),
          color: const Color.fromARGB(200, 188, 226, 237),
          border: Border.all(
            color: Colors.black87,
            width: 1.1,
            style: BorderStyle.solid,
          ),
        ),
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
                  width: 30,
                  height: heightBar,
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
