import 'dart:async';
import 'dart:io';
import 'dart:isolate';
import 'dart:typed_data';

import 'package:flutter_universalprogram/features/main/domain/all_data.dart';

import 'main.dart';

class CrossIsolatesMessage {
  final SendPort sender;
  final int message;

  CrossIsolatesMessage({required this.sender, required this.message});
}

late SendPort newIsolateSendPort;

//
// Экземпляр нового изолята
//
late Isolate newIsolate;

//
// Метод, который запускает новый изолят
// и процесс рукопожатия
//
void callerCreateIsolate(int message) async {
  //
  // Локальный временный ReceivePort для получения
  // SendPort нового изолята
  //
  ReceivePort receivePort = ReceivePort();

  //
  // Создание экземпляра изолята
  //
  newIsolate = await Isolate.spawn(
    callbackFunction,
    receivePort.sendPort,
  );

  //
  // Запрос порта для организации "общения"
  //
  newIsolateSendPort = await receivePort.first;

  var res = sendReceive(message);

  print('res: $res');
}

//
// Точка входа нового изолята
//
void callbackFunction(SendPort callerSendPort) async {
  //
  // Создаём экземпляр SendPort для получения сообщения
  // от вызывающего
  //
  ReceivePort newIsolateReceivePort = ReceivePort();

  //
  // Даём "вызывающему" ссылку на SendPort ЭТОГО изолята
  //
  callerSendPort.send(newIsolateReceivePort.sendPort);

  //
  // Функция изолята, которая слушает входящие сообщения,
  // обрабатывает и отправляет ответ
  //
  newIsolateReceivePort.listen((dynamic message) async {
    CrossIsolatesMessage incomingMessage = message as CrossIsolatesMessage;

    //
    // Обработка сообщения
    //
    String newMessage =
        "complemented string " + incomingMessage.message.toString();

    ServerSocket server = await ServerSocket.bind('192.168.4.2', 2400);
    Socket? socket;
    server.listen((client) async {
      socket = client;
      print('Connection from'
          ' ${client.remoteAddress.address}:${client.remotePort}');

      //client.write(11);
      client.writeCharCode(125);

      // listen for events from the client
      client.listen(
        // handle data from the client
        (Uint8List data) async {
          await Future.delayed(Duration(seconds: 1));
          final message = String.fromCharCodes(data);

          AllData.getInstance().tcpVal.value = message;
          incomingMessage.sender.send(message);

          print('value: ${AllData.getInstance().tcpVal.value} pri: $message');
        },

        // handle errors
        onError: (error) {
          print(error);
          client.close();
        },

        // handle the client closing the connection
        onDone: () {
          print('Client left');
          client.close();
        },
      );
    });

    Timer.periodic(Duration(seconds: 1), (timer) {
      if (socket != null) socket?.writeCharCode(543);
      print('e: $newMessage');
    });

    //
    // Отправляем результат обработки
    //
    incomingMessage.sender.send(newMessage);
  });
}

Future<String> sendReceive(int messageToBeSent) async {
  //
  // Временный порт для получения ответа
  //
  ReceivePort port = ReceivePort();

  //
  // Отправляем сообщение изоляту, а также
  // говорим изоляту, какой порт использовать
  // для отправки ответа
  //
  newIsolateSendPort.send(CrossIsolatesMessage(
    sender: port.sendPort,
    message: messageToBeSent,
  ));

  //
  // Ждём ответ и возвращаем его
  //
  return await port.first;
}
