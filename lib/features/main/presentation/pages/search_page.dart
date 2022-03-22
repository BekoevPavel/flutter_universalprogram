import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_universalprogram/features/main/domain/all_data.dart';
import 'package:flutter_universalprogram/features/main/domain/entities/element_entity.dart';
import 'package:flutter_universalprogram/features/main/domain/sourse/pins_sourse.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

import '../../domain/entities/pin_entity.dart';
import '../bloc/main_bloc.dart';

class SearchWidget extends StatefulWidget {
  ElementEntity elementEntity;
  SearchWidget({Key? key, required this.elementEntity}) : super(key: key);

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  FloatingSearchBarController _searchBarController =
      FloatingSearchBarController();
  var pins = [
    'digitalPin1',
    'digitalPin2',
    'digitalPin3',
    'digitalPin4',
    'digitalPin5',
    'digitalPin6',
    'analogPin1',
    'analogPin2',
    'analogPin3',
  ];

  @override
  void initState() {
    // TODO: implement initState
    print('update');
  }

  @override
  Widget build(BuildContext context) {
    for (var i in widget.elementEntity.pins) {
      removePinInVariblesList(pins, i);
    }
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    MainBloc userBloc = BlocProvider.of<MainBloc>(context);

    return Container(
      width: 300,
      child: FloatingSearchBar(
        hint: 'Добавить pin...',
        controller: _searchBarController,
        scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
        transitionDuration: const Duration(milliseconds: 800),
        transitionCurve: Curves.easeInOut,
        physics: const BouncingScrollPhysics(),
        axisAlignment: isPortrait ? 0.0 : -1.0,
        openAxisAlignment: 0.0,
        width: isPortrait ? 600 : 500,
        debounceDelay: const Duration(milliseconds: 500),
        onQueryChanged: (query) {
          userBloc.add(
            AddPinEvent(
                typePin: query.split('').first == 'd'
                    ? TypePin.digital
                    : TypePin.analog,
                number: int.parse(query.split('').last),
                elementEntity: widget.elementEntity),
          );

          // Call your model, bloc, controller here.
        },
        // Specify a custom transition to be used for
        // animating between opened and closed stated.
        transition: CircularFloatingSearchBarTransition(),
        // actions: [
        //   FloatingSearchBarAction(
        //     showIfOpened: false,
        //     child: CircularButton(
        //       icon: const Icon(Icons.place),
        //       onPressed: () {},
        //     ),
        //   ),
        //   FloatingSearchBarAction.searchToClear(
        //     showIfClosed: false,
        //   ),
        // ],
        builder: (context, transition) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Material(
              color: Colors.white,
              elevation: 4.0,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: pins
                    .map(
                      (e) => GestureDetector(
                        onTap: () {
                          _searchBarController.close();
                          _searchBarController.query = e;
                          _searchBarController.show();
                        },
                        child: Container(
                          height: 30,
                          width: double.infinity,
                          color: Colors.red,
                          child: Text(
                            e,
                            style: const TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                    )
                    .toList(),
                //  Colors.accents.map(
                //   (color) {
                //     return Container(
                //       height: 50,
                //       color: color,
                //       child: const Text(
                //         'digitalPin1',
                //         style: TextStyle(fontSize: 15),
                //       ),
                //     );
                //   },
                // ).toList(),
              ),
            ),
          );
        },
      ),
    );
    ;
  }
}

/*

              userBloc.add(AddPinEvent(
              typePin: TypePin.digital,
              number: int.parse(query.split('').last)));
              */