import 'package:flutter/material.dart';
import 'package:news_app/Api/api_author.dart';
import 'package:news_app/Api/api_category.dart';
import 'package:news_app/Api/post_api.dart';
import 'package:news_app/pages/about.dart';
import 'package:news_app/pages/help.dart';
import 'package:news_app/pages/settings.dart';
import 'package:news_app/screens/tab_screens/favourite.dart';
import 'package:news_app/screens/tab_screens/popular.dart';
import 'package:news_app/screens/tab_screens/what_new.dart';
import 'package:news_app/share_ui/drawer.dart';
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}
enum PopOutMenu { HELP, ABOUT, CONTACT, SETTINGS }

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  TabController _tabController;



  @override
  void initState() {

    super.initState();
    _tabController=TabController(initialIndex: 0, length: 3, vsync: this);
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Explore"),
        centerTitle: false,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: (){}),
          _popOutMenu(context),

        ],
        bottom: TabBar(
          indicatorColor: Colors.white,
          tabs: [
          Tab(text: "WHAT NEW"


          ),
          Tab(text: "POPULAR",),
          Tab(text: "FAVOURITES",),
        ],
          controller: _tabController,
        ),

      ),
      drawer: NavigationDrwaer(),
      body: Center(
        child: TabBarView(children: [
          WhatNew(),
          Popular(),
          Favourite(),
        ],controller: _tabController,),
      ),
    );
  }
  Widget _popOutMenu(BuildContext context) {
    return PopupMenuButton<PopOutMenu>(
      itemBuilder: (context) {
        return [
          PopupMenuItem<PopOutMenu>(
            value: PopOutMenu.ABOUT,
            child: Text('ABOUT'),
          ),
          PopupMenuItem<PopOutMenu>(
            value: PopOutMenu.CONTACT,
            child: Text('CONTACT'),
          ),
          PopupMenuItem<PopOutMenu>(
            value: PopOutMenu.HELP,
            child: Text('HELP'),
          ),
          PopupMenuItem<PopOutMenu>(
            value: PopOutMenu.SETTINGS,
            child: Text('SETTINGS'),
          ),
        ];
      },
      onSelected: (PopOutMenu menu) {
        switch( menu ){
          case PopOutMenu.ABOUT :
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return AboutUs();
            }));
            break;
          case PopOutMenu.SETTINGS:
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return Settings();
            }));
            break;
          /*case PopOutMenu.CONTACT :
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return ContactUs();
            }));
            break; */
          case PopOutMenu.HELP :
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return Help();
            }));
            break;
        }
      },
      icon: Icon(Icons.more_vert),
    );
  }
}
