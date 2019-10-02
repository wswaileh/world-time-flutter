import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;

    String bgImg = data['isDay'] ? 'day.png' : 'night.png';
    Color bgColor = data['isDay'] ? Colors.blue[500] : Colors.indigo[900];

    return Scaffold(
      backgroundColor: bgColor,
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),
            child: Column(
              children: <Widget>[
                FlatButton.icon(
                    onPressed: () async {
                      dynamic result =
                          await Navigator.pushNamed(context, '/location');
                      if (result != null) {
                        setState(() {
                          data = {
                            'time': result['time'],
                            'location': result['location'],
                            'isDay': result['isDay'],
                            'flag': result['flag']
                          };
                        });
                      }
                    },
                    icon: Icon(
                      Icons.edit_location,
                      color: Colors.grey[300],
                    ),
                    label: Text(
                      "Edit Location",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    )
                ),
                SizedBox(
                  height: 80.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      data['location'],
                      style: TextStyle(
                        letterSpacing: 2,
                        fontSize: 28,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 70.0,
                ),
                Text(
                  data['time'],
                  style: TextStyle(
                    fontSize: 66,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ),
    );
  }
}
