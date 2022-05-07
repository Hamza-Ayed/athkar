import 'package:athkar/Services/Constant.dart';
import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

// final _isSelected = true;

class _TestState extends State<Test> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Stack(
        children: <Widget>[
          CustomScrollView(
            reverse: false,
            slivers: <Widget>[
              SliverAppBar(
                backgroundColor: Colors.black87,
                pinned: false,
                expandedHeight: 300,
                flexibleSpace: FlexibleSpaceBar(
                  title: Text('Athkary'),
                  centerTitle: true,
                  background: Image.asset(
                    'assets/1024.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              _isSelected != false ? ListViewDetailsvv() : GridVieww()
              // ListViewDetailsvv()
              // GridVieww(), //todo grid view
            ],
          ),
          // Checkbox(
          //     value: _isSelected,
          //     onChanged: (bool value) {
          //       setState(() {
          //         _isSelected = value;
          //       });
          //     }),
          RaisedButton(
            onPressed: () {
              // print(_isSelected);
              setState(() {
                // _isSelected != false ? _isSelected = true : _isSelected = false;
                if (_isSelected = true) {
                  _isSelected = false;
                }
                if (_isSelected = false) {
                  _isSelected = true;
                }
                //  else {
                //   _isSelected = false;
                // }
              });
              print(_isSelected);
            },
            child: Text('choose widget'),
          )
        ],
      ),
    );
  }
}

class ListViewDetailsvv extends StatelessWidget {
  const ListViewDetailsvv({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      child: ListView(
        cacheExtent: 7,
        semanticChildCount: 4,
        shrinkWrap: true,
        padding: EdgeInsets.all(6),
        // itemExtent: 88,
        children: <Widget>[
          ListviewDetails(),
          ListviewDetails(),
          ListviewDetails(),
        ],
      ),
    );
  }
}

class ListviewDetails extends StatelessWidget {
  const ListviewDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: Colors.black38,
        height: 70,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              ClipOval(
                child: Image.asset('assets/sleep.jpeg'),
              ),
              Container(
                color: Colors.redAccent,
                width: MediaQuery.of(context).size.width * .65,
                child: Column(
                  children: <Widget>[
                    Text(
                      'data',
                      style: ktitlestyjle,
                    ),
                    Text(
                      'description hgfhgfhgf  vhgf',
                      maxLines: 1,
                      style: ktitlestyjle,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        width: MediaQuery.of(context).size.width,
      ),
    );
  }
}

class GridVieww extends StatelessWidget {
  const GridVieww({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      child: GridView.count(
        childAspectRatio: 16 / 10,
        crossAxisCount: 2,
        children: <Widget>[
          Card(
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                Center(
                  child: Image.asset(
                    'assets/sleep.jpeg',
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                  color: Colors.black38,
                  height: 70,
                  child: Center(
                    child: Text(
                      'data',
                      style: ktitlestyjle,
                    ),
                  ),
                  width: 200,
                ),
              ],
            ),
          ),
          Card(
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                Center(
                  child: Image.asset(
                    'assets/sleep.jpeg',
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                  color: Colors.black38,
                  height: 70,
                  child: Center(
                    child: Text(
                      'data',
                      style: ktitlestyjle,
                    ),
                  ),
                  width: 200,
                ),
              ],
            ),
          ),
          Card(
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                Center(
                  child: Image.asset(
                    'assets/sleep.jpeg',
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                  color: Colors.black38,
                  height: 70,
                  child: Center(
                    child: Text(
                      'data',
                      style: ktitlestyjle,
                    ),
                  ),
                  width: 200,
                ),
              ],
            ),
          ),
          Card(
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                Center(
                  child: Image.asset(
                    'assets/sleep.jpeg',
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                  color: Colors.black38,
                  height: 70,
                  child: Center(
                    child: Text(
                      'data',
                      style: ktitlestyjle,
                    ),
                  ),
                  width: 200,
                ),
              ],
            ),
          ),
          Card(
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                Center(
                  child: Image.asset(
                    'assets/sleep.jpeg',
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                  color: Colors.black38,
                  height: 70,
                  child: Center(
                    child: Text(
                      'data',
                      style: ktitlestyjle,
                    ),
                  ),
                  width: 200,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
