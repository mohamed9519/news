import 'dart:math';

import 'package:flutter/material.dart';
import 'package:news_app/model/psot.dart';

class SinglePost extends StatefulWidget {
  Post post;

  SinglePost(this.post);

  @override
  _SinglePostState createState() => _SinglePostState();
}

class _SinglePostState extends State<SinglePost> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 300,
            floating: true,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(widget.post.featuredImage),
                        fit: BoxFit.cover)),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, position) {
              if (position == 0) {
                return _drawPostDetails();
              } else if (position >= 1 && position < 24) {
                return _Comments();
              } else {
                return _addComment();
              }
            }, childCount: 25),
          )
        ],
      ),
    );
  }



  Widget _drawPostDetails() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        child: Text(widget.post.content, style: TextStyle(fontSize: 16, letterSpacing: 1.1, height: 1.1),),
      ),
    );
  }

  Widget _Comments() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              CircleAvatar(backgroundColor: Colors.teal,),
              SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Mohamed Younis"),
                  Text("1 hour")
                ],
              ),
            ],
          ),
          SizedBox(height: 16),
          Text("Mohamed Younis Amin Younis Ebaid"),
        ],
      ),
    );
  }

  Widget _addComment() {
    /*return Container(
      color: Colors.grey,
      height: 200,
    );*/
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Row(
            children: <Widget>[
              Flexible(
                child: TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: 'Add Comment'),
                ),
              ),
              FlatButton(onPressed: () {}, child: Text("Send")),
            ],
          ),
        ),
        SizedBox(height: 25,),
      ],
    );

  }
}
