
//Removing extra padding around appbar leading icon(use titlespacing) -  

appBar: AppBar(
        leading: Icon(Icons.android),
        titleSpacing: 0, //Just add a property called titleSpacing,
        title: Text(widget.title),
      ),

// To increse the leading width of appbar - 

appBar: AppBar(
  leading: Icon(Icons.account_circle_rounded),
  leadingWidth: 100, // default is 56
),

//To increase the default height & alter opacity of appbar - 

appBar: AppBar(
  toolbarHeight: 120,
  toolbarOpacity: 0.5,
  leadingWidth: 100, // default is 56
),

// Image in title in appbar - 

AppBar(
  title: Container(
    width: 40,
    child: Image.network(url),
  ),
  centerTitle: true, 
),

