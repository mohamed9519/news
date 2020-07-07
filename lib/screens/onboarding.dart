import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/screens/home_screen.dart';
import '../page_model.dart';
import 'package:page_view_indicator/page_view_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';


class OnBoarding extends StatefulWidget {
  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  int _currentIndex = 0;
  ValueNotifier<int> _valueNotifier = ValueNotifier(0);
  //List<String> images = ["images/bg.png","images/bg2.png","images/bg3.png","images/bg4.png"];
  //List<IconData> icons =[Icons.ac_unit,Icons.access_alarms,Icons.add_location,Icons.face];
  List<PageModel> pages;
  void _pageview() {
    pages = List<PageModel>();
    pages.add(PageModel(
        "Welcome",
        "1-Making friends is easy as waving your hands and forth is easy",
        "images/bg.png",
        Icons.add_location));
    pages.add(PageModel(
        "OUR APP",
        "2-Making friends is easy as waving your hands and forth is easy",
        "images/bg2.png",
        Icons.add_location));
    pages.add(PageModel(
        "FUNNY",
        "3-Making friends is easy as waving your hands and forth is easy",
        "images/bg3.png",
        Icons.add_location));
    pages.add(PageModel(
        "THANKS",
        "4-Making friends is easy as waving your hands and forth is easy",
        "images/bg4.png",
        Icons.add_location));
  }

  @override
  Widget build(BuildContext context) {
    _pageview();
    return Stack(
      children: <Widget>[
        Scaffold(
          body: PageView.builder(
            itemBuilder: (context, index) {
              return Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: ExactAssetImage(pages[index].image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Transform.translate(
                          child: Icon(
                            pages[index].icon,
                            size: 100,
                            color: Colors.white,
                          ),
                          offset: Offset(0, -100),
                        ),
                        Text(
                          pages[index].title,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              right: 48, left: 48, top: 15),
                          child: Text(
                            pages[index].description,
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
            itemCount: pages.length,
            onPageChanged: (index) {
              _valueNotifier.value = (index);
            },
          ),
        ),
        Transform.translate(
          child: _PageIndictor(),
          offset: Offset(0, 500),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 15, left: 15, right: 15),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: RaisedButton(
                color: Colors.red.shade800,
                child: Text(
                  "Get Started",
                  style: TextStyle(
                      color: Colors.white, fontSize: 15, letterSpacing: 1.0),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    _updateView();
                    return HomeScreen();
                  }));
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _PageIndictor() {
    return PageViewIndicator(
      pageIndexNotifier: _valueNotifier,
      length: pages.length,
      normalBuilder: (animationController, index) => Circle(
        size: 8.0,
        color: Colors.grey,
      ),
      highlightedBuilder: (animationController, index) => ScaleTransition(
        scale: CurvedAnimation(
          parent: animationController,
          curve: Curves.ease,
        ),
        child: Circle(
          size: 12.0,
          color: Colors.red,
        ),
      ),
    );
  }

  void _updateView() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
     prefs.setBool('seen', true);


  }
}
