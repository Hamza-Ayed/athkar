import 'dart:convert';
import 'dart:convert' show json;

import 'package:athkar/Services/Constant.dart';
// import 'package:audioplayers/audio_cache.dart';
// import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// import 'package:audioplayers/audio_cache.dart';
// import 'package:audioplayers/audioplayers.dart';

class QuraanPage extends StatefulWidget {
  const QuraanPage({
    Key? key,
    required this.chapter_id,
  }) : super(key: key);

  final int chapter_id;

  @override
  _QuraanPageState createState() => _QuraanPageState();
}

class _QuraanPageState extends State<QuraanPage> {
  // AudioCache audioCache = AudioCache();
  // AudioPlayer advancedPlayer = AudioPlayer();

  @override
  void initState() {
    fetchPost();
//    if (index <= teams.length) {
//      index++;
//    }

    super.initState();
  }

  var Ayahs;
  var AllData;

  var _isloadidng = true;

  fetchPost() async {
    final response = await http
        .get('http://api.alquran.cloud/v1/surah/${widget.chapter_id}/ar.alafasy'
//        'http://staging.quran.com:3000/api/v3/chapters/${widget.chapter_id}/verses?recitation=1&language=ar&text_type=image'

//      "https://javad-salah-v1.p.rapidapi.com/32.5062223/38.1938235/3/?method=%7Bmethod%7D&date=04%252F03%252F2020",
//      headers: {
//        'x-rapidapi-host': "javad-salah-v1.p.rapidapi.com",
//        'x-rapidapi-key': "1116276719msh32824dadd69f5afp157e70jsn789b644998d3"
//      },
            );
    if (response.statusCode == 200) {
      // print(response.body);

      final map = json.decode(response.body);
      final itemsJson = map['data']['ayahs']; //
      final datajson = map['data']; // events[0].strEventAlternate
      setState(() {
        _isloadidng = false;
        Ayahs = itemsJson;
        AllData = datajson;
//        print(Ayahs);
      });
    }
  }

//  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _isloadidng
            ? new CircularProgressIndicator()
            : Text('${AllData['name']}'),
      ),
      body: Center(
        child: FutureBuilder(
            future: DefaultAssetBundle.of(context)
                .loadString("lib/data/surah/surah_${widget.chapter_id}.json"),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return CupertinoActivityIndicator();
              }
              var myData = json.decode(snapshot.data.toString());
              int length = myData['verse'].length;
              var length1 = length.toDouble();
              return Center(
                child: new ListView.builder(
                    itemCount: length,
                    padding: const EdgeInsets.all(0.0),
                    itemBuilder: (BuildContext context, int position) {
                      new Divider();
                      final index = position;
                      var Kolor = Color(0xFFfaebd7);
                      return Column(
                        children: <Widget>[
                          Container(
                            color: Kolor,
                            child: FlatButton(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  child: Wrap(children: [
                                    Text(
                                      '${myData['verse']['verse_${position + 1}']} ' +
                                          ' (${position + 1}) ',
                                      style: kquranstyle,
                                      textAlign: TextAlign.right,
                                    )
                                  ]),
                                ),
                              ),
                              onPressed: () {
//                                Todo voice  fpr local file
//                                final player = audioCache;
//                                player.play('${teams[position]['audio']}');
                                // final player = advancedPlayer;
                                // player.play(
                                // '${Ayahs[position]['audio']}',
                                // );
                              },
//                              onPressed: () {
//                                print(position + 1);
//                                print(index);
//                                print(AllData['number']);
////                                print(Ayahs[index]['text']);
//
////                                audioCache.play('${teams[position]['audio']}');
//                                Navigator.push(context,
//                                    MaterialPageRoute(builder: (context) {
//                                  return TafseerPage(
//                                    tafseer_id: 1,
//                                    teams: Ayahs,
//                                    index: index,
//                                    ayah_number: position + 1,
//                                    sura_number: AllData['number'],
////                                    verse_id: teams[position]['numberInSurah'],
//                                  );
//                                }));
//                              },
                            ),
                          ),
                        ],
                      );
                    }),
              );
            }),
      ),
    );
  }
}
