import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_universalprogram/features/main/domain/all_data.dart';
import 'package:flutter_universalprogram/features/main/presentation/bloc/main_bloc.dart';
import 'package:flutter_universalprogram/features/main/presentation/widgets/added_element_widget.dart';
import 'package:flutter_universalprogram/features/main/presentation/widgets/time_line_widget.dart';

class LineContainer extends StatelessWidget {
  const LineContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //userBloc.add(CloseSettingElementEvent(context, true));
    return Center(
      child: Container(
        color: Colors.grey[200],
        margin: const EdgeInsets.all(12),
        child: BlocBuilder<MainBloc, MainState>(
          builder: (context, state) {
            if (state is CloseSettingElementState)
              return listLines(context, state as CloseSettingElementState);
            return Text('');
          },
        ),
      ),
    );
  }
}

Widget listLines(BuildContext context, CloseSettingElementState state) {
  var allData = AllData.getInstance();
  return ListView.builder(
    itemCount: state.countEntities,
    itemBuilder: (BuildContext context, index) {
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
              const TimeLineWidget(),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      );
    },
  );
}
