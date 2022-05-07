import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TafseerPage extends StatefulWidget {
  const TafseerPage({
    Key? key,
    this.teams,
    required this.ayah_number,
    required this.tafseer_id,
    required this.sura_number,
    required this.index,
  }) : super(key: key);

  final teams;
  final int ayah_number, tafseer_id;
  final int sura_number;
  final int index;

  @override
  _TafseerPageState createState() => _TafseerPageState();
}

class _TafseerPageState extends State<TafseerPage> {
  var tafsser;
  var _isloadidng = true;

  @override
  void initState() {
    fetchTafsser();
    super.initState();
  }

  fetchTafsser() async {
    final response = await http.get(
        'http://api.quran-tafseer.com/tafseer/4/${widget.tafseer_id}/${widget.sura_number}/${widget.ayah_number}/');
//        'http://staging.quran.com:3000/api/v3/chapters/${widget.chapter_id}/verses/${widget.verse_id}/tafsirs');
    if (response.statusCode == 200) {
      // print(response.body);

      final map = json.decode(response.body);
      final itemsJson = map; //events[0].strEventAlternate
      setState(() {
        _isloadidng = false;
        tafsser = itemsJson;
        print(tafsser);
      });
    }
  }

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
//        title: Text(
//          '${widget.teams[widget.index]['text']}',
//          textAlign: TextAlign.right,
//          textDirection: TextDirection.rtl,
//          overflow: TextOverflow.clip,
//          softWrap: true,
//        ),
            ),
        body: Center(
          child: Text(tafsser['text']),
        ) //text

//      Center(
//        child: FutureBuilder(
//            future: DefaultAssetBundle.of(context).loadString(
//                "lib/data/translation/ar/ar_translation_${widget.chapter_id}.json"),
//            builder: (context, snapshot) {
//              if (!snapshot.hasData) {
//                return CircularProgressIndicator();
//              }
//              var myData = json.decode(snapshot.data.toString());
//              int length = myData['verse'].length;
//              var length1 = length.toDouble();
//              return Center(
//                child: new ListView.builder(
//                    itemCount: length,
//                    padding: const EdgeInsets.all(0.0),
//                    itemBuilder: (BuildContext context, int position) {
//                      new Divider();
//                      final index = position;
//                      var Kolor = Colors.teal;
//                      return Text(
//                          '${myData['verse']['verse_${position + 1}']}');
//                    }),
//              );
//            }),
//      ),
        );
  }
}
