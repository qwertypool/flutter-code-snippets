// Rich Text is used when we want to edit some parts of the text and not to others
            
RichText(
            text: TextSpan(
            text:
            'Follow flutter_girlz❤️\n TCS\'er 😜 🤪 🤨\nFlutter Developer💛 ',
            style: TextStyle(
            color: Theme.of(context).textTheme.bodyText1.color),
            children: <TextSpan>[
            TextSpan(
            text: '...more\n',
            style: TextStyle(
            color: Colors.grey[500],
            ),
            ),
            TextSpan(
            text: 'deepapandey.herokuapp.com/',
            style: TextStyle(color: Colors.blue[400])),
           ],
          ),
        ),
