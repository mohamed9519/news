import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

Widget loading() {
  return Container(
    child: Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 16, bottom: 16),
        child: CircularProgressIndicator(),
      ),
    ),
  );
}

Widget ConnectionErroe() {
  return Container(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text("Connection Error!"),
    ),
  );
}

Widget ErrorData(var error) {
  return Container(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text("Error Data"),
    ),
  );
}

Widget noData() {
  return Container(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text("No Data"),
    ),
  );
}
String ConvertTimeToHumanTimr(String dateime) {
  Duration timeAgo = DateTime.now().difference(DateTime.parse(dateime));
  DateTime theDifference = DateTime.now().subtract(timeAgo);
  return timeago.format(theDifference);
}
