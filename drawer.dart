//It will navigate to the page and have the focused color in the tab where it is present......for flutter web...

import 'package:flutter/material.dart';
import 'package:practise_widgets/drawerItems/Dart.dart';
import 'package:practise_widgets/drawerItems/flutter.dart';
import 'package:practise_widgets/drawerItems/ios.dart';
class CustomDrawer extends StatefulWidget {
    static final List<String> _listViewData = [
    "Flutter",
    "Ios",
    "Dart",
    "Android",
    "Laravel",
    "Php",
    "Html",
  ];
  final List<Widget> _children = [
    Flutter(),
    IOS(),
    Dart(),
  ];
  static int _currentSelected = 0;
  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
          child: ListView.builder(
            padding: EdgeInsets.all(10.0),
            itemCount: CustomDrawer._listViewData.length,
            itemBuilder: (context, index) {
              return Container(
                color: CustomDrawer._currentSelected == index
                    ? Colors.deepPurple
                    : Colors.white,
                child: ListTile(
                  title: Text(CustomDrawer._listViewData[index]),
                  onTap: () {
                    setState(() {
                      CustomDrawer._currentSelected = index;
                    });
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => widget._children[index]));
                  },
                ),
              );
            },
          ),
        ),
      );
  }
}
