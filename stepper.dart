
// Post has been taken from Ranga Reddy- https://dev.to/irangareddy/custom-stepper-in-flutter-40o8

What is a Stepper?
A stepper is a two-buttons used to increase or decrease an incremental value.
By default, one button of a stepper displays a plus symbol, and the other displays a minus symbol.
These symbols can be replaced with custom images if desired.
  
class StepperScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      backgroundColor: kPrimaryColor,
      title: Text("Custom Stepper"),
      centerTitle: false,
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            height: 300,
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: [
                    BoxShadow(
                      color: kShadowColor,
                      offset: Offset(0, 20),
                      blurRadius: 30.0),
                  ]
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.04),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset('assets/images/fruit.png',fit: BoxFit.fitWidth,),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0,left: 8.0),
                child: Text('Juicy Strawberry',style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                ),),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0,left: 8.0),
                child: Row(
                  children: [
                   Text('\$20.40',style: TextStyle(
                     color: Colors.black,
                     fontSize: 15.0,
                     fontWeight: FontWeight.bold,
                   ),), 
                Spacer(),
                CustomStepper()
                  ],
                ),
              ),

            ],
        ),
          )),
      ),
    );
  }
}



class CustomStepper extends StatefulWidget {
  CustomStepper({
    @required this.lowerLimit,
    @required this.upperLimit,
    @required this.stepValue,
    @required this.iconSize,
    @required this.value,
  });

  final int lowerLimit;
  final int upperLimit;
  final int stepValue;
  final double iconSize;
  int value;

  @override
  _CustomStepperState createState() => _CustomStepperState();
}

class _CustomStepperState extends State<CustomStepper> {

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RoundedIconButton(
          icon: Icons.remove,
          iconSize: widget.iconSize,
          onPress: () {
            setState(() {
              widget.value =
                  widget.value == widget.lowerLimit ? widget.lowerLimit : widget.value -= widget.stepValue;
            });
          },
        ),
        Container(
          width: widget.iconSize,
          child: Text(
            '${widget.value}',
            style: TextStyle(
              fontSize: widget.iconSize * 0.8,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        RoundedIconButton(
          icon: Icons.add,
          iconSize: widget.iconSize,
          onPress: () {
            setState(() {
              widget.value =
                  widget.value == widget.upperLimit ? widget.upperLimit : widget.value += widget.stepValue;
            });
          },
        ),
      ],
    );
  }
}



class RoundedIconButton extends StatelessWidget {
  RoundedIconButton({@required this.icon, @required this.onPress, @required this.iconSize});

  final IconData icon;
  final Function onPress;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: BoxConstraints.tightFor(width: iconSize, height: iconSize),
      elevation: 6.0,
      onPressed: onPress,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(iconSize*0.2)),
      fillColor: Color(0xFF65A34A),
      child: Icon(
        icon,
        color: Colors.white,
        size: iconSize * 0.8,
      ),
    );
  }
}
