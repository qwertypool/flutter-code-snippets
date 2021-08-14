// Create stacked images 

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_stack/image_stack.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> images = <String>[];
    images.add('assets/blackwidow.jfif');
    images.add('assets/captAmerica.jfif');
    images.add('assets/iron.jpg');
    images.add('assets/thor.jfif');
    images.add('assets/hulk.jfif');
  
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Image Stack',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: Container(
          color: Colors.white,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                ImageStack(
                  imageList: images,
                  imageRadius: 150,
                  imageCount: 5,
                  imageBorderWidth: 3,
                  totalCount: 5,
                  backgroundColor: Colors.amber,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
