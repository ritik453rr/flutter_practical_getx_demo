import 'package:drift/drift.dart';

class PrefEntity extends Table {
  IntColumn get pageNo => integer()();
  TextColumn get optId => text()();
  TextColumn get title => text()();
  TextColumn get subtitle => text().withDefault(const Constant(''))();
  BoolColumn get isSelected => boolean().withDefault(const Constant(false))();
  BoolColumn get isOwnProduct => boolean().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {optId};
}
