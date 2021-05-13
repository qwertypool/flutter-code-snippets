// Underlining Text
//When underlining everything you can set a TextStyle on the Text widget.
Text(
  'Hello world',
  style: TextStyle(
    decoration: TextDecoration.underline,
  ),
)
//If you only want to underline part of the text then you need to use Text.rich() (or a RichText widget) and break the string into TextSpans that you can add a style to.

Text.rich(
  TextSpan(
    text: 'Hello ',
    style: TextStyle(fontSize: 50),
    children: <TextSpan>[
      TextSpan(
          text: 'world',
          style: TextStyle(
            decoration: TextDecoration.underline,
          )),
      // can add more TextSpans here...
    ],
  ),
)

    
  // other underlining themes ---
  decorationStyle: TextDecorationStyle.dashed/ TextDecorationStyle.dotted / TextDecorationStyle.double / TextDecorationStyle.wavy




//To add space between underline FOR APPS WITH LIGHT & DARK THEME BOTH  (create a dummy shadow and make the original text transparent)
    final Brightness brightnessValue = MediaQuery.of(context).platformBrightness; //to check 
    bool isDark = brightnessValue == Brightness.dark;

Text(' Select the theme of app ',style: TextStyle(
                shadows: [ isDark?
                Shadow(
                    color: Colors.white,
                    offset: Offset(0, -5)):
                Shadow(
                    color: Colors.black,
                    offset: Offset(0, -5))
              ],
                color: Colors.transparent,
                decoration:TextDecoration.underline,
                decorationColor: isDark?Colors.white:Colors.black,
                fontSize: 16,letterSpacing: 2,
                fontWeight: FontWeight.bold),
    ),
