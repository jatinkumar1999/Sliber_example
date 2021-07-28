import 'package:flutter/material.dart';
import 'package:slider_example/modal/data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Datael> slides = [];
  int currentIndex = 0, i;
  PageController pageController = PageController(initialPage: 0);

  @override
  void initState() {
    slides = getSlides();
    super.initState();
  }

  Widget pageselected(bool currentPageSelected) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 6),
      width: currentPageSelected ? 10 : 6,
      height: currentPageSelected ? 10 : 6,
      decoration: BoxDecoration(
        color: currentPageSelected ? Colors.grey : Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(left: 10, right: 10, top: 200),
        child: PageView.builder(
            controller: pageController,
            onPageChanged: (value) {
              setState(() {
                currentIndex = value;
              });
            },
            itemCount: slides.length,
            itemBuilder: (context, index) {
              return SliderTile(
                imagePath: slides[index].img,
                title: slides[index].tittle,
                desc: slides[index].descp,
              );
            }),
      ),
      bottomSheet: currentIndex != slides.length - 1
          ? Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      pageController.animateToPage(slides.length - 1,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeIn);
                    },
                    child: Text("Skip"),
                  ),
                  Row(
                    children: [
                      for (i = 0; i < slides.length; i++)
                        currentIndex == i
                            ? pageselected(true)
                            : pageselected(false),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      pageController.animateToPage(currentIndex + 1,
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeIn);
                    },
                    child: Text("Next"),
                  ),
                ],
              ),
            )
          : Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              height: 50,
              color: Colors.grey[300],
              child: Text("Get Started Now"),
            ),
    );
  }
}

class SliderTile extends StatelessWidget {
  String imagePath, title, desc;
  SliderTile({this.imagePath, this.title, this.desc});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 20),
          Text(title),
          SizedBox(height: 17),
          Text(desc),
        ],
      ),
    );
  }
}
