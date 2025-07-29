import 'package:drift/drift.dart';
import 'package:getx_demo/global.dart';
import 'package:getx_demo/database/app_database.dart';

class DatabaseQuries {
  /// insert of PrefEntityData into database
  static Future<void> insertPrefList(List<PrefEntityData> entries) async {
    await Global.database.batch((batch) {
      batch.insertAll(
        Global.database.prefEntity,
        mode: InsertMode.insertOrReplace,
        entries.map((e) => e.toCompanion(true)).toList(),
      );
    });
  }

  /// get list of PrefEntityData
  static Future<List<PrefEntityData>> getPrefList() async {
    return await Global.database.select(Global.database.prefEntity).get();
  }

  /// Delete all rows from PrefEntity table
  static Future<void> clearPrefTable() async {
    await Global.database.delete(Global.database.prefEntity).go();
  }

  /// Update PrefEntityData
  static Future<void> updatePrefEntity(PrefEntityData entry) async {
    await Global.database.update(Global.database.prefEntity).replace(entry);
  }

  static Stream<List<PrefEntityData>> watchAllPreferences() {
    return Global.database.select(Global.database.prefEntity).watch();
  }
}
