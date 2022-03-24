import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_universalprogram/features/main/domain/entities/element_entity.dart';
import 'package:flutter_universalprogram/features/main/presentation/pages/main_page.dart';

import 'package:flutter_universalprogram/features/main/presentation/pages/setting_element_page.dart';

import 'features/main/presentation/bloc/main_bloc.dart';
import 'dart:io' show WebSocket;
import 'dart:convert' show json;
import 'dart:async' show Timer;

Future<void> webSoketsWork() async {
  WebSocket.connect('ws://localhost:8080').then((WebSocket ws) {
    // our websocket server runs on ws://localhost:8000
    if (ws.readyState == WebSocket.open) {
      // as soon as websocket is connected and ready for use, we can start talking to other end
      ws.add(json.encode({
        'data': 'from client at ${DateTime.now().toString()}',
      })); // this is the JSON data format to be transmitted
      ws.listen(
        // gives a StreamSubscription
        (data) {
          print(
              '\t\t -- ${Map<String, String>.from(json.decode(data))}'); // listen for incoming data and show when it arrives
          Timer(Duration(seconds: 1), () {
            if (ws.readyState ==
                WebSocket
                    .open) // checking whether connection is open or not, is required before writing anything on socket
              ws.add(
                json.encode(
                  {
                    'data':
                        'from client at сам ты лох ${DateTime.now().toString()}',
                  },
                ),
              );
          });
        },
        onDone: () => print('[+]Done :)'),
        onError: (err) => print('[!]Error -- ${err.toString()}'),
        cancelOnError: true,
      );
    } else
      print('[!]Connection Denied');
    // in case, if serer is not running now
  }, onError: (err) => print('[!]Error -- ${err.toString()}'));
}

void main() async {
  //webSoketsWork();
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
            }
          },
          home: null),
    );
  }
}
