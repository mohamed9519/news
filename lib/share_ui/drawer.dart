
import 'package:flutter/material.dart';
import 'package:news_app/model/nav_menu.dart';
import 'package:news_app/screens/facebook_feed.dart';
import 'package:news_app/screens/headline_news.dart';
import 'package:news_app/screens/home_screen.dart';
import 'package:news_app/screens/instegram_feed.dart';
import 'package:news_app/screens/twitter_feed.dart';

class NavigationDrwaer extends StatefulWidget {
  @override
  _NavigationDrwaerState createState() => _NavigationDrwaerState();
}

class _NavigationDrwaerState extends State<NavigationDrwaer> {
  List<NavMenu> navMenu= [
    NavMenu("Explore", () => HomeScreen() ),
    NavMenu("Headline News", () => HeadlineNews() ),
    NavMenu("Twitter Feed", () => TwitterFeed() ),
    NavMenu("Instagram Feed", () => InstegramFeed() ),
    NavMenu("FaceBook Feed", () => FaceBookFeed() ),
  ];
  List<String> drawerString =["Explore","Headline News", "Read Later", "Videos", "Photo", "Settings","Logout"];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: ListView.builder(itemBuilder: (context, position){
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(navMenu[position].title, style: TextStyle(color: Colors.grey.shade800, fontSize: 20,
                  fontWeight: FontWeight.w600),),
              trailing: Icon(Icons.chevron_right, color: Colors.grey,),
              onTap: (){
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context){
                 return navMenu[position].destination();
                }));
              },
            ),
          );
        } ,
          itemCount:navMenu.length ,
        ),
      ),
    );
  }
}
