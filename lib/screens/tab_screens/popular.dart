import 'package:flutter/material.dart';
import 'package:news_app/Api/post_api.dart';
import 'package:news_app/model/psot.dart';
import 'package:news_app/screens/single_post.dart';
import 'package:news_app/utilities/data_util.dart';

class Popular extends StatefulWidget {
  @override
  _PopularState createState() => _PopularState();
}

class _PopularState extends State<Popular> {
  ApiPost apiPost = ApiPost();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: apiPost.fetchCategoryByID("3"),
      builder: (context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
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
            if (snapshot.error != null) {
              return ErrorData(snapshot.error);
            } else {
              if (snapshot.hasData) {
                List<Post> posts = snapshot.data;
                return ListView.builder(
                  itemBuilder: (context, position) {
                    return Card(
                      child: _drawCardView(posts[position]),
                    );
                  },
                  itemCount: posts.length,
                );
              } else {
                return noData();
              }
            }
            break;
        }
      },
    );
  }

  Widget _drawCardView(Post post) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap:(){ Navigator.push(context, MaterialPageRoute(builder: (context){
          return SinglePost(post);
        }) );},
        child: Row(
          children: <Widget>[
            SizedBox(
              child: Image(
                image: NetworkImage(post.featuredImage),
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
                      SizedBox(width: 25.0),
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
}
