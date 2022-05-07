import 'dart:convert' show json;
import 'package:athkar/Services/Constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:vibration/vibration.dart';

class AthkaryPage extends StatefulWidget {
  final String sourcefeed;
  final String title;

  const AthkaryPage({
    required this.sourcefeed,
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  _AthkaryPageState createState() => _AthkaryPageState();
}

class _AthkaryPageState extends State<AthkaryPage> {
  int posetion = 0;
  int indexZeker = 1;
  int sliderValue = 0;

  var length1;
  var _isloadidng = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: _isloadidng != null
              ? new FutureBuilder(
                  future: DefaultAssetBundle.of(context)
                      .loadString("lib/data/${widget.sourcefeed}.json"),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return CupertinoActivityIndicator(
                        radius: 15,
                        animating: true,
                      );
                    }
                    var myData = json.decode(snapshot.data.toString());
                    int zekerCounter = myData[posetion]['counter'] as int;
                    int length = myData.length;
                    length1 = length.toDouble();
                    return SafeArea(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                FlatButton(
                                  child: Row(
                                    children: <Widget>[
                                      Icon(
                                        Icons.arrow_back_ios,
                                        color: Colors.green,
                                        size: 30.0,
                                      ),
                                      Text('‏‏التالي')
                                    ],
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      posetion++;
                                      sliderValue = posetion;

                                      if (posetion == length - 1) {
                                        print('end zeker $myData');
                                        Navigator.pop(context);
                                      }

                                      indexZeker = 1;
                                    });
                                  },
                                ),
                                Text(
                                  ' ${posetion + 1} ',
                                  style: ktitlestyle,
                                ),
                                Expanded(
                                  child: Container(
                                    alignment: Alignment.centerRight,
                                    // decoration: kdecoration,
                                    child: Slider(
                                      divisions: length,
                                      label: '$posetion',
                                      activeColor: Colors.green,
                                      inactiveColor: Colors.red,
                                      min: 0,
                                      max: length1,
                                      value: sliderValue.toDouble(),
                                      onChanged: (double newValue) {
                                        setState(() {
                                          sliderValue = posetion;
                                          newValue = posetion.toDouble();
                                          sliderValue = newValue.round();
                                        });
                                      },
                                    ),
                                  ),
                                ),
                                Text(
                                  ' ${length - 1}',
                                  style: ktitlestyle,
                                ),
                                FlatButton(
                                  child: Row(
                                    children: <Widget>[
                                      Text('الخلف'),
                                      Icon(
                                        Icons.arrow_forward_ios,
                                        color: Colors.green,
                                        size: 30.0,
                                      ),
                                    ],
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      if (posetion > 0) {
                                        posetion--;
                                        sliderValue = posetion;
                                      } else {
                                        posetion = 0;
                                        Navigator.pop(context);
                                      }

                                      indexZeker = 1;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),

                          zekerCounter != 1
                              ? Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10.0, right: 10.0, bottom: 4.0),
                                  child: Container(
//                        decoration: kdecoration,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Container(
                                          width: 45,
                                          child: Padding(
                                            padding: const EdgeInsets.all(2),
                                            child: Center(
                                              child: new Text(
                                                zekerCounter.toString(),
                                                style: ktitlestyle,
                                              ),
                                            ),
                                          ),
                                          decoration: kdecoration,
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            color: Colors.black,
                                            borderRadius:
                                                BorderRadius.circular(22),
                                          ),
                                          // color: Colors.yellow,
                                          height: 20,
                                          width: 100,
                                          child: Stack(
                                            alignment: Alignment.centerRight,
                                            children: [
                                              Column(
                                                children: <Widget>[
                                                  // Container(
                                                  //   alignment: Alignment.centerRight,
                                                  //   color: Colors.green,
                                                  //   height: 10,
                                                  //   width:
                                                  //       (100 * ((posetion / length))),
                                                  // ),
                                                  Container(
                                                    alignment:
                                                        Alignment.centerRight,
                                                    decoration: BoxDecoration(
                                                      color: Colors.amber[300],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              22),
                                                    ),
                                                    width: (100 *
                                                        ((indexZeker /
                                                            zekerCounter))),
                                                    height: 20,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        // Container(
                                        //   child: Padding(
                                        //     padding: const EdgeInsets.all(8.0),
                                        //     child: new Text(
                                        //       '‏من',
                                        //       style: ktitlestyle,
                                        //     ),
                                        //   ),
                                        //   decoration: kdecoration,
                                        // ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Container(
                                          width: 40,
                                          child: Padding(
                                            padding: const EdgeInsets.all(2.0),
                                            child: Center(
                                              child: Text(
                                                indexZeker.toString(),
                                                style: ktitlestyle,
                                              ),
                                            ),
                                          ),
                                          decoration: kdecoration,
                                        ),
                                        FlatButton(
                                          onPressed: () {
                                            setState(() {
                                              indexZeker = 1;
                                            });
                                          },
                                          child: Container(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(2.0),
                                              child: Text('‏تصفير'),
                                            ),
                                            decoration: kdecoration,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              : Container(
                                  height: 1,
                                ),
                          FlatButton(
                            child: Column(
                              children: <Widget>[
                                Container(
//                        color: Colors.teal,
                                  width: 450.0,
                                  height:
                                      MediaQuery.of(context).size.height * .62,
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: ListView(
                                      scrollDirection: Axis.vertical,
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            myData[posetion]['title'],
                                            style: ktitlestyle,
                                            textScaleFactor: 1.5,
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  // decoration: kdecoration,
//                    child:
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: Container(
                                    height:
                                        MediaQuery.of(context).size.height * .1,
                                    child: ListView(
                                      scrollDirection: Axis.vertical,
                                      children: <Widget>[
                                        Text(
                                          myData[posetion]['source'],
                                          style: ktitlestyle,
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  ),
                                  // decoration: kdecoration,
                                ),
                              ],
                            ),
                            onPressed: () {
                              setState(() {
                                if (indexZeker < zekerCounter) {
                                  indexZeker++;
//                                    if (posetion == length - 1) {
//                                      print('end zeker $myData');
//                                      Navigator.pop(context);
//                                    }
                                } else {
                                  posetion++;
                                  // Vibration.vibrate();
//                                    Vibration.vibrate(
//                                        pattern: [500, 1000, 500, 2000]);
                                  HapticFeedback.heavyImpact();
                                  sliderValue = posetion;
                                  if (posetion == length - 1) {
                                    print('end zeker $myData');
                                    Navigator.pop(context);
                                  }
                                  indexZeker = 1;
                                }
                              });
                            },
                          ),

//                  Padding(
//                    padding: const EdgeInsets.all(16.0),
//                    child: Container(
//                      width: 450.0,
//                      decoration: kdecoration,
//                      child: Padding(
//                        padding: const EdgeInsets.all(8.0),
//                        child: Row(
//                          mainAxisAlignment: MainAxisAlignment.center,
//                          children: <Widget>[
//                            Text('Source'),
//                          ],
//                        ),
//                      ),
//                    ),
//                  ),
                        ],
                      ),
                    );
                  },
                )
              : CupertinoActivityIndicator(
                  radius: 15,
                ),
        ));
  }
}
