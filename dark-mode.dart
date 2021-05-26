final Brightness brightnessValue =
        MediaQuery.of(context).platformBrightness;
    bool isDark = brightnessValue == Brightness.dark;


//set the color to -
color: Theme.of(context).textTheme.bodyText1!.color


//checking if the system is in dark mode or light mode - 
Image.asset(
      MediaQuery.of(context).platformBrightness == Brightness.light
        ? "assets/lightmode2.png"
        :"assets/darkmode.png",
         height: 256,
          )

      
//Check system mode  -
       Widget build(BuildContext context) {
       final Brightness brightnessValue = MediaQuery.of(context).platformBrightness;
       bool isDark = brightnessValue == Brightness.dark;
       . . . . . 
       . . . . .
       . . . . .
       Text(
          'Choose your theme',
          style:  isDark == true ? TextStyle(
             color: Colors.black,
              fontSize: 16,
             letterSpacing: 4,
             fontWeight: FontWeight.w500
             ):
             TextStyle(
             color: Colors.white,
             fontSize: 16,
             letterSpacing: 4,
             fontWeight: FontWeight.w500
             ),
                ),
