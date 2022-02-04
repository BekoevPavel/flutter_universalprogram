import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_universalprogram/features/main/domain/all_data.dart';
import 'package:flutter_universalprogram/features/main/presentation/bloc/main_bloc.dart';
import 'package:flutter_universalprogram/features/main/presentation/widgets/Line/element/added_element_widget.dart';
import 'package:flutter_universalprogram/features/main/presentation/widgets/Line/time_line_widget.dart';

class LineContainer extends StatelessWidget {
  double scale = 1;
  LineContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context1) {
    return Center(
      child: Container(
        color: Colors.grey[200],
        margin: const EdgeInsets.all(12),
        child: BlocBuilder<MainBloc, MainState>(
          builder: (context, state) {
            MainBloc userBloc = BlocProvider.of<MainBloc>(context);
            userBloc.add(UpdateEvent());
            return listLines(context, state);
          },
        ),
      ),
    );
  }
}

Widget listLines(BuildContext context, MainState state) {
  var allData = AllData.getInstance();

  return ListView.builder(
    itemCount: AllData.getInstance().elementEntities.length,
    itemBuilder: (context, index) {
      return Column(
        children: [
          Row(
            children: [
              AddedElementWidget(
                elementEntity: allData.elementEntities[index],
              ),
              const SizedBox(
                width: 10,
              ),
              TimeLineWidget(
                elementEntity: allData.elementEntities[index],
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
        ],
      );
    },
  );
}
