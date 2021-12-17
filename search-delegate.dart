
//Implementing search functionality using search delegate in flutter.
class TextBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        cursorHeight: 20,
        decoration: InputDecoration(
          hintText: 'Search in mail',
          border: InputBorder.none,
        ),
        onTap: () {
          showSearch(context: context, delegate: Datasearch());
        },
      ),
    );
  }
}

class Datasearch extends SearchDelegate<String> {
  final names = [
    'deepa',
    'deepak',
    'sugarcosmetics',
    'balram',
    'linkedln',
    'banglore',
    'balram0698@gmail.com',
    'pandey.deepa@tcs.com',
    'sugarcosmetics@gmail.com',
    'pandeydeepak821@gmail.com',
    'balram.rathore@tcs.com',
  ];
  final recentSearches = [
    'pandey.deepa@tcs.com',
    'sugarcosmetics@gmail.com',
    'pandeydeepak821@gmail.com',
    'balram0698@gmail.com'
  ];
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      
      IconButton(
        icon: Icon(Icons.mic),
        onPressed: () {},
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    throw UnimplementedError();
  }

