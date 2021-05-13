//By using column in floatingActionButton -

floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {},
            backgroundColor: pPrimaryColor,
            child: Icon(
              Icons.video_call,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 8,),
          FloatingActionButton(
              onPressed: () {},
              backgroundColor: pPrimaryColor,
              child: Icon(
                Icons.phone_forwarded,
                color: Colors.white,
              ),
            ),
        ],
  
  
  
  
  
  -------------------------------------------------------------------\/\/\/\/\/\/\/\/\/--------------------------------------------------------- 
  
  
  
  
  
  // OR You can use the flutter_speed_dial package: https://pub.dartlang.org/packages/flutter_speed_dial
  Example using it:
  Widget _getFAB() {
        return SpeedDial(
          animatedIcon: AnimatedIcons.menu_close,
          animatedIconTheme: IconThemeData(size: 22),
          backgroundColor: Color(0xFF801E48),
          visible: true,
          curve: Curves.bounceIn,
          children: [
                // FAB 1
                SpeedDialChild(
                child: Icon(Icons.assignment_turned_in),
                backgroundColor: Color(0xFF801E48),
                onTap: () { /* do anything */ },
                label: 'Button 1',
                labelStyle: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    fontSize: 16.0),
                labelBackgroundColor: Color(0xFF801E48)),
                // FAB 2
                SpeedDialChild(
                child: Icon(Icons.assignment_turned_in),
                backgroundColor: Color(0xFF801E48),
                onTap: () {
                   setState(() {
                      _counter = 0;
                   });
                },
                label: 'Button 2',
                labelStyle: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    fontSize: 16.0),
                labelBackgroundColor: Color(0xFF801E48))
          ],
        );
  }
