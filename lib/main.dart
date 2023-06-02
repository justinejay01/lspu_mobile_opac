import 'package:flutter/material.dart';
import 'package:lspu_mobile_opac/dbase.dart';

void main() => runApp(const MaterialApp(
      home: _Main(),
    ));

class _Main extends StatefulWidget {
  const _Main({Key? key}) : super(key: key);

  @override
  State<_Main> createState() => _MainState();
}

class _MainState extends State<_Main> {
  var db = dbase();
  List<String> topBooks = [];
  List<String> listBooks = [];
  List<String> listGenres = [];
  List<String> listDepts = [];

  Future<void> _getDept() async {
    topBooks = await db.getTopBooks();
    listGenres = await db.getGenres();
    listDepts = await db.getDept();
  }

  @override
  Widget build(BuildContext context) {
    _getDept();
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Container(
                        // Background
                        color: Colors.red,
                        height: MediaQuery.of(context).size.height * 0.2,
                        width: MediaQuery.of(context).size.width,
                        child: const Center(
                          child: Text(
                            'LSPU Mobile Library',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 30,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        color: Colors.transparent,
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                      ),
                    ],
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.17,
                    left: 20.0,
                    right: 20.0,
                    child: AppBar(
                      backgroundColor: Colors.white,
                      leading: const Icon(
                        Icons.menu,
                        color: Colors.red,
                      ),
                      primary: false,
                      title: const TextField(
                          decoration: InputDecoration(
                              hintText: "Search",
                              border: InputBorder.none,
                              hintStyle: TextStyle(color: Colors.grey))),
                      actions: <Widget>[
                        IconButton(
                          icon: const Icon(Icons.search, color: Colors.red),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: const Icon(Icons.notifications,
                              color: Colors.red),
                          onPressed: () {},
                        )
                      ],
                    ),
                  )
                ],
              ),
              Container(
                margin: const EdgeInsets.only(left: 20.0),
                child: const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Top Books",
                    textAlign: TextAlign.start,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 10.0),
                height: 200.0,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    for (int i = 0; i < 9; i++)
                      if (topBooks.length > i) showTopList(topBooks[i])
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 20.0, top: 10),
                child: const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "By Genres",
                    textAlign: TextAlign.start,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 10.0),
                height: 200.0,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    for (int i = 0; i < 9; i++)
                      if (listGenres.length > i) showTopList(listGenres[i])
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 20.0, top: 10),
                child: const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "By Department",
                    textAlign: TextAlign.start,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 10.0),
                height: 200.0,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    for (int i = 0; i < 9; i++)
                      if (listDepts.length > i) showTopList(listDepts[i])
                  ],
                ),
              ),
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                children: <Widget>[
                  for (int i = 1; i <= 10; i++)
                    Card(
                      margin: const EdgeInsets.fromLTRB(10, 5, 10, 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      elevation: 5,
                      child: Column(
                        children: [
                          AspectRatio(
                            aspectRatio: 5 / 4,
                            child: Image.asset(
                              "assets/portrait.jpg",
                              fit: BoxFit.fill,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(8),
                            child: Text("Something"),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ],
          ),
        ));
  }
}

class OpenBook extends State<_Main> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Container(
                        // Background
                        color: Colors.red,
                        height: MediaQuery.of(context).size.height * 0.2,
                        width: MediaQuery.of(context).size.width,
                        child: const Center(
                          child: Text(
                            'LSPU Mobile Library',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 30,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        color: Colors.transparent,
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                      ),
                    ],
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.17,
                    left: 20.0,
                    right: 20.0,
                    child: AppBar(
                      backgroundColor: Colors.white,
                      leading: const Icon(
                        Icons.menu,
                        color: Colors.red,
                      ),
                      primary: false,
                      title: const TextField(
                          decoration: InputDecoration(
                              hintText: "Search",
                              border: InputBorder.none,
                              hintStyle: TextStyle(color: Colors.grey))),
                      actions: <Widget>[
                        IconButton(
                          icon: const Icon(Icons.search, color: Colors.red),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: const Icon(Icons.notifications,
                              color: Colors.red),
                          onPressed: () {},
                        )
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

@override
Widget showTopList(String name) => Container(
    width: 150.0,
    margin: const EdgeInsets.only(right: 10.0),
    decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black12,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(20))),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Container(
            margin: const EdgeInsets.only(left: 5.0, bottom: 5.0),
            child: Text(
              name,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ))
      ],
    ));
