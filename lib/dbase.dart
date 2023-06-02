import 'dart:async';
import 'package:mysql_client/mysql_client.dart';

class dbase {
  static String host = '10.200.5.227',
                user = 'root',
                password = '',
                db = 'lspu_library';
  static int port = 3306;

  dbase();

  MySQLConnectionPool getConn() {
    return MySQLConnectionPool(
      host: host,
      port: 3306,
      userName: user,
      password: password,
      maxConnections: 10,
      databaseName: db,
      secure: false,
    );
  }

  Future<Map<String, String>> getTopBooks() async {
    MySQLConnectionPool conn = getConn();
    Map<String, String> topBooks = {};
    var r = await conn.execute("SELECT book_id, book_title FROM books;");
    for (final row in r.rows) {
      topBooks[row.typedColAt(0)] = row.typedColAt(1);
    }
    await conn.close();
    return topBooks;
  }

  Future<List<String>> getGenres() async {
    MySQLConnectionPool conn = getConn();
    List<String> genres = [];
    var r = await conn.execute("SELECT genre_desc FROM genres;");
    for (final row in r.rows) {
      genres.add(row.typedColAt(0));
    }
    await conn.close();
    return genres;
  }

  Future<List<String>> getDept() async {
    MySQLConnectionPool conn = getConn();
    List<String> dept = [];
    var r = await conn.execute("SELECT dept_name FROM dept;");
    for (final row in r.rows) {
      dept.add(row.typedColAt(0));
    }
    await conn.close();
    return dept;
  }

  Future<List<String>> getBookInfo(String bookId) async {
    MySQLConnectionPool conn = getConn();
    List<String> bookInfo = [];
    var r = await conn.execute("SELECT book_title, book_author, book_summary, book_genre, book_dept FROM books WHERE book_id = $bookId");
    for (final row in r.rows) {
      bookInfo.add(row.typedColAt(0));
      bookInfo.add(row.typedColAt(1));
      bookInfo.add(row.typedColAt(2));

      if (row.typedColAt(4)=="") {
        bookInfo.add(row.typedColAt(3));
      } else {
        bookInfo.add(row.typedColAt(4));
      }
    }
    await conn.close();
    return bookInfo;
  }
  /*
  FutureOr<List<String>> _getDept() async {
    List<String> dept = [];
    var conn = await MySqlConnection.connect(
        ConnectionSettings(
            host: host,
            port: port,
            user: user,
            db: db
        )
    );
    var result = await conn.query('select dept_name from dept');
    for (var row in result) {
      dept.add(row[0]);
    }
    return dept;
  }

  Future<MySqlConnection> getConn() async {
    var conn = await MySqlConnection.connect(
        ConnectionSettings(
          host: host,
          port: port,
          user: user,
          db: db
        )
    );

    return conn;
  }

   */
}