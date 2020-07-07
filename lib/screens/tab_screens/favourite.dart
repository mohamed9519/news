import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Favourite extends StatefulWidget {
  @override
  _FavouriteState createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  List<Color> colorsList = [
    Colors.red,
    Colors.deepOrange,
    Colors.amberAccent,
    Colors.indigo
  ];

  Random random = Random();
  Color _getColorRandom() {
    return colorsList[random.nextInt(colorsList.length)];
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, position) {
        return Card(
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              children: <Widget>[
                _authorRow(),
                SizedBox(height: 8,),
                _contentRow(),
              ],
            ),
          ),
        );
      },
      itemCount: 20,
    );
  }

  Widget _authorRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: ExactAssetImage("images/harry.png"),
                    fit: BoxFit.cover),
                shape: BoxShape.circle,
              ),
              width: 50,
              height: 50,
              margin: EdgeInsets.only(right: 16),
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Mohamed Younis",
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(height: 8),
                Row(
                  children: <Widget>[
                    Text(
                      "15 Min .",
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      "Life Style",
                      style: TextStyle(color: _getColorRandom()),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
        IconButton(
          icon: Icon(Icons.bookmark_border),
          onPressed: () {},
          color: Colors.grey,
        ),
      ],
    );
  }

  Widget _contentRow() {
    return Row(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: ExactAssetImage("images/harry.png"),fit: BoxFit.cover),
          ),
          width: 124,
          height: 124,
        ),
        SizedBox(width: 14),
        Expanded(child:Column(
          children: <Widget>[
            Text("Mohamed younis Amin Younis Ebaid", style: TextStyle(fontSize: 18,
                fontWeight: FontWeight.w600),),
            SizedBox(height: 8),
            Text("19 Decmber 1995 , Ahlawy , computer seince , barcelona, arsenal , pep , jose ,  ",
              style:TextStyle(color: Colors.grey, fontWeight: FontWeight.w400,
                  fontSize: 14,height: 1.25),)
          ],
        ), ),

      ],
    );
  }
}
