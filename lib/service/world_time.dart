//Network Package
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
//convert json
import 'dart:convert';
//time formate
import 'package:intl/intl.dart';

class WorldTime{

  String location;  //location name for the UI
  String time;      //the time in that location
  String flag;      //url to an asset flag icon
  String url;       //this is the location url for api endpoint
  bool isDay;       //to determine if it is day or night

  WorldTime({ this.location , this.flag , this.url });

  Future<void> getTime() async {

      //make a request
      Response response = await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);

      //get properties from data
      String datetime = data['datetime'];
      //offset
      String offset = data['utc_offset'].substring(1,3);

      //create datetime object
      DateTime now = DateTime.parse(datetime);

      //to determine +gmt or -gmt and change time based on that
      now = data['utc_offset'][0] == '+' ? now.add(Duration(hours: int.parse(offset) )) : now.subtract(Duration(hours: int.parse(offset) ));

      //day or night
      isDay = now.hour > 6 && now.hour < 18 ? true : false;

      //format time
      this.time = DateFormat.jm().format(now);


  }
}