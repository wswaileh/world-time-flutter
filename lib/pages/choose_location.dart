import 'package:flutter/material.dart';
import 'package:world_time/service/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(
        url: 'Asia/Jerusalem', location: 'Jerusalem', flag: 'palestine.png'),
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];


  void updateTime(index) async {
    await locations[index].getTime();

    _isLoading = false;

    Navigator.pop(context, {
      "location": locations[index].location,
      "flag": locations[index].flag,
      "time": locations[index].time,
      "isDay": locations[index].isDay,
    });
  }

  bool _isLoading = false;
  List<String> choices = ['About Me'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
          title: Text("Choose A Location"),
          centerTitle: true,
          elevation: 0,
          actions: <Widget>[
            PopupMenuButton<String>(
              onSelected: choiceAction,
              itemBuilder: (BuildContext context){
                return ['About Me'].map(
                    (String choice){
                      return PopupMenuItem<String>(
                        value: choice,
                        child: Text(choice),
                      );
                    }
                ).toList();
              },
            ),
          ],
        ),
        body: loadBody());
  }

  Widget loadBody() {
    //if the data is not loading view list
    if (!_isLoading)
      return ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: () {
                  updateTime(index);
                  setState(() {
                    _isLoading = true;
                  });
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage:
                      AssetImage('assets/${locations[index].flag}'),
                ),
              ),
            ),
          );
        },
      );
    //if the data is loading from server return spinner
    else
      return Center(
        child: SpinKitRing(
          color: Colors.blue,
          size: 80.0,
        ),
      );
  }

  void choiceAction(String choice){
    if (choice == "About Me")
      Navigator.pushNamed(context, '/about-me');
  }
}
