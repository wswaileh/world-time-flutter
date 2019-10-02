import 'package:flutter/material.dart';
import 'package:world_time/service/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {


  void setupWorldTime() async {
    WorldTime worldTime = WorldTime(url: 'Asia/Jerusalem', location: 'Jerusalem', flag: 'palestine.png');

    try {
      await worldTime.getTime();
      Navigator.pushReplacementNamed(context, '/home', arguments: {
        "location":worldTime.location,
        "flag":worldTime.flag,
        "time": worldTime.time,
        "isDay": worldTime.isDay,
      });
    }

    catch (E) {
      Navigator.pushReplacementNamed(context, '/no-internet');
    }

  }


  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: SpinKitFadingCube(
          color: Colors.white,
          size: 50.0,
        ),
      )
    );
  }
}
