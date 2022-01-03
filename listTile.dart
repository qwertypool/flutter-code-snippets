

          Expanded(
          child: ListView(
            children: <Widget>[
              Card(
                elevation: 0,
                child: ListTile(
                  leading: Icon(Icons.person,color: pPrimaryColor,),
                  title: Text('Name'),
                  subtitle: Text(
                      'Deepa Pandey '
                  ),
                  trailing: Icon(Icons.edit),
                ),
               ),
               Divider(
                     color: Colors.grey[300],
                      thickness: 1,
                      indent: 65,
                      endIndent: 5,
                    ),
              Card(
                elevation: 0,
                child: ListTile(
                  leading: Icon(Icons.person,color: pPrimaryColor,),
                  title: Text('About'),
                  subtitle: Text(
                      'habituated🤕wid coding👨‍💻 & covid🦠 '
                  ),
                  trailing: Icon(Icons.edit),
                  isThreeLine: true,
                ),
               ),
               Divider(
                     color: Colors.grey[300],
                      thickness: 1,
                      indent: 65,
                      endIndent: 5,
                    ),
              Card(
                elevation: 0,
                child: ListTile(
                  leading: Icon(Icons.phone,color: pPrimaryColor,),
                  title: Text('Phone'),
                  subtitle: Text(
                      '+91 12345 67890 '
                  ),
                  trailing: Icon(Icons.edit),
                  //isThreeLine: true,
                ),
               ),
              ],
             ),
           )
