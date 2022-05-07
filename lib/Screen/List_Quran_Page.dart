import 'package:athkar/Screen/Quraan_Page.dart';
import 'package:athkar/Services/Constant.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

class ListQuranPage extends StatefulWidget {
  @override
  _ListQuranPageState createState() => _ListQuranPageState();
}

class _ListQuranPageState extends State<ListQuranPage> {
  var myData;

  // var _isloadidng = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: new FutureBuilder(
          future:
              DefaultAssetBundle.of(context).loadString("lib/data/surah.json"),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return CircularProgressIndicator();
            }
            var myData = json.decode(snapshot.data.toString());
            int length = myData.length;
//    length1 = length.toDouble();
            return new ListView.builder(
              itemCount: length,
              padding: const EdgeInsets.all(0.0),
              itemBuilder: (BuildContext context, int position) {
                new Divider();
//                final index = position;
                return Container(
                  child: Column(
                    children: <Widget>[
                      FlatButton(
                        child: Card(
                          color: Colors.lightGreen,
                          child: Row(
                            children: <Widget>[
                              Container(
                                color: Colors.teal,
                                width: 60.0,
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      '‏عددها',
                                      style: ktitlestyle,
                                    ),
                                    Text(
                                      '${myData[position]['count']} ',
                                      style: ktitlestyle,
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: 90.0,
                                child: Text(
                                  '‏‏${myData[position]['type']} ',
                                  style: ktitlestyle,
                                ),
                              ),
                              Container(
                                child: Text(
                                  '${myData[position]['titleAr']} ',
                                  textDirection: TextDirection.rtl,
                                  textScaleFactor: 1.2,
                                  textAlign: TextAlign.center,
                                  style: ktitlestyle,
                                ),
                                width: 80.0,
                              ),
                              Container(
                                  width: 30.0,
                                  child:
                                      Text('‏ ${myData[position]['index']} ')),
                            ],
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          ),
                        ),
                        onPressed: () {
//                          int index = myData[position];
                          print('${myData[position]['index']}');
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return QuraanPage(
                                chapter_id: myData[position]['index'],
                              );
                            }),
                          );
                        },
                      ),

//                        Text(teams.length.toString())
                    ],
                  ),
                );
              },
            );
          }),
    ));
  }
}
