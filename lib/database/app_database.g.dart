// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $PrefEntityTable extends PrefEntity
    with TableInfo<$PrefEntityTable, PrefEntityData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PrefEntityTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _pageNoMeta = const VerificationMeta('pageNo');
  @override
  late final GeneratedColumn<int> pageNo = GeneratedColumn<int>(
      'page_no', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _optIdMeta = const VerificationMeta('optId');
  @override
  late final GeneratedColumn<String> optId = GeneratedColumn<String>(
      'opt_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _subtitleMeta =
      const VerificationMeta('subtitle');
  @override
  late final GeneratedColumn<String> subtitle = GeneratedColumn<String>(
      'subtitle', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  static const VerificationMeta _isSelectedMeta =
      const VerificationMeta('isSelected');
  @override
  late final GeneratedColumn<bool> isSelected = GeneratedColumn<bool>(
      'is_selected', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_selected" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _isOwnProductMeta =
      const VerificationMeta('isOwnProduct');
  @override
  late final GeneratedColumn<bool> isOwnProduct = GeneratedColumn<bool>(
      'is_own_product', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_own_product" IN (0, 1))'),
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns =>
      [pageNo, optId, title, subtitle, isSelected, isOwnProduct];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'pref_entity';
  @override
  VerificationContext validateIntegrity(Insertable<PrefEntityData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('page_no')) {
      context.handle(_pageNoMeta,
          pageNo.isAcceptableOrUnknown(data['page_no']!, _pageNoMeta));
    } else if (isInserting) {
      context.missing(_pageNoMeta);
    }
    if (data.containsKey('opt_id')) {
      context.handle(
          _optIdMeta, optId.isAcceptableOrUnknown(data['opt_id']!, _optIdMeta));
    } else if (isInserting) {
      context.missing(_optIdMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('subtitle')) {
      context.handle(_subtitleMeta,
          subtitle.isAcceptableOrUnknown(data['subtitle']!, _subtitleMeta));
    }
    if (data.containsKey('is_selected')) {
      context.handle(
          _isSelectedMeta,
          isSelected.isAcceptableOrUnknown(
              data['is_selected']!, _isSelectedMeta));
    }
    if (data.containsKey('is_own_product')) {
      context.handle(
          _isOwnProductMeta,
          isOwnProduct.isAcceptableOrUnknown(
              data['is_own_product']!, _isOwnProductMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {optId};
  @override
  PrefEntityData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PrefEntityData(
      pageNo: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}page_no'])!,
      optId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}opt_id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      subtitle: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}subtitle'])!,
      isSelected: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_selected'])!,
      isOwnProduct: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_own_product'])!,
    );
  }

  @override
  $PrefEntityTable createAlias(String alias) {
    return $PrefEntityTable(attachedDatabase, alias);
  }
}

class PrefEntityData extends DataClass implements Insertable<PrefEntityData> {
  final int pageNo;
  final String optId;
  final String title;
  final String subtitle;
  final bool isSelected;
  final bool isOwnProduct;
  const PrefEntityData(
      {required this.pageNo,
      required this.optId,
      required this.title,
      required this.subtitle,
      required this.isSelected,
      required this.isOwnProduct});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['page_no'] = Variable<int>(pageNo);
    map['opt_id'] = Variable<String>(optId);
    map['title'] = Variable<String>(title);
    map['subtitle'] = Variable<String>(subtitle);
    map['is_selected'] = Variable<bool>(isSelected);
    map['is_own_product'] = Variable<bool>(isOwnProduct);
    return map;
  }

  PrefEntityCompanion toCompanion(bool nullToAbsent) {
    return PrefEntityCompanion(
      pageNo: Value(pageNo),
      optId: Value(optId),
      title: Value(title),
      subtitle: Value(subtitle),
      isSelected: Value(isSelected),
      isOwnProduct: Value(isOwnProduct),
    );
  }

  factory PrefEntityData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PrefEntityData(
      pageNo: serializer.fromJson<int>(json['pageNo']),
      optId: serializer.fromJson<String>(json['optId']),
      title: serializer.fromJson<String>(json['title']),
      subtitle: serializer.fromJson<String>(json['subtitle']),
      isSelected: serializer.fromJson<bool>(json['isSelected']),
      isOwnProduct: serializer.fromJson<bool>(json['isOwnProduct']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'pageNo': serializer.toJson<int>(pageNo),
      'optId': serializer.toJson<String>(optId),
      'title': serializer.toJson<String>(title),
      'subtitle': serializer.toJson<String>(subtitle),
      'isSelected': serializer.toJson<bool>(isSelected),
      'isOwnProduct': serializer.toJson<bool>(isOwnProduct),
    };
  }

  PrefEntityData copyWith(
          {int? pageNo,
          String? optId,
          String? title,
          String? subtitle,
          bool? isSelected,
          bool? isOwnProduct}) =>
      PrefEntityData(
        pageNo: pageNo ?? this.pageNo,
        optId: optId ?? this.optId,
        title: title ?? this.title,
        subtitle: subtitle ?? this.subtitle,
        isSelected: isSelected ?? this.isSelected,
        isOwnProduct: isOwnProduct ?? this.isOwnProduct,
      );
  PrefEntityData copyWithCompanion(PrefEntityCompanion data) {
    return PrefEntityData(
      pageNo: data.pageNo.present ? data.pageNo.value : this.pageNo,
      optId: data.optId.present ? data.optId.value : this.optId,
      title: data.title.present ? data.title.value : this.title,
      subtitle: data.subtitle.present ? data.subtitle.value : this.subtitle,
      isSelected:
          data.isSelected.present ? data.isSelected.value : this.isSelected,
      isOwnProduct: data.isOwnProduct.present
          ? data.isOwnProduct.value
          : this.isOwnProduct,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PrefEntityData(')
          ..write('pageNo: $pageNo, ')
          ..write('optId: $optId, ')
          ..write('title: $title, ')
          ..write('subtitle: $subtitle, ')
          ..write('isSelected: $isSelected, ')
          ..write('isOwnProduct: $isOwnProduct')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(pageNo, optId, title, subtitle, isSelected, isOwnProduct);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PrefEntityData &&
          other.pageNo == this.pageNo &&
          other.optId == this.optId &&
          other.title == this.title &&
          other.subtitle == this.subtitle &&
          other.isSelected == this.isSelected &&
          other.isOwnProduct == this.isOwnProduct);
}

class PrefEntityCompanion extends UpdateCompanion<PrefEntityData> {
  final Value<int> pageNo;
  final Value<String> optId;
  final Value<String> title;
  final Value<String> subtitle;
  final Value<bool> isSelected;
  final Value<bool> isOwnProduct;
  final Value<int> rowid;
  const PrefEntityCompanion({
    this.pageNo = const Value.absent(),
    this.optId = const Value.absent(),
    this.title = const Value.absent(),
    this.subtitle = const Value.absent(),
    this.isSelected = const Value.absent(),
    this.isOwnProduct = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PrefEntityCompanion.insert({
    required int pageNo,
    required String optId,
    required String title,
    this.subtitle = const Value.absent(),
    this.isSelected = const Value.absent(),
    this.isOwnProduct = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : pageNo = Value(pageNo),
        optId = Value(optId),
        title = Value(title);
  static Insertable<PrefEntityData> custom({
    Expression<int>? pageNo,
    Expression<String>? optId,
    Expression<String>? title,
    Expression<String>? subtitle,
    Expression<bool>? isSelected,
    Expression<bool>? isOwnProduct,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (pageNo != null) 'page_no': pageNo,
      if (optId != null) 'opt_id': optId,
      if (title != null) 'title': title,
      if (subtitle != null) 'subtitle': subtitle,
      if (isSelected != null) 'is_selected': isSelected,
      if (isOwnProduct != null) 'is_own_product': isOwnProduct,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PrefEntityCompanion copyWith(
      {Value<int>? pageNo,
      Value<String>? optId,
      Value<String>? title,
      Value<String>? subtitle,
      Value<bool>? isSelected,
      Value<bool>? isOwnProduct,
      Value<int>? rowid}) {
    return PrefEntityCompanion(
      pageNo: pageNo ?? this.pageNo,
      optId: optId ?? this.optId,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      isSelected: isSelected ?? this.isSelected,
      isOwnProduct: isOwnProduct ?? this.isOwnProduct,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (pageNo.present) {
      map['page_no'] = Variable<int>(pageNo.value);
    }
    if (optId.present) {
      map['opt_id'] = Variable<String>(optId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (subtitle.present) {
      map['subtitle'] = Variable<String>(subtitle.value);
    }
    if (isSelected.present) {
      map['is_selected'] = Variable<bool>(isSelected.value);
    }
    if (isOwnProduct.present) {
      map['is_own_product'] = Variable<bool>(isOwnProduct.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PrefEntityCompanion(')
          ..write('pageNo: $pageNo, ')
          ..write('optId: $optId, ')
          ..write('title: $title, ')
          ..write('subtitle: $subtitle, ')
          ..write('isSelected: $isSelected, ')
          ..write('isOwnProduct: $isOwnProduct, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $PrefEntityTable prefEntity = $PrefEntityTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [prefEntity];
}

typedef $$PrefEntityTableCreateCompanionBuilder = PrefEntityCompanion Function({
  required int pageNo,
  required String optId,
  required String title,
  Value<String> subtitle,
  Value<bool> isSelected,
  Value<bool> isOwnProduct,
  Value<int> rowid,
});
typedef $$PrefEntityTableUpdateCompanionBuilder = PrefEntityCompanion Function({
  Value<int> pageNo,
  Value<String> optId,
  Value<String> title,
  Value<String> subtitle,
  Value<bool> isSelected,
  Value<bool> isOwnProduct,
  Value<int> rowid,
});

class $$PrefEntityTableFilterComposer
    extends Composer<_$AppDatabase, $PrefEntityTable> {
  $$PrefEntityTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get pageNo => $composableBuilder(
      column: $table.pageNo, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get optId => $composableBuilder(
      column: $table.optId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get subtitle => $composableBuilder(
      column: $table.subtitle, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isSelected => $composableBuilder(
      column: $table.isSelected, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isOwnProduct => $composableBuilder(
      column: $table.isOwnProduct, builder: (column) => ColumnFilters(column));
}

class $$PrefEntityTableOrderingComposer
    extends Composer<_$AppDatabase, $PrefEntityTable> {
  $$PrefEntityTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get pageNo => $composableBuilder(
      column: $table.pageNo, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get optId => $composableBuilder(
      column: $table.optId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get subtitle => $composableBuilder(
      column: $table.subtitle, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isSelected => $composableBuilder(
      column: $table.isSelected, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isOwnProduct => $composableBuilder(
      column: $table.isOwnProduct,
      builder: (column) => ColumnOrderings(column));
}

class $$PrefEntityTableAnnotationComposer
    extends Composer<_$AppDatabase, $PrefEntityTable> {
  $$PrefEntityTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get pageNo =>
      $composableBuilder(column: $table.pageNo, builder: (column) => column);

  GeneratedColumn<String> get optId =>
      $composableBuilder(column: $table.optId, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get subtitle =>
      $composableBuilder(column: $table.subtitle, builder: (column) => column);

  GeneratedColumn<bool> get isSelected => $composableBuilder(
      column: $table.isSelected, builder: (column) => column);

  GeneratedColumn<bool> get isOwnProduct => $composableBuilder(
      column: $table.isOwnProduct, builder: (column) => column);
}

class $$PrefEntityTableTableManager extends RootTableManager<
    _$AppDatabase,
    $PrefEntityTable,
    PrefEntityData,
    $$PrefEntityTableFilterComposer,
    $$PrefEntityTableOrderingComposer,
    $$PrefEntityTableAnnotationComposer,
    $$PrefEntityTableCreateCompanionBuilder,
    $$PrefEntityTableUpdateCompanionBuilder,
    (
      PrefEntityData,
      BaseReferences<_$AppDatabase, $PrefEntityTable, PrefEntityData>
    ),
    PrefEntityData,
    PrefetchHooks Function()> {
  $$PrefEntityTableTableManager(_$AppDatabase db, $PrefEntityTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PrefEntityTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PrefEntityTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PrefEntityTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> pageNo = const Value.absent(),
            Value<String> optId = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String> subtitle = const Value.absent(),
            Value<bool> isSelected = const Value.absent(),
            Value<bool> isOwnProduct = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              PrefEntityCompanion(
            pageNo: pageNo,
            optId: optId,
            title: title,
            subtitle: subtitle,
            isSelected: isSelected,
            isOwnProduct: isOwnProduct,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required int pageNo,
            required String optId,
            required String title,
            Value<String> subtitle = const Value.absent(),
            Value<bool> isSelected = const Value.absent(),
            Value<bool> isOwnProduct = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              PrefEntityCompanion.insert(
            pageNo: pageNo,
            optId: optId,
            title: title,
            subtitle: subtitle,
            isSelected: isSelected,
            isOwnProduct: isOwnProduct,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$PrefEntityTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $PrefEntityTable,
    PrefEntityData,
    $$PrefEntityTableFilterComposer,
    $$PrefEntityTableOrderingComposer,
    $$PrefEntityTableAnnotationComposer,
    $$PrefEntityTableCreateCompanionBuilder,
    $$PrefEntityTableUpdateCompanionBuilder,
    (
      PrefEntityData,
      BaseReferences<_$AppDatabase, $PrefEntityTable, PrefEntityData>
    ),
    PrefEntityData,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$PrefEntityTableTableManager get prefEntity =>
      $$PrefEntityTableTableManager(_db, _db.prefEntity);
}
