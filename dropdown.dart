  List<String> _items = [
    'Accounts',
    'Management',
    'Tech',
    'Product',
    'Design',
    'Operations'
  ];
  Widget drop() {
    return DropdownButtonHideUnderline(
      child: new DropdownButton(
        isExpanded: true,
        hint: Text('Department'),
       value: value,
        style: TextStyle(fontSize: 18, color: Colors.black),
        items: _items.map((value) {
          return new DropdownMenuItem(
            value: value,
            child: new Text(value),
          );
        }).toList(),
        onChanged: (newValue) {
          setState(() {
            value = newValue;
          });
          print(value);
        },
      ),
    );
  }
