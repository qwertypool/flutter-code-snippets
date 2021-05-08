#firstly add the  flutter_svg: ^0.22.0 (whichever be the latest version) in your pubspec.yaml file

 #then import the package - 
 import 'package:flutter_svg/svg.dart';

#then add the svg icon like : 
              SvgPicture.asset(
                             "assets/icons/chat.svg",
                           // color: Theme.of(context).textTheme.bodyText1!.color, (for light/dark theme compatiblity )
                            color: Colors.red,
                            height: 200,
                            width: 200,
                          ),
