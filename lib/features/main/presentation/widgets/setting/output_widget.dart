import 'package:flutter/material.dart';

import 'listpin_widget.dart';

class OutPutElementWidget extends StatelessWidget {
  const OutPutElementWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Text(
          'y = F(t)',
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(
          height: 30,
        ),
        ListPinFuncWidget(),
      ],
    );
  }
}
