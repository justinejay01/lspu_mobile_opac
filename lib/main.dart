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

class _OpenBook extends StatefulWidget {
  final String bookId;

  const _OpenBook({Key? key, required this.bookId}) : super(key: key);

  @override
  State<_OpenBook> createState() => _OpenBookState();
}

class _MainState extends State<_Main> {
  var db = dbase();
  Map<String, String> topBooks = {};
  Map<String, String> listBooks = {};
  List<String> listGenres = [];
  List<String> listDepts = [];

  /*
  Future<void> _get() async {
    topBooks = await db.getTopBooks();
    listGenres = await db.getGenres();
    listDepts = await db.getDept();
  }

   */

  Future<Map<String,String>> _get() async {
    return await db.getTopBooks();
  }

  @override
  Widget build(BuildContext context) {
    _get();

    return FutureBuilder<Map<String,String>>(
      future: _get(),
        builder: (BuildContext c, AsyncSnapshot<Map<String, String>> snapshot) {
          if (snapshot.hasData) {
            var topBook = topBooks.entries.toList();
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
                            for (int i = 1; i < 9; i++)
                              if (topBooks.length > i)
                                showTopList(context, topBook[i].key, topBook[i].value)
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
                              if (listGenres.length > i)
                                showTopList(context, listGenres[i], "")
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
                              if (listDepts.length > i)
                                showTopList(context, listDepts[i], "")
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
                                child: InkWell(
                                  onTap: () async {
                                    await Navigator.push(context, MaterialPageRoute(builder: (BuildContext c) {
                                      return _OpenBook(bookId: topBook[i].key);
                                    }));
                                  },
                                  child: Column(
                                    children: [
                                      AspectRatio(
                                        aspectRatio: 5 / 4,
                                        child: Image.asset(
                                          "assets/${topBook[i].value}.jpg",
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Text(topBook[i].value),
                                      ),
                                    ],
                                  ),
                                )
                            ),
                        ],
                      ),
                    ],
                  ),
                )
            );
          } else {
            return const CircularProgressIndicator();
          }
        }
    );
  }
}

class _OpenBookState extends State<_OpenBook> {
  var db = dbase();
  var gendept = "";

  Future<List<String>> _getBookInf() async {
    return await db.getBookInfo(widget.bookId);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<String>>(
        future: _getBookInf(),
        builder: (BuildContext c, AsyncSnapshot<List<String>> snapshot) {
          if (snapshot.hasData) {
            List<String>? bookInfo = snapshot.data;
            if (bookInfo![3].isEmpty) {
              gendept = bookInfo[4];
            } else {
              gendept = bookInfo[3];
            }

            return WillPopScope(
              onWillPop: () async {
                Navigator.pop(context);
                return true;
              },
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
                                height:
                                    MediaQuery.of(context).size.height * 0.25,
                                width: MediaQuery.of(context).size.width,
                                child: Center(
                                  child: Text(
                                    bookInfo[0],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                color: Colors.transparent,
                                height: 150,
                                width: MediaQuery.of(context).size.width,
                              ),
                            ],
                          ),
                          Positioned(
                            top: MediaQuery.of(context).size.height * 0.19,
                            left: 10.0,
                            right: 10.0,
                            height: 200.0,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                    ),
                                    child: Text(
                                      bookInfo[1],
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                                Image.asset(
                                    "assets/A new history of modern architecture.jpg"),
                                Expanded(
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                    ),
                                    child: Text(
                                      gendept,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w500,

                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      Center(
                        child: Container(
                          margin:
                          const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 50.0),
                          child: Card(
                              color: Colors.redAccent,
                              shadowColor: Colors.black,
                              elevation: 20,
                              child: Container(
                                padding:
                                const EdgeInsets.only(top: 20.0, bottom: 20.0),
                                margin:
                                const EdgeInsets.only(left: 20.0, right: 20.0),
                                child: Text(bookInfo[2],
                                  textAlign: TextAlign.justify,
                                ),
                              ),
                          ),
                        ),

                      ),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return const CircularProgressIndicator();
          }
        });
  }
}

@override
Widget showTopList(BuildContext c, String bookId, String bookName) => InkWell(
      onTap: () async {
        await Navigator.push(c, MaterialPageRoute(builder: (BuildContext c) {
          return _OpenBook(bookId: bookId);
        }));
      },
      child: Container(
        width: 175.0,
        height: 150.0,
        margin: const EdgeInsets.only(right: 10.0),
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black12,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(20)),
          image: DecorationImage(
            image: AssetImage("assets/${bookName}.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(
                margin: const EdgeInsets.only(left: 5.0, bottom: 5.0),
                child: Text(
                  bookName,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ))
          ],
        ),
      ),
    );
