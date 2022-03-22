import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_universalprogram/features/main/presentation/bloc/main_bloc.dart';

class AddRemoveButttons extends StatelessWidget {
  const AddRemoveButttons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            MainBloc mainBloc = BlocProvider.of<MainBloc>(context);
            //userBloc.add(OpenSettingElementEvent(context, true));
            mainBloc.add(
              AddElementEvent(context: context),
            );
          },
          child: const Text('Добавить таймлайн'),
        ),
        const SizedBox(
          width: 30,
        ),
        const ElevatedButton(
          onPressed: null,
          child: Text('Удалить таймлайн'),
        ),
      ],
    );
  }
}
