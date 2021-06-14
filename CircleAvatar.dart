// Text Inside Circle Avatar ---- 
 body: Center(
          child: CircleAvatar(
            backgroundColor: Colors.pink[400],
            radius: 100,
            child: Text(
              'Deepa Pandey',
              style: TextStyle(fontSize: 25, color: Colors.white),
            ), //Text
          ), //CirlceAvatar
        ), 

foregroundColor: Colors.white, // Or use foregroundColor for the default text color for text in the circle.


 -----------------------------------------------------------------------------------------------------------------------
   
 // Code snippet for image inside the CircleAvatar
       ...     
          body: Center(
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                "https://abc.com//xyz.png"),
            radius: 100,
          ), //CircleAvatar
          ...
            
            
 -----------------------------------------------------------------------------------------------------------------------
// To add a colored border in the Circle Avatar : 
                    CircleAvatar(
                      radius: 21,
                      backgroundColor: Colors.pink,
                        child: CircleAvatar(
                        backgroundColor: Colors.amber,
                        child: Text(
                          active[index].name[0],  // A model data
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                          
   -----------------------------------------------------------------------------------------------------------------------                        
                        
                          
  // To add a border and image/text with some space in between the circleAvatar --
                          
          Center(
          child: CircleAvatar(
            backgroundColor: Colors.pink,
            radius: 115,
            child: CircleAvatar(
              backgroundColor: Colors.grey[100],
              radius: 110,
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://xyz.jpg"), //NetworkImage
                radius: 100,
              ), //CircleAvatar
            ), //CircleAvatar
          ), //CircleAvatar
        ), 
