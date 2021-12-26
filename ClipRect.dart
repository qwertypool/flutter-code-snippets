

class ClipperExamples extends StatefulWidget {
  @override
  _ClipperExamplesState createState() => _ClipperExamplesState();
}

class _ClipperExamplesState extends State<ClipperExamples> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0XFF307777),
        title: Text("Clipper Example"),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /// ClipRect
              Container(
                margin: EdgeInsets.only(top: 40.0,),
                child: Text(
                  "ClipRect",
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
              ClipRect(
                child: Container(
                  child: Align(
                    alignment: Alignment.center,
                    widthFactor: 0.5,
                    heightFactor: 0.8,
                    child: Image.network(
                        'https://images.unsplash.com/photo-1595760780346-f972eb49709f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60'),
                  ),
                ),
              ),

              //ClipRRect
              Container(
                margin: EdgeInsets.only(top: 40.0,),
                child: Text(
                  "ClipRRect",
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(300.0),
                child: Image.network(
                    "https://images.unsplash.com/photo-1595152772835-219674b2a8a6?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"),
              ),

              /// ClipOval
              Container(
                margin: EdgeInsets.only(top: 40.0,),
                child: Text(
                  "ClipOval",
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
              ClipOval(
                child: Container(
                  child: Image.network(
                      'https://images.unsplash.com/photo-1544005313-94ddf0286df2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60'),
                ),
              ),

              /// ClipPath
              Container(
                margin: EdgeInsets.only(top: 40.0,),
                child: Text(
                  "ClipPath",
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
              ClipPath(
                clipper: TriangleClipper(),
                child: Image.network(
                    "https://images.unsplash.com/photo-1519699047748-de8e457a634e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(size.width / 2, 0.0);
    path.lineTo(size.width, size.height);
    path.lineTo(0.0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(TriangleClipper oldClipper) => false;
}


