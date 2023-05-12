import 'dart:async';
import 'package:mysql1/mysql1.dart';

class dbase {
  static String host = '127.0.0.1',
                user = 'root',
                password = '',
                db = 'lspu_library';
  static int port = 3306;

  dbase();

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
}