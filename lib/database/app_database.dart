import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:getx_demo/database/tables/pref_entity.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'dart:io';

part 'app_database.g.dart'; // This file will be generated

@DriftDatabase(tables: [PrefEntity]) // Include defined tables here
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1; // Increment this when you change your schema
}

/// Creates a lazy database connection
LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'notes.db'));
    return NativeDatabase.createInBackground(file, logStatements: false,
        setup: (db) {
      db.execute('PRAGMA journal_mode=WAL');
      db.execute('PRAGMA synchronous=NORMAL');
    });
  });
}
