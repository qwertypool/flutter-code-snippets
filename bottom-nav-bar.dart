//A demo to implement bottomnavigationbar in flutter

class _ChatPageState extends State<ChatPage> {
  int _selectedIndex = 0;
  final List<Widget> _children = [Chats(),Calls(), People()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_selectedIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: pPrimaryColor,
        child: Icon(
          Icons.person_add_alt_1_rounded,
          color: Colors.white,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.messenger), label: "Chats"),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: "People"),
          BottomNavigationBarItem(icon: Icon(Icons.call), label: "Calls"),
        ],
      ),
    );
  }
}


-----------------------------/\/\/\/\/\/\\/\/\/\/\/\/\/\\/\/\/\/\/\/\----------------------------------------------------------
  
  //Bottom navbar with circle avartar + change of icons when moved from one page to another
  
  Scaffold(
      body: _children[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedIconTheme: IconThemeData(color: pPrimaryColor),
        currentIndex: _selectedIndex,
        backgroundColor: !isDark?Colors.white:Colors.black,
        selectedItemColor: isDark?Colors.grey:Colors.black,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0,
        onTap: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: _selectedIndex==0?Icon(Icons.home,color: Colors.black,size: 28,): Icon(Icons.home_outlined,color: Colors.black,size: 28,),label: 'home'),
          BottomNavigationBarItem(icon:  _selectedIndex==1?Icon(Icons.search,color: Colors.black,size: 28,): Icon(Icons.search_outlined,color: Colors.black,size: 28,),label: 'search'),
          BottomNavigationBarItem(icon:  _selectedIndex==2?Icon(Icons.video_collection_sharp,color: Colors.black,size: 28,): Icon(Icons.video_collection_outlined,color: Colors.black,size: 28,),label: 'reels' ),
          BottomNavigationBarItem(icon: _selectedIndex==3?Icon(Icons.favorite,color: Colors.black,size: 28,):Icon(Icons.favorite_border_outlined,color: Colors.black,size: 28,),label: 'notif'),
          BottomNavigationBarItem(icon: _selectedIndex==4?
           CircleAvatar(
             radius: 14,
             backgroundColor: Colors.black,
              child: CircleAvatar(
               radius: 13,
               backgroundImage:AssetImage('assets/profilepic.jpg') ,),
           ):
              CircleAvatar(
             radius: 14,
             backgroundImage:AssetImage('assets/profilepic.jpg') ,),
             label: 'profile'
           ),
        
        ],
        
      ),
     );
  
  
  
