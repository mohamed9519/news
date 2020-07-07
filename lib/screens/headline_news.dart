import 'package:flutter/material.dart';
import 'package:news_app/screens/tab_screens/favourite.dart';
import 'package:news_app/screens/tab_screens/popular.dart';
import 'package:news_app/share_ui/drawer.dart';
class HeadlineNews extends StatefulWidget {
  @override
  _HeadlineNewsState createState() => _HeadlineNewsState();
}

class _HeadlineNewsState extends State<HeadlineNews> with SingleTickerProviderStateMixin {

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
        title: Text("Headline News"),
        centerTitle: false,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: (){}),
          IconButton(icon: Icon(Icons.more_vert), onPressed: (){}),

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
          Favourite(),
          Popular(),
          Favourite(),
        ],controller: _tabController,),
      ),
    )
    ;
  }
}
