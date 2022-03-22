import 'package:flutter/material.dart';
import 'package:flutter_universalprogram/features/main/domain/entities/element_entity.dart';
import 'package:flutter_universalprogram/features/main/presentation/pages/search_page.dart';

import 'listpin_widget.dart';

class OutPutElementWidget extends StatelessWidget {
  ElementEntity elementEntity;
  OutPutElementWidget({Key? key, required this.elementEntity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'y = F(t)',
          style: TextStyle(fontSize: 16),
        ),
        const SizedBox(
          height: 30,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 400,
              height: 300,
              child: ListPinFuncWidget(
                elementEntity: elementEntity,
              ),
            ),
            Container(
              width: 300,
              height: 300,
              child: SearchWidget(),
            ),
          ],
        ),
      ],
    );
  }
}
