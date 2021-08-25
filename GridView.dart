// When you want to display your items as a grid rather than a normal list of items that come one after the next then use the GridView widget. Like story page in fb or a table 

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Grid List';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: GridView.count(
          // Create a grid with 2 columns. If you change the scrollDirection to
          // horizontal, this produces 2 rows.
          crossAxisCount: 2,
          // Generate 100 widgets that display their index in the List.
          children: List.generate(100, (index) {
            return Center(
              child: Text(
                'Item $index',
                style: Theme.of(context).textTheme.headline5,
              ),
            );
          }),
        ),
      ),
    );
  }
}


------------------------------------------------------------/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\---------------------------------------------------------------------------

----------------------------A GRIDVIEW TO MAKE KIND OF STORY GRID(IN FB) WITH   PROFILE PIC + NAME + IMAGE + LIKE BUTTON EMBEDDED-------------------------------------------
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight -150) / 2;
    final double itemWidth = size.width / 2;
  
    ....
    .....

  
GridView.count(
          crossAxisCount: 2,
          childAspectRatio: (itemWidth / itemHeight),
          children: List.generate(active.length, (index) {
            return Center(
              child: Container(
                width: MediaQuery.of(context).size.width*0.4,
                height: 240,
                 decoration: BoxDecoration(
                   border: Border.all(color: Colors.grey.shade200),
                   shape: BoxShape.rectangle,
                   borderRadius:BorderRadius.circular(10)
                   ),
                child: Column(
                children: [
                  Stack(children: [
                  Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: Image.asset(active[index].storyImage)),
                  Positioned(
                    top: 4,
                    left: 6,
                    child: CircleAvatar(
                      radius: 21,
                      backgroundColor: pPrimaryColor,
                        child: CircleAvatar(
                        backgroundColor: Colors.amber,
                        child: Text(
                          active[index].name[0],
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        radius: 18,
                      ),
                    ),
                  ),
                  Positioned(
                      top: 4,
                      right: 8,
                      child: Text(
                          active[index].name,
                          style: TextStyle(
                          color: Theme.of(context).textTheme.bodyText1!.color,
                          fontWeight: FontWeight.bold))),
                  Positioned(
                      bottom: -10,
                      right: -2,
                      child:IconButton(
                              icon: active[index].isFavorite
                                  ? Icon(Icons.thumb_up, color: Colors.red)
                                  : Icon(Icons.thumb_up_alt_outlined),
                              onPressed: () {
                                setState(() {
                                  active[index].isFavorite =
                                      !active[index].isFavorite;
                                  print("pressed");
                                }); }
                           )
                      ),
                   ])
              ],
            ),
           )
          );
        }
      ),
    ),
