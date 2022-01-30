import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_universalprogram/features/main/presentation/bloc/main_bloc.dart';
import 'package:flutter_universalprogram/features/main/presentation/widgets/buttons_add_remove_widget.dart';
import 'package:flutter_universalprogram/features/main/presentation/widgets/lines_container.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MainBloc userBloc = BlocProvider.of<MainBloc>(context);
    userBloc.add(CloseSettingElementEvent(context, true));
    return Scaffold(
      body: Column(
        children: const [
          SizedBox(
            height: 30,
          ),
          AddRemoveButttons(),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: LineContainer(),
          )
        ],
      ),
    );
  }
}
