import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/share_ui/drawer.dart';
class InstegramFeed extends StatefulWidget {
  @override
  _InstegramFeedState createState() => _InstegramFeedState();
}

class _InstegramFeedState extends State<InstegramFeed> {
  List<int> ids=[];
  TextStyle _hashStyle = TextStyle(color: Colors.deepOrange);
  @override
  void initState() {
    super.initState();
    ids=[0,2,4];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Instagram Feed"),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                   _drawCardHeader(position),
                  _drawTitle(),
                   _drawHash(),
                  _drawCardBody(),
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

  Widget _drawCardHeader(int postion) {
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
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16, top: 8),
              child: Text("Sun 28 Jun 2020 . 4:15"),
            ),
          ],
        ),
        SizedBox(width: 50),
        IconButton(icon:  Icon(Icons.favorite, color:(ids.contains(postion))?Colors.red: Colors.grey,), onPressed: (){
          setState(() {
            if(ids.contains(postion)){
              ids.remove(postion);
            }else{
              ids.add(postion);
            }
          });
        } ),
        Text("25",style: TextStyle(color: Colors.grey,fontSize: 16),),
      ],
    );
  }

  Widget _drawTitle() {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
      child: Text(
        "Mohamed Younis Amin Younis",
        style:
        TextStyle(color: Colors.grey.shade900, fontSize: 18, height: 1.2),
      ),
    );
  }

  Widget _drawHash() {
    return Container(
      child: Wrap(
        children: <Widget>[
          FlatButton(onPressed: (){} , child: Text("#kosomk", style: _hashStyle) ),
          FlatButton(onPressed: (){} , child: Text("#kosomk", style: _hashStyle) ),
          FlatButton(onPressed: (){} , child: Text("#kosomk", style: _hashStyle) ),
        ],
      ),
    );
  }

  Widget _drawCardBody() {
    return
      SizedBox(
        width: double.infinity,
          height: MediaQuery.of(context).size.height*.25,
          child: Image(image: ExactAssetImage("images/harry.png"),fit: BoxFit.cover, )) ;
  }

  Widget _drawCardFooter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        FlatButton(onPressed: (){} , child: Text("10 Comments", style: _hashStyle,) ),
        Row(
          children: <Widget>[
            FlatButton(onPressed: (){} , child: Text("Share", style: _hashStyle,) ),
            FlatButton(onPressed: (){} , child: Text("Like", style: _hashStyle,) ),
          ],
        )
      ],
    ) ;
  }
}
