import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_universalprogram/features/main/domain/all_data.dart';
import 'package:flutter_universalprogram/features/main/domain/entities/element_entity.dart';
import 'package:flutter_universalprogram/features/main/domain/sourse/pins_sourse.dart';
import 'package:flutter_universalprogram/features/main/domain/sourse/reserved_variables_sourse.dart';
import 'package:flutter_universalprogram/features/main/presentation/pages/main_page.dart';
import 'package:flutter_universalprogram/features/main/presentation/pages/setting_element_page.dart';
import 'package:flutter_universalprogram/features/main/presentation/pages/setting_function_page.dart';
import 'package:get/get.dart';
import 'features/main/domain/tcp_controller.dart';
import 'features/main/presentation/bloc/main_bloc.dart';
import 'dart:io';
import 'features/main/presentation/widgets/main/buttons_add_remove_widget.dart';

void main() async {
  await connecting();
  AllData.getInstance().generateVariable();

  var portA = PortA();

  int val1 = 0;

  // Timer.periodic(const Duration(seconds: 3), (timer) {
  //   val1++;
  //   AllData.getInstance().reservedVariables[22].function = val1.toString();
  //   AllData.getInstance().tcpVal.value =
  //       ret(AllData.getInstance().reservedVariables[22].name!).toString() +
  //           '=' +
  //           AllData.getInstance().reservedVariables[22].function!;
  //   // AllData.getInstance().reservedVariables.first = ReservedVariable(name: 'dP1', function: )
  // });

  // for (int i = 0; i < AllData.getInstance().reservedVariables.length; i++) {
  //   //  print('i: $i ${AllData.getInstance().reservedVariables[i].name}');
  // }
  runApp(const HomePage());
}

ServerSocket? server;
Socket? socket;
Future<void> connecting() async {
  InternetAddress adress = InternetAddress('127.0.0.1');
  server = await ServerSocket.bind('192.168.4.2', 2400);

  // listen for clent connections to the server

  server!.listen((client) async {
    socket = client;
    handleConnection(socket!);
  });
}

sendToClient(Socket? client) {
  if (client != null) client.add([223, 221]);
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
                ElementEntity elementEntity =
                    settings.arguments as ElementEntity;
                return PageRouteBuilder(
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    return ScaleTransition(
                      alignment: Alignment.bottomCenter,
                      scale: Tween<double>(begin: 0.1, end: 1).animate(
                        CurvedAnimation(
                          parent: animation,
                          curve: Curves.ease,
                        ),
                      ),
                      child: child,
                    );
                  },
                  transitionDuration: const Duration(milliseconds: 300),
                  pageBuilder: (BuildContext context,
                      Animation<double> animation,
                      Animation<double> secondaryAnimation) {
                    return SettingElementPage(
                      elementEntity: elementEntity,
                    );
                  },
                );
              case '/setting_function':
                return PageRouteBuilder(
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    return ScaleTransition(
                      alignment: Alignment.bottomCenter,
                      scale: Tween<double>(begin: 0.1, end: 1).animate(
                        CurvedAnimation(
                          parent: animation,
                          curve: Curves.ease,
                        ),
                      ),
                      child: child,
                    );
                  },
                  transitionDuration: const Duration(milliseconds: 300),
                  pageBuilder: (BuildContext context,
                      Animation<double> animation,
                      Animation<double> secondaryAnimation) {
                    return const SettingFunctionPage();
                  },
                );
            }
          },
          home: null),
    );
  }
}
