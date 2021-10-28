/* #28 - WorldTime Custom Class */
import 'package:http/http.dart';
import 'dart:convert';

class WorldTime {
  String location = ""; // location name for the UI
  String time = ""; // the time in that location
  String flag = ""; // url to an asset flag icon
  String url = ""; // location url for api endpoint

  WorldTime(this.location, this.flag, this.url );
   Future<void> getTime() async {
    // make the request
     Response response = await get('http://www.worldtimeapi.org/api/timezone/$url');
    //Response response = await get('http://www.worldtimeapi.org/api/timezone/Asia/Kabul');
    print('url : $url');
    Map data = jsonDecode(response.body);
    // print(data);

    // get properties from data
    String datetime = data['datetime'];
    String offset = data['utc_offset'].substring(1,3);
    //print(datetime);
    //print(offset);

    // create DateTime object
    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(offset)));
    // set the time property
    time = now.toString();

  } // end-getTime()


} //End-of world_time {


