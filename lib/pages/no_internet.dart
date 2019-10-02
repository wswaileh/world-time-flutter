import 'package:flutter/material.dart';

class NoInternet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("World Time"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 90,
            ),
            Image(
              image: AssetImage('assets/no-wifi.png'),
              width: 200,
              height: 200,
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              "No Internet Connection!",
              style: TextStyle(
                fontSize: 30,
                letterSpacing: 2,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              "Please check your network settings!",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            FlatButton(
              color: Colors.blue,
              textColor: Colors.white,
              onPressed: (){
                Navigator.pushReplacementNamed(context, '/');
              },
              child: Text("Retry"),
            )

          ],
        ),
      ),
    );
  }
}
