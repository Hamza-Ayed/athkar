import 'package:athkar/Services/Constant.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:athkar/Services/Location.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class Azan extends StatefulWidget {
  @override
  _AzanState createState() => _AzanState();
}

class _AzanState extends State<Azan> {
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
  var teams1;
  var date = int.parse(DateFormat.d().format(new DateTime.now()));
  var _isloadidng = true;

  fetchPost() async {
    final response = await http.get(
        'http://api.aladhan.com/v1/calendar?latitude=$Latitude&longitude=$Longitude&method=2&month=${DateFormat.M().format(new DateTime.now())}&year=${DateFormat.y().format(new DateTime.now())}');

    if (response.statusCode == 200) {
      // print(response.body);

      final map = json.decode(response.body);
      final itemsJson = map['data']; //events[0].strEventAlternate
      final itemsJson1 = map['data']; //events[0].strEventAlternate
      setState(() {
        _isloadidng = false;
        teams = itemsJson;
        teams1 = itemsJson1;
        print(teams);
      });
    }
  }

//
//  x.data[15].timings.Dhuhr  @override

  Widget build(BuildContext context) {
    return Center(
      child: _isloadidng
          ? new CircularProgressIndicator()
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        color: Colors.teal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              "${teams[date.toInt() - 1]['date']['hijri']['weekday']['ar']}",
                              style: kquran,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              "${teams[date.toInt() - 1]['date']['hijri']['month']['ar']}",
                              style: kquran,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Column(
                              children: <Widget>[
                                Text(
                                    "${teams[date.toInt() - 1]['date']['gregorian']['date']}"),
                                Text(
                                    "${teams[date.toInt() - 1]['date']['hijri']['date']}"),
                              ],
                            ),
                            SizedBox(
                              width: 20,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(color: Colors.green),
                        child: Text(
                          "${teams[date.toInt() - 1]['meta']['timezone']}",
                          style: ktitlestyle,
                        ),
                      ),
//                      x.data[16]..x.data[16]...weekday.ar
                      prayerWidgetTable(
                          kolor: Colors.red,
                          Pray: '‏الفجر',
                          teams:
                              "${teams[date.toInt() - 1]['timings']['Fajr']}"),
                      prayerWidgetTable(
                          kolor: Colors.grey,
                          Pray: '‏شروق الشمس',
                          teams:
                              "${teams[date.toInt() - 1]['timings']['Sunrise']}"),
                      prayerWidgetTable(
                          kolor: Colors.brown,
                          Pray: '‏الظهر',
                          teams:
                              "${teams[date.toInt() - 1]['timings']['Dhuhr']}"),
                      prayerWidgetTable(
                          kolor: Colors.pink,
                          Pray: '‏العصر',
                          teams:
                              "${teams[date.toInt() - 1]['timings']['Asr']}"),
                      prayerWidgetTable(
                          kolor: Colors.blueAccent,
                          Pray: '‏المغرب',
                          teams:
                              "${teams[date.toInt() - 1]['timings']['Maghrib']}"),
                      prayerWidgetTable(
                          kolor: Colors.lightGreen,
                          Pray: '‏العشاء',
                          teams:
                              "${teams[date.toInt() - 1]['timings']['Isha']}"),
                      prayerWidgetTable(
                          kolor: Colors.orange,
                          Pray: '‏الإمساك',
                          teams:
                              "${teams[date.toInt() - 1]['timings']['Imsak']}"),
                    ],
                  ),
                ),
              ),
            ),
    );
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
      padding: const EdgeInsets.all(3.0),
      child: Container(
        color: kolor,
        height: 40.0,
        child: FlatButton(
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
          onPressed: () {
            var time = DateFormat.Hms().format(new DateTime.now());
            print(time);
          },
        ),
      ),
    );
  }
}
