import 'dart:async';

import 'package:flutter/material.dart';
import 'package:makanan/accountdetail.dart';
import 'package:makanan/helper/sizehelper.dart';
import 'package:makanan/models/cakemodels.dart';

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

  bool fetchData = false;
  int currentPage = 0;
  CakeModels m = CakeModels();

  _dialogBox() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Tap'),
            content: Text('Tap'),
          );
        });
  }

  List<CakeModels> _cakeList = [
    CakeModels(
        cakeName: 'Cake1',
        cakeDesc:
            'Top this classic carrot cake with moreish cream cheese icing and chopped walnuts or pecans. Serve as a sweet treat with a cup of tea any time of the day.',
        color: Color(0xFF00abe7),
        image:
            'https://halffullheart.com/portfolio/cupcake/icon_128x128@2x.png'),
    CakeModels(
        cakeName: 'Cake2',
        cakeDesc:
            'Top this classic carrot cake with moreish cream cheese icing and chopped walnuts or pecans. Serve as a sweet treat with a cup of tea any time of the day.',
        color: Color(0xFF41ead4),
        image:
            'https://www.freepnglogos.com/uploads/cake-png/cake-png-transparent-cake-images-pluspng-21.png'),
    CakeModels(
        cakeName: 'Cake3',
        cakeDesc:
            'Top this classic carrot cake with moreish cream cheese icing and chopped walnuts or pecans. Serve as a sweet treat with a cup of tea any time of the day.',
        color: Color(0xFFe1bee7),
        image:
            'https://www.freepnglogos.com/uploads/cake-png/cake-png-transparent-cake-images-pluspng-21.png'),
    CakeModels(
        cakeName: 'Cake4',
        cakeDesc:
            'Top this classic carrot cake with moreish cream cheese icing and chopped walnuts or pecans. Serve as a sweet treat with a cup of tea any time of the day.',
        color: Color(0xFFffcdd2),
        image:
            'https://www.freepnglogos.com/uploads/cake-png/cake-png-transparent-cake-images-pluspng-21.png'),
    CakeModels(
        cakeName: 'Cake5',
        cakeDesc:
            'Top this classic carrot cake with moreish cream cheese icing and chopped walnuts or pecans. Serve as a sweet treat with a cup of tea any time of the day.',
        color: Color(0xFF41ead4),
        image:
            'https://www.freepnglogos.com/uploads/cake-png/cake-png-transparent-cake-images-pluspng-21.png')
  ];
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () {
      setState(() {
        fetchData = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (currentPage == 0) {
      return bodyCustom();
    } else {
      return AccountDetail();
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
          ],
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _headerProfile(),
            SizedBox(
              height: 25,
            ),
            _titlePopularCake(),
            SizedBox(
              height: 10,
            ),
            _listPopularCake()
          ],
        ),
      ),
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

  Widget _titlePopularCake() {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text('Popular Cakes', style: TextStyle(fontSize: 16)),
          Text(
            'Lihat semua',
            style: TextStyle(fontSize: 12),
          )
        ],
      ),
    );
  }

  Widget _listPopularCake() {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10),
      height: sizeWidth(context) <= 320
          ? 150
          : sizeWidth(context) <= 360
              ? 170
              : sizeWidth(context) <= 480 ? 210 : 250,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _cakeList.length,
        itemBuilder: (BuildContext context, int i) {
          return InkWell(
            onLongPress: () {
              _dialogBox();
            },
            child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                elevation: 0.0,
                color: _cakeList[i].color,
                child: fetchData
                    ? Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15)),
                        width: sizeWidth(context) <= 320
                            ? 180
                            : sizeWidth(context) <= 360
                                ? 200
                                : sizeWidth(context) <= 480 ? 240 : 280,
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.only(
                                  left: 10,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      '${_cakeList[i].cakeName}',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      _cakeList[i].cakeDesc,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(fontSize: 12),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                child: Image.network(_cakeList[i].image),
                              ),
                            ),
                          ],
                        ),
                      )
                    : Container(
                        width: sizeWidth(context) <= 320
                            ? 180
                            : sizeWidth(context) <= 360
                                ? 200
                                : sizeWidth(context) <= 480 ? 240 : 280,
                        padding: EdgeInsets.all(50),
                        child: CircularProgressIndicator())),
          );
        },
      ),
    );
  }

  Widget _headerProfile() {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 3,
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 30, left: 25),
                  child: Text(
                    'Good ${_greeting()}',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 5, left: 25),
                  child: Text(
                    'MD',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Container(
            width: 70,
            height: 70,
            margin: EdgeInsets.only(right: 20),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                        'https://static.independent.co.uk/s3fs-public/thumbnails/image/2015/06/06/15/Chris-Pratt.jpg?w968h681'))),
          ),
        )
      ],
    );
  }
}
