import 'package:flutter/material.dart';
import 'package:makanan/flashscreen.dart';
import 'package:makanan/homescreen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _username = TextEditingController();
  TextEditingController _password = TextEditingController();
  GlobalKey<FormState> _key = GlobalKey<FormState>();
  bool selectedVisibility = false;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.network(
              'https://seeklogo.com/images/C/cake-food-logo-9A487CF7AA-seeklogo.com.png',
              width: 80,
            ),
            Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              width: width / 1.5,
              child: Form(
                key: _key,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      validator: (value) =>
                          value.isEmpty ? 'Isi Username' : null,
                      controller: _username,
                      decoration: InputDecoration(
                        hintText: 'username',
                        icon: Icon(
                          Icons.people,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      validator: (value) =>
                          value.isEmpty ? 'Isi Password' : null,
                      controller: _password,
                      obscureText: selectedVisibility ? false : true,
                      decoration: InputDecoration(
                          hintText: 'password',
                          icon: Icon(Icons.lock),
                          suffixIcon: InkWell(
                            borderRadius: BorderRadius.circular(20),
                            onTap: () {
                              setState(() {
                                selectedVisibility = !selectedVisibility;
                              });
                              print(selectedVisibility);
                            },
                            child: Icon(selectedVisibility
                                ? Icons.visibility
                                : Icons.visibility_off),
                          )),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: width / 1.5,
                      child: RaisedButton(
                        splashColor: Colors.blue,
                        color: Colors.red[200],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        onPressed: () {
                          if (_key.currentState.validate()) {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomeScreen()));
                          }
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(color: Colors.black54),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      child: InkWell(
                        onTap: () {},
                        child: Text(
                          'Daftar',
                          style: TextStyle(fontSize: 10),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
