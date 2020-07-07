import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/Api/post_api.dart';
import 'dart:async';

import 'package:news_app/model/psot.dart';
import 'package:news_app/screens/single_post.dart';
import 'package:news_app/utilities/data_util.dart';


class WhatNew extends StatefulWidget {
  @override
  _WhatNewState createState() => _WhatNewState();
}

class _WhatNewState extends State<WhatNew> {
  ApiPost apiPost = ApiPost();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _drawHeader(),
        _drawStories(),
        _drawRecentUpdate(),
      ],
    ));
  }

  Widget _drawHeader() {
    TextStyle _titleheader = TextStyle(
      color: Colors.white,
      fontSize: 22,
      fontWeight: FontWeight.bold,
    );
    TextStyle _contentheader = TextStyle(
        color: Colors.white, fontSize: 18, fontWeight: FontWeight.w400);

    return FutureBuilder(
      future: apiPost.fetchCategoryByID("1"),
      builder: (context , AsyncSnapshot snapshot){
        switch(snapshot.connectionState){
          case ConnectionState.none:
            return ConnectionErroe();
            break;
          case ConnectionState.waiting:
            return loading();
            break;
          case ConnectionState.active:
            return loading();
            break;
          case ConnectionState.done:
            if(snapshot.error!=null){
              return ErrorData(snapshot.error);
            }else{
              if(snapshot.hasData){
                List<Post> posts= snapshot.data;
                Random random= Random();
                int randomIndex= random.nextInt(posts.length);
                Post post = posts[randomIndex];
                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder:(context){
                      return SinglePost(post);
                    } ) );
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * .25,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(post.featuredImage), fit: BoxFit.cover),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(right: 36, left: 36),
                          child: Text(
                            post.title,
                            style: _titleheader,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 36, left: 36),
                          child: Text(
                            post.content.substring(0 , 100),
                            style: _contentheader,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                );

              }else{
                return noData();
              }
            }
            break;

        }
      },

    );
  }

  Widget _drawStories() {
    return Container(
      color: Colors.grey.shade100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _topStories("Top Stories"),
          _drawCard(),
        ],
      ),
    );
  }

  Widget _drawRecentUpdate() {
    return Padding(
      padding: EdgeInsets.all(8),
      child: FutureBuilder(
        future: apiPost.fetchCategoryByID("1"),
        builder: ( context, AsyncSnapshot snapShot ){
          switch ( snapShot.connectionState ){
            case ConnectionState.none :
              return ConnectionErroe();
              break;
            case ConnectionState.active :
              return loading();
              break;
            case ConnectionState.waiting :
              return loading();
              break;
            case ConnectionState.done :
              if( snapShot.hasError ){
                return ErrorData(snapShot.error);
              }else{
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 16, bottom: 8, top: 8),
                      child: _topStories("Recent Updates"),
                    ),
                    _RecentUpdatesCard(Colors.deepOrange , snapShot.data[0]),
                    _RecentUpdatesCard(Colors.teal , snapShot.data[1]),
                    SizedBox(
                      height: 48,
                    ),
                  ],
                );
              }
              break;

          }
        },
      )
    );

  }

  Widget _drawCard() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: FutureBuilder(
          future: apiPost.fetchCategoryByID("2"),
          builder: (context, AsyncSnapshot snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return loading();
                break;
              case ConnectionState.active:
                return loading();
                break;
              case ConnectionState.none:
                return ConnectionErroe();
                break;
              case ConnectionState.done:
                if (snapshot.error != null) {
                  return ErrorData(snapshot.error);

                } else {
                  if (snapshot.hasData) {
                    List<Post> posts = snapshot.data;
                    if (posts.length >= 3) {
                      Post post1 = snapshot.data[0];
                      Post post2 = snapshot.data[1];
                      Post post3 = snapshot.data[2];
                      return Column(
                        children: <Widget>[
                          _drawCardView(post1),
                          _drawDivider(),
                          _drawCardView(post2),
                          _drawDivider(),
                          _drawCardView(post3),
                          _drawDivider(),
                        ],
                      );
                    }
                  } else {
                    return noData();
                  }
                }
                break;
            }
          },
        ),
      ),
    );
  }

  Widget _drawCardView(Post post) {
    return GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder:(context){
            return SinglePost(post);
          } ) );
        },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            SizedBox(
              child: Image.network(
                post.featuredImage,
                fit: BoxFit.cover,
              ),
              width: 124,
              height: 124,
            ),
            SizedBox(width: 18),
            Expanded(
              child: Column(
                children: <Widget>[
                  Text(
                    post.title,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                    maxLines: 2,
                  ),
                  SizedBox(height: 40.0),
                  Row(
                    children: <Widget>[
                      Text("Micheal Adams"),
                      SizedBox(width: 15.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Icon(Icons.timer),
                          Text(ConvertTimeToHumanTimr(post.dateWritten))
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  

  Widget _drawDivider() {
    return Container(
      height: 1,
      width: double.infinity,
      color: Colors.grey.shade100,
    );
  }

  Widget _topStories(String s) {
    return Padding(
      padding: const EdgeInsets.only(left: 18, top: 18),
      child: Text(
        s,
        style: TextStyle(fontSize: 16, color: Colors.black),
      ),
    );
  }

  Widget _RecentUpdatesCard(Color color , Post post) {
    return Card(
      child:GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder:(context){
            return SinglePost(post);
          } ) );
        },

        child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(post.featuredImage),
                        fit: BoxFit.cover),
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * .25,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16, left: 16),
                  child: Container(
                    padding: EdgeInsets.only(left: 24, right: 24, top: 2, bottom: 2),
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      "Sports",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8, bottom: 8, right: 16, left: 16),
                  child: Text(
                    post.title,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8, bottom: 8, right: 16, left: 16),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.timer,
                        color: Colors.grey,
                      ),
                      SizedBox(width: 4),
                      Text(
                        ConvertTimeToHumanTimr(post.dateWritten),
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  ),
                )
              ],
            ),
      ),
    );

  }
}


