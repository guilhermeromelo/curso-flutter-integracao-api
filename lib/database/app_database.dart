import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'dao/contact_dao.dart';

Future<Database> getDatabase() async {
  final String path = join(await getDatabasesPath(), 'bytebank.db');
  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute(ContactDao.tableSql);
    },
    version: 1,
  );
}

void createDatabase(){
    getDatabasesPath().then((dbPath) {
      final String path = join(dbPath, 'bytebank.db');
      openDatabase(path, onCreate: (db, version){
        db.execute('CREATE TABLE contacts('
            'id INTEGER PRIMARY KEY, '
            'name TEXT, '
            'account_number INTEGER)');
      }, version: 1);
    });
  }