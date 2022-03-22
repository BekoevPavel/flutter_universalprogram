import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_universalprogram/features/main/domain/entities/element_entity.dart';
import 'package:flutter_universalprogram/features/main/presentation/bloc/main_bloc.dart';

class AddedElementWidget extends StatelessWidget {
  final ElementEntity elementEntity;
  const AddedElementWidget({Key? key, required this.elementEntity})
      : super(key: key);

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
      padding: const EdgeInsets.all(10),
      width: 160,
      height: 100,
      child: Column(
        children: [
          Text(
            elementEntity.typeEnter == TypeEnter.input ? 'Input' : 'Output',
          ),
          Text(elementEntity != null
              ? '${elementEntity.nameElement} id: ${elementEntity.id}'
              : 'No'),
          IconButton(
            iconSize: 20,
            onPressed: () {
              userBloc.add(
                OpenSettingElementEvent(
                    context: context, elementEntity: elementEntity),
              );
            },
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
    );
  }
}
