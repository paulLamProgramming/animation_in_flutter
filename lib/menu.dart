import 'package:animation_in_flutter/pages/draggable_animation.dart';
import 'package:animation_in_flutter/pages/size_animation.dart';
import 'package:animation_in_flutter/pages/transition.dart';
import 'package:flutter/material.dart';


class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  late String title;
  late Widget currentWidget;

  @override
  void initState() {
    currentWidget = SizeAnimationPage();
    title = "Size Animation";
    super.initState();
  }

  listTapHandler(int index) {
    setState(() {
      switch (index) {
        case 0:
          {
            currentWidget = SizeAnimationPage();
            title = "Size Animation";
          }
          break;
        case 1:
          {
            currentWidget = DraggableAnimationPage();
            title = "Draggable Card";
          }
          break;
        case 2:
          {
            currentWidget = TransitionPage();
            title = "Transition";
          }
          break;

        default:
          break;
      }
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: currentWidget,
      drawer: Drawer(
          child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: null,
            decoration: BoxDecoration(color: Colors.blue),
          ),
          ListTile(
            title: Text("Size Animation"),
            onTap: () {
              listTapHandler(0);
            },
          ),
          ListTile(
              title: Text("Draggable Card"),
              onTap: () {
                listTapHandler(1);
              }),
          ListTile(
            title: Text("Page Transition"),
            onTap: () {
              listTapHandler(2);
            },
          )
        ],
      )),
    );
  }
}
