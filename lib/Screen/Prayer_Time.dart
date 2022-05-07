import 'dart:convert';
import 'package:athkar/Services/Constant.dart';
import 'package:athkar/Services/Location.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class PrayerTime extends StatefulWidget {
  final String location;

  const PrayerTime({Key? key, required this.location}) : super(key: key);

  @override
  _PrayerTimeState createState() => _PrayerTimeState();
}

class _PrayerTimeState extends State<PrayerTime> {
  late double Latitude;
  late double Longitude;

  @override
  void initState() {
    getLocation();
//    fetchPost();
    super.initState();
  }

  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    print(location.longitude);
    Latitude = location.latitude;
    Longitude = location.longitude;
    print(location.latitude);
    fetchPost();
//    return Latitude;
  }

  var teams;

  var _isloadidng = true;

  fetchPost() async {
    final response = await http.get(
      "https://javad-salah-v1.p.rapidapi.com/$Latitude/$Longitude/3/?method=%7Bmethod%7D&date=04%252F03%252F2020",
      headers: {
        'x-rapidapi-host': "javad-salah-v1.p.rapidapi.com",
        'x-rapidapi-key': "1116276719msh32824dadd69f5afp157e70jsn789b644998d3"
      },
    );
    if (response.statusCode == 200) {
      // print(response.body);

      final map = json.decode(response.body);
      final itemsJson = map['times']; //events[0].strEventAlternate
      setState(() {
        _isloadidng = false;
        teams = itemsJson;
        print(teams);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: _isloadidng
          ? new CircularProgressIndicator()
          : new ListView(
              children: <Widget>[
                prayerWidgetTable(
                  teams: teams["imsak"],
                  kolor: Colors.red,
                  Pray: '‏وقت الإمساك',
                ),
                prayerWidgetTable(
                  teams: teams["fajr"],
                  kolor: Colors.green,
                  Pray: '‏الفجر',
                ),
                prayerWidgetTable(
                  teams: teams["sunrise"],
                  kolor: Colors.yellow,
                  Pray: '‏الشروق',
                ),
                prayerWidgetTable(
                  teams: teams["dhuhr"],
                  kolor: Colors.blueAccent,
                  Pray: '‏الظهر',
                ),
                prayerWidgetTable(
                  teams: teams["asr"],
                  kolor: Colors.indigo,
                  Pray: '‏العصر',
                ),
                prayerWidgetTable(
                  teams: teams["sunset"],
                  kolor: Colors.brown,
                  Pray: '‏الغروب',
                ),
                prayerWidgetTable(
                  teams: teams["maghrib"],
                  kolor: Colors.lightGreen,
                  Pray: '‏المغرب',
                ),
                prayerWidgetTable(
                  teams: teams["isha"],
                  kolor: Colors.black45,
                  Pray: '‏العشاء',
                ),
                prayerWidgetTable(
                  teams: teams["midnight"],
                  kolor: Colors.blueAccent,
                  Pray: '‏منتصف الليل',
                ),
              ],
            ),
    ));
  }
}

class prayerWidgetTable extends StatelessWidget {
  final Color kolor;
  final String Pray;

  const prayerWidgetTable({
    required this.kolor,
    required this.Pray,
    Key? key,
    @required this.teams,
  }) : super(key: key);

  final teams;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: kolor,
        height: 40.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              teams,
              style: ktitlestyle,
            ),
            Text(
              Pray,
              style: ktitlestyle,
            ),
          ],
        ),
      ),
    );
  }
}
