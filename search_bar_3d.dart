  Center searchBox(Size size) {
    return Center(
          child: Card(
          elevation: 15,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          child: Container(
             width: size.width*0.85,
             height: 50,
            child: TextFormField(
              cursorHeight: 25,
            
              decoration: InputDecoration(
                labelText: "Search by book name",
                labelStyle: TextStyle(color: kTextColor.withOpacity(0.9)),
                border: InputBorder.none,
                floatingLabelBehavior: FloatingLabelBehavior.never,
                contentPadding: EdgeInsets.only(bottom: 20),
                prefixIcon:  IconButton(
                      icon: Icon(Icons.search),
                      color: Colors.grey,
                      onPressed: () {},
                    ),
                suffixIcon: IconButton(
                      icon: Icon(Icons.sort_sharp),
                      onPressed: () {},
                    ),
              ),
            )
          )
      ),
    );
  }
}
