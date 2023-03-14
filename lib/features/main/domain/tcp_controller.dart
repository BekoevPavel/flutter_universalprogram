import 'dart:io';

import 'dart:typed_data';

import 'package:flutter_universalprogram/features/main/domain/sourse/reserved_variables_sourse.dart';

import 'all_data.dart';

List<int> convertToDigital(int value) {
  List<int> tmpLst = [];

  int remains = value % 2;
  int res = value ~/ 2;
  tmpLst.add(remains);

  for (int i = 0; i < 6; i++) {
    remains = res % 2;
    res = res ~/ 2;

    tmpLst.add(remains);
  }

  if (value >= 64 && value < 128) {
    tmpLst.add(0);
  } else if (value < 64) {
    tmpLst.add(0);
  } else {
    tmpLst.add(1);
  }
  tmpLst = tmpLst.reversed.toList();
  return tmpLst;
}

void handleConnection(Socket client) {
  print('Connection from'
      ' ${client.remoteAddress.address}:${client.remotePort}');

  //client.write(11);
  client.writeCharCode(125);

  // listen for events from the client
  client.listen(
    // handle data from the client
    (Uint8List data) async {
      //await Future.delayed(Duration(seconds: 1));
      final message = data;
      //AllData.getInstance().tcpVal.value = message.toList().toString();
      print('message:  ${message}');
      var str = AllData.getInstance().tcpVal;
      // var portC = message.toList()[2];
      //var portCDigital = convertToDigital(portC);

      AllData.getInstance().reservedVariables[22].function =
          message.toList().first.toString();
      AllData.getInstance().tcpVal.value = message.toList().toString();

      str.value = message.toList().toString();
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
}
