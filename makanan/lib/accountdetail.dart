import 'package:flutter/material.dart';
import 'package:makanan/homescreen.dart';

class AccountDetail extends StatefulWidget {
  @override
  _AccountDetailState createState() => _AccountDetailState();
}

class _AccountDetailState extends State<AccountDetail> {
  int currentPage = 1;
  @override
  Widget build(BuildContext context) {
    if (currentPage == 0) {
      return HomeScreen();
    } else {
      return bodyCustom();
    }
  }

  Widget bodyCustom() {
    return Scaffold(
      floatingActionButton: Container(
        height: 70,
        child: FittedBox(
          child: FloatingActionButton(
            splashColor: Colors.lightGreen,
            backgroundColor: Colors.red[300],
            onPressed: () {},
            child: Image.asset(
              'images/cakelogo.png',
              width: 40,
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            color: Colors.red[400],
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(15))),
        height: 50,
        child: customBar(),
      ),
      backgroundColor: Colors.white,
    );
  }

  Widget customBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
          child: InkWell(
            onTap: () {
              setState(() {
                currentPage = 0;
              });
            },
            child: Container(
              child: Icon(
                Icons.home,
                color: currentPage == 0 ? Colors.white54 : Colors.black,
              ),
            ),
          ),
        ),
        Expanded(child: Container()),
        Expanded(
            child: InkWell(
                onTap: () {
                  setState(() {
                    currentPage = 1;
                  });
                },
                child: Container(
                    child: Icon(
                  Icons.people,
                  color: currentPage == 0 ? Colors.black : Colors.white54,
                )))),
      ],
    );
  }
}
