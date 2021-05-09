

Color generateRandomColor() {
    Random random = Random();
    return Color.fromARGB(
        255, random.nextInt(256), random.nextInt(256), random.nextInt(256));
  }


//Sample usage ----
                    ListView.builder(
                    itemCount: active.length,
                    itemBuilder: (BuildContext context, int index) {
                     return CircleAvatar(
                      radius: 25,
                      backgroundColor: generateRandomColor(),
                      child: Text(active[index].name[0],style:TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),),
                                      ),
                               }
                           )
