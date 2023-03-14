import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_universalprogram/features/main/domain/sourse/convet_simbol_num.dart';
import 'package:flutter_universalprogram/features/main/presentation/bloc/main_bloc.dart';
import 'package:get/get.dart';

import '../../../../../main.dart';
import '../../../domain/all_data.dart';

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

              mainBloc.add(OpenSettingFunctionEvent(context: context));
            },
            child: const Text('function set')),
        const SizedBox(
          width: 30,
        ),
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
        ElevatedButton(
          onPressed: () {
            //callerCreateIsolate(6654);
            sendToClient(socket);
          },
          child: Text('Удалить таймлайн: '),
        ),
        Container(
          width: 200,
          height: 20,
          child: Obx((() => Text(
              '${AllData.getInstance().tcpVal} name:${AllData.getInstance().reservedVariables[22].name} f: ${AllData.getInstance().reservedVariables[22].function}'))),
          //  ListView.builder(
          //   scrollDirection: Axis.horizontal,
          //   itemCount: AllData.getInstance().reservedVariables.length - 21,
          //   itemBuilder: ((context, index) {
          //     return Row(
          //       children: [
          //         Text(
          //             '${AllData.getInstance().reservedVariables[index + 21].name!}: ${AllData.getInstance().reservedVariables[index + 21].function!.value}'),
          //         const Text(', '),
          //       ],
          //     );
          //   }),
          // ),
        )
      ],
    );
  }
}

String ret(String str) {
  var res = convertSymbolToNum(str);
  // print('start: $str res: $res');
  return convertSymbolToNum(str);
}
