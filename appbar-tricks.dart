//Removing extra padding around appbar leading icon -  

appBar: AppBar(
        leading: Icon(Icons.android),
        titleSpacing: 0, //Just add a property called titleSpacing,
        title: Text(widget.title),
      ),
