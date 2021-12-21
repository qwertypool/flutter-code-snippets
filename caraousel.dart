// Firstly Import carousel slider

class ImageSliderDemo extends StatefulWidget {
  @override
  _ImageSliderDemoState createState() => _ImageSliderDemoState();
}
 int _current = 0;
 final CarouselController _controller = CarouselController();
class _ImageSliderDemoState extends State<ImageSliderDemo> {
  final List<String> imgList = [
    
  ];
  

  @override
  Widget build(BuildContext context) {
   
    return Column(
      children: [
        Container(
            child: CarouselSlider(
          options: CarouselOptions(
            enlargeCenterPage: true,
            enableInfiniteScroll: true,
            onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  }
          ),
          items: imgList
              .map((item) => Container(
                    child: Center(
                        child: Stack(
                          children: [
                            Container(
                              width: 1200,
                              decoration:BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                image: DecorationImage(
                                  image: NetworkImage(item),
                                  fit: BoxFit.cover,)),
                                  ),
                              //: Image.network(item, fit: BoxFit.cover, width: 1200)),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Padding(
                                padding: const EdgeInsets.only(right: 10,bottom: 6),
                                child: ClipRect(

                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                                    child: Container(
                                      width: 120,
                                      height: 30,
                                      decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.grey.withOpacity(0.5),
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text('Shop Now',style: TextStyle(color: Colors.white,fontFamily: 'Ubuntu',letterSpacing: 2,fontWeight: FontWeight.w600),),
                                        Icon(Icons.arrow_forward_ios,color: Colors.white,size: 15,),
                                      ],
                                    ),
                                    ),
                                    
                                  ),
                                ),
                              ),
                            )
                          ],
                        )),
                  ))
              .toList(),
        )),
              Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: imgList.asMap().entries.map((entry) {
          return GestureDetector(
            onTap: () => _controller.animateToPage(entry.key),
            child: Container(
              width: 6.0,
              height: 6.0,
              margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: (Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black)
                      .withOpacity(_current == entry.key ? 0.9 : 0.4)),
            ),
          );
        }).toList(),
      ),
      ],

    );
  }
}
