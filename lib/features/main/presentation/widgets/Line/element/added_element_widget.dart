import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_universalprogram/features/main/domain/entities/element_entity.dart';
import 'package:flutter_universalprogram/features/main/presentation/bloc/main_bloc.dart';

class AddedElementWidget extends StatelessWidget {
  ElementEntity? elementEntity;
  AddedElementWidget({Key? key, this.elementEntity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MainBloc userBloc = BlocProvider.of<MainBloc>(context);

    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        border: Border.all(
          color: Colors.green,
        ),
      ),
      padding: const EdgeInsets.all(20),
      width: 160,
      height: 100,
      child: Column(
        children: [
          Text(elementEntity != null
              ? '${elementEntity!.nameElement!} id: ${elementEntity!.id}'
              : 'No'),
          IconButton(
              onPressed: () {
                userBloc.add(
                  OpenSettingElementEvent(context, false),
                );
              },
              icon: const Icon(Icons.settings))
        ],
      ),
    );
  }
}
