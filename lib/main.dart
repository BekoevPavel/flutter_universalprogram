import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_universalprogram/features/main/presentation/pages/main_page.dart';

import 'package:flutter_universalprogram/features/main/presentation/pages/setting_element_page.dart';

import 'features/main/presentation/bloc/main_bloc.dart';

void main() {
  runApp(const HomePage());
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MainBloc>(
      create: (context) => MainBloc(),
      child: MaterialApp(
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/':
              return MaterialPageRoute(builder: (context) => MainPage());
            case '/setting_element':
              bool? _addedWidget = settings.arguments as bool;
              return MaterialPageRoute(
                builder: (context) => SettingElementPage(_addedWidget),
              );
          }
        },
        home: null,
      ),
    );
  }
}
