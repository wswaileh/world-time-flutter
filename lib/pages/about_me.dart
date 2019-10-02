import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutMe extends StatelessWidget {
  _launchURL(String url_name) async {
    String url = '';
    switch (url_name) {
      case 'facebook':
        url = 'https://www.facebook.com/wswaileh';
        break;
      case 'linkedin':
        url = 'https://www.linkedin.com/in/waleedswaileh';
        break;
      case 'mail':
        url = "mailto:wkswaileh@gmail.com";
        break;
      default:
        url = 'https://github.com/wswaileh';
    }

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text("About The Developer"),
        centerTitle: true,
      ),
      body: Center(
          child: Padding(
        padding: EdgeInsets.fromLTRB(30, 50, 30, 0),
        child: Column(
          children: <Widget>[
            //Avatar Image
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/me.jpg'),
                radius: 140,
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            Text(
              "Waleed Swaileh",
              style: TextStyle(
                fontSize: 36,
                letterSpacing: 2,
                color: Colors.grey[800],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "4th year Student at BZU",
              style: TextStyle(
                fontSize: 26,
                color: Colors.grey[700],
              ),
            ),
            SizedBox(
              height: 60,
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: IconButton(
                    icon: Image.asset('assets/facebook.png'),
                    iconSize: 50,
                    onPressed: () async {
                      _launchURL('facebook');
                    },
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: IconButton(
                    icon: Image.asset('assets/linkedin.png'),
                    iconSize: 50,
                    onPressed: () async {
                      _launchURL('linkedin');
                    },
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: IconButton(
                    icon: Image.asset('assets/github-sign.png'),
                    iconSize: 50,
                    onPressed: () async {
                      _launchURL('github');
                    },                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            FlatButton.icon(
                onPressed: () {
                  _launchURL('mail');
                },
                icon: Icon(
                  Icons.mail,
                  color: Colors.grey[700],
                  size: 40,
                ),
                label: Text(
                  "Email Me",
                  style: TextStyle(
                    color: Colors.grey[700],
                  ),

                ),
            ),
          ],
        ),
      )),
    );
  }
}
