GestureDetector(
    onTap: () {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => Profile()));
    },
    child: CircleAvatar(
        backgroundImage: AssetImage('assets/deepa.jpg'))
),
