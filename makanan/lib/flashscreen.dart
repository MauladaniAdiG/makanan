import 'dart:async';
import 'package:flutter/material.dart';
import 'package:makanan/loginscreen.dart';

class FlashScreen extends StatefulWidget {
  @override
  _FlashScreenState createState() => _FlashScreenState();
}

class _FlashScreenState extends State<FlashScreen> {
  @override
  void initState() {
    super.initState();
    _timer();
  }

  _timer() {
    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.network(
            'https://seeklogo.com/images/C/cake-food-logo-9A487CF7AA-seeklogo.com.png',
            width: 100,
          ),
          Container(
            child: Text(
              'Makann',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                  color: Color(0xFFff007f)),
            ),
          ),
        ],
      ),
    ));
  }
}
