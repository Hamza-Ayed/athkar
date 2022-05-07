import 'package:athkar/Services/Constant.dart';
import 'package:flutter/material.dart';

import 'Athkar.dart';

class FirstHomePageAthkarItem extends StatelessWidget {
  const FirstHomePageAthkarItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(
//
//      ),
      body: Stack(
        children: <Widget>[
          CustomScrollView(
            reverse: false,
            slivers: <Widget>[
              SliverAppBar(
                forceElevated: true,
                pinned: true,
                floating: true,
                expandedHeight: 200,
                backgroundColor: Colors.deepPurple,
                flexibleSpace: FlexibleSpaceBar(
                  title: const Text(
                    '‏الأذكار',
                    style: ktitlestyjle,
                  ),
                  centerTitle: true,
                  background: Image.asset(
                    'assets/1024.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SliverFillRemaining(
                child: SafeArea(
                    child: Center(
                  child: ListView(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          const HomeAthkarPageSelector(
                            // pict: 'awak.jpeg',
                            kolor: Colors.yellowAccent,
                            sourcefeed: 'awak',
                            title: '‏اذكار الاستيقاظ من النوم',
                          ),
                          const HomeAthkarPageSelector(
                            // pict: 'sabah.jpeg',
                            kolor: Colors.blueAccent,
                            sourcefeed: 'Sabah',
                            title: '‏اذكار الصباح',
                          ),
                          const HomeAthkarPageSelector(
                            // pict: 'aksam.jpeg',
                            title: '‏اذكار المساء',
                            sourcefeed: 'aksam',
                            kolor: Colors.black45,
                          ),
                          const HomeAthkarPageSelector(
                            // pict: 'sleep.jpeg',
                            title: '‏اذكار ‏النوم',
                            sourcefeed: 'sleep',
                            kolor: Colors.blueGrey,
                          ),
                          const HomeAthkarPageSelector(
                            // pict: 'salhaSonra.jpg',
                            title: '‏اذكار ‏‏بعد الصلاة',
                            sourcefeed: 'salhaSonra',
                            kolor: Colors.green,
                          ),
                          const HomeAthkarPageSelector(
                            // pict: 'aksam.jpeg',
                            title: 'ايات الرقية الشرعية',
                            sourcefeed: 'quranRuqia',
                            // sourcefeed: 'salhaSonra',

                            kolor: Colors.amber,
                          ),
                          const HomeAthkarPageSelector(
                            // pict: 'salhaSonra.jpg',
                            title: '‏الرقية الشرعية من السنة النبوية',
                            sourcefeed: 'sunahRuqia',
                            // sourcefeed: 'salhaSonra',

                            kolor: Colors.blueAccent,
                          ),
                        ],
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.only(
                      //       top: 5.0, left: 16.0, right: 16.0),
                      //   child: Container(
                      //     color: Colors.amber,
                      //     height: 70.0,
                      //   ),
                      // )
                    ],
                  ),
                )),
              ),
            ],
          ),
        ],
      ),

//      bottomNavigationBar: BottomNavgationBarHome(),
    );
  }
}

class HomeAthkarPageSelector extends StatefulWidget {
  final String title;
  final String sourcefeed;
  final Color kolor;
  // final String pict;

  const HomeAthkarPageSelector({
    required this.title,
    required this.sourcefeed,
    required this.kolor,
    // required this.pict,
    Key? key,
  }) : super(key: key);

  @override
  _HomeAthkarPageSelectorState createState() => _HomeAthkarPageSelectorState();
}

class _HomeAthkarPageSelectorState extends State<HomeAthkarPageSelector> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        width: 350.0,
        color: widget.kolor,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Image.asset(
              //   'assets/${widget.pict}',
              //   width: 50.0,
              //   height: 50.0,
              // ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.title, style: ktitlestyle,
//                textAlign: TextAlign.center,
                  textDirection: TextDirection.rtl,
                ),
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AthkaryPage(
              title: widget.title,
              sourcefeed: widget.sourcefeed,
            ),
          ),
        );
      },
    );
  }
}
