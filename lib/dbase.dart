import 'dart:async';
import 'package:mysql_client/mysql_client.dart';

class dbase {
  static String host = '127.0.0.1',
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

  Future<List<String>> getTopBooks() async {
    MySQLConnectionPool conn = getConn();
    List<String> topBooks = [];
    var r = await conn.execute("SELECT book_title FROM books;");
    for (final row in r.rows) {
      topBooks.add(row.typedColAt(0));
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