Card(
  color: Colors.grey[900], 
  shape: RoundedRectangleBorder(
    side: BorderSide(color: Colors.white70, width: 1),
    borderRadius: BorderRadius.circular(10),  
  ),
  margin: EdgeInsets.all(20.0),
  child: Container(
    child: Column(
        children: <Widget>[
        ListTile(
            title: Text(
            'example',
            style: TextStyle(fontSize: 18, color: Colors.white),
            ),
        ),
        ],
    ),
  ),
),


////////////////More Card Shape//////////////

Card(
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(15.0),
  ),
  child: Text(
    'Card with circular border',
    textScaleFactor: 1.2,
  ),
),
Card(
  shape: BeveledRectangleBorder(
    borderRadius: BorderRadius.circular(10.0),
  ),
  child: Text(
    'Card with Beveled border',
    textScaleFactor: 1.2,
  ),
),
Card(
  shape: StadiumBorder(
  side: BorderSide(
    color: Colors.black,
    width: 2.0,
  ),
),
  child: Text(
    'Card with Beveled border',
    textScaleFactor: 1.2,
  ),
),
