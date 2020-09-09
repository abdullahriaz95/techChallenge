import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:tech_challange/models/menu_item.dart';
import 'package:tech_challange/store/homestate.dart';
import 'package:tech_challange/store/intereststate.dart';
import 'package:tech_challange/styles.dart';

import '../category_names.dart';

class NavBar extends StatefulWidget {
  HomeState _homeState;
  InterestSelectionState _interestSelectionState;

  NavBar(HomeState state, InterestSelectionState interestSelectionState) {
    this._homeState = state;
    this._interestSelectionState = interestSelectionState;
  }

  createState() => NavBarState();
}

class NavBarState extends State<NavBar> {
  List items = [];
  double x = 0;
  MenuItem active;

  @override
  void initState() {
    super.initState();
    if (widget._interestSelectionState.funnySelected) {
      items.add(
        MenuItem(
          x: x,
          name: FUNNY,
        ),
      );
      this.x += 1;
    }
    if (widget._interestSelectionState.animalsSelected) {
      items.add(
        MenuItem(
          x: x,
          name: ANIMALS,
        ),
      );
      this.x += 1;
    }
    if (widget._interestSelectionState.musicSelected) {
      items.add(
        MenuItem(
          x: x,
          name: MUSIC,
        ),
      );
      this.x += 1;
    }
    if (widget._interestSelectionState.footballSelected) {
      items.add(
        MenuItem(
          x: x,
          name: FOOTBALL,
        ),
      );
      this.x += 1;
    }

    active = items[0];
  }

  @override
  Widget build(BuildContext context) {
    int size = 0;
    if (widget._interestSelectionState.funnySelected) {
      size++;
    }
    if (widget._interestSelectionState.musicSelected) {
      size++;
    }
    if (widget._interestSelectionState.footballSelected) {
      size++;
    }
    if (widget._interestSelectionState.animalsSelected) {
      size++;
    }
    double w = MediaQuery.of(context).size.width;
    double sizeOfIndicator = (MediaQuery.of(context).size.width - 60) / size;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      height: 60,
      child: Stack(
        children: [
          AnimatedContainer(
            duration: Duration(milliseconds: 200),
//            alignment: Alignment(active.x, -1),
            padding: EdgeInsets.only(left: active.x * sizeOfIndicator),
            child: AnimatedContainer(
              decoration: BoxDecoration(
                color: mainLightColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              duration: Duration(milliseconds: 200),
              height: 60,
              width: sizeOfIndicator,
            ),
          ),
          Container(
            child: Row(
              children: [

//                LayoutBuilder(
//                  builder: (context, constraints){
//                    if(items != null){
//                      for(var j in items){
//                        return  Flexible(
//                          flex: 1,
//                          child: _flare(j),
//                        );
//                      }
//                    }
//                    return Container();
//
//                  },
//                ),
                for (var item in items) Flexible(
                  flex: 1,
                  child: _flare(item),
                ),
//                Flexible(
//                  flex: 1,
//                  child: _flare(items[0]),
//                ),
//                Flexible(
//                  flex: 1,
//                  child: _flare(items[1]),
//                ),
//                Flexible(
//                  flex: 1,
//                  child: _flare(items[2]),
//                ),
//                Flexible(
//                  flex: 1,
//                  child: _flare(items[3]),
//                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _flare(MenuItem item) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: FlareActor(
          'assets/${item.name}.flr',
          alignment: Alignment.center,
          fit: BoxFit.fitHeight,
          animation: item.name == active.name ? 'go' : 'stop',
        ),
      ),
      onTap: () {
        // we trigger mobx action here
        widget._homeState.changeCategory(item.name);
        setState(() {
          active = item;
        });
      },
    );
  }
}
