import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/share_ui/drawer.dart';

class TwitterFeed extends StatefulWidget {
  @override
  _TwitterFeedState createState() => _TwitterFeedState();
}

class _TwitterFeedState extends State<TwitterFeed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Twitter Feed"),
        centerTitle: false,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
        ],
      ),
      drawer: NavigationDrwaer(),
      body: ListView.builder(
        padding: EdgeInsets.all(8),
        itemBuilder: (context, position) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Card(
              child: Column(
                children: <Widget>[
                  _drawCardHeader(),
                  _drawCardBody(),
                  _drawDivide(),
                  _drawCardFooter(),

                ],
              ),
            ),
          );
        },
        itemCount: 20,
      ),
    );
  }

  Widget _drawCardHeader() {
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: CircleAvatar(
            backgroundColor: Colors.deepOrange,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Text("Mohamed Younis"),
                SizedBox(width: 8),
                Text(
                  "@gmail.com",
                  style: TextStyle(color: Colors.grey),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16, top: 8),
              child: Text("Sun 28 Jun 2020 . 4:15"),
            ),
          ],
        )
      ],
    );
  }

  Widget _drawCardBody() {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
      child: Container(
        child: Text(
          "19 Decmber 1995 , Ahlawy , computer seince , barcelona, arsenal , pep , jose",
          style:
              TextStyle(color: Colors.grey.shade500, fontSize: 18, height: 1.2),
        ),
      ),
    );
  }

  Widget _drawCardFooter() {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            Row(
              children: <Widget>[
                IconButton(
                    icon: Icon(
                      Icons.repeat,
                      color: Colors.deepOrange,
                    ),
                    onPressed: () {}),
                Text("25"),
                SizedBox(width: 130),
                Row(
                  children: <Widget>[
                    FlatButton(
                        onPressed: () {},
                        child: Text(
                          "Share",
                          style: TextStyle(color: Colors.deepOrange),
                        )),
                    FlatButton(
                        onPressed: () {},
                        child: Text(
                          "Play",
                          style: TextStyle(color: Colors.deepOrange),
                        )),
                  ],
                )
              ],
            ),
          ],
        ));
  }
  Widget _drawDivide(){
    return Container(
      color: Colors.grey.shade200,
      height: 3,
      margin: EdgeInsets.only(top: 16),
    );
  }
}
