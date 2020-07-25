import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _greeting() {
    var greeting = DateTime.now().hour;
    if (greeting < 12) {
      return 'Morning';
    } else if (greeting < 15) {
      return 'Afternoon';
    } else if (greeting < 17) {
      return 'Evening';
    } else {
      return 'Night';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        title: Row(
          children: <Widget>[
            Image.asset(
              'images/cakelogo.png',
              width: 40,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Home Screen',
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 30, left: 25),
              child: Text(
                'Good ${_greeting()}',
                style: TextStyle(fontSize: 18),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 5, left: 25),
              child: Text(
                'MD',
                style: TextStyle(fontSize: 18),
              ),
            )
          ],
        ),
      ),
    );
  }
}
