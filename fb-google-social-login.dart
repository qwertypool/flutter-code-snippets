


// A demo social login UI (have to include the svg files in the assets...)
Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      SocalIcon(
        iconSrc: "assets/icons/facebook.svg",
        press: () {},
      ),
      SocalIcon(
        iconSrc: "assets/icons/twitter.svg",
        press: () {},
      ),
      SocalIcon(
        iconSrc: "assets/icons/google-plus.svg",
        press: () {},
      ),
    ],
  )



class SocalIcon extends StatelessWidget {
  final String iconSrc;
  final Function press;
  const SocalIcon({
    Key? key,
    required this.iconSrc,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: pPrimaryColor,
          ),
          shape: BoxShape.circle,
        ),
        child: SvgPicture.asset(
          iconSrc,
          color: Theme.of(context).textTheme.bodyText1!.color,
          height: 25,
          width: 25,
        ),
      ),
    );
  }
}
