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
      appBar: AppBar(),
      body: Container(
        color: Colors.grey,
        child: Text(widget.post.title),
      ),
    );
  }
}
