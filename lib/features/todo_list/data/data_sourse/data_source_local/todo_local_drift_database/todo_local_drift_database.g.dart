// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_local_drift_database.dart';

// ignore_for_file: type=lint
class $TodoItemsTable extends TodoItems
    with TableInfo<$TodoItemsTable, TodoItemsTable> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TodoItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _contentMeta =
      const VerificationMeta('content');
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
      'content', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _isDoneMeta = const VerificationMeta('isDone');
  @override
  late final GeneratedColumn<bool> isDone = GeneratedColumn<bool>(
      'is_done', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_done" IN (0, 1))'));
  @override
  List<GeneratedColumn> get $columns => [id, content, isDone];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'todo_items';
  @override
  VerificationContext validateIntegrity(Insertable<TodoItemsTable> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('content')) {
      context.handle(_contentMeta,
          content.isAcceptableOrUnknown(data['content']!, _contentMeta));
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    if (data.containsKey('is_done')) {
      context.handle(_isDoneMeta,
          isDone.isAcceptableOrUnknown(data['is_done']!, _isDoneMeta));
    } else if (isInserting) {
      context.missing(_isDoneMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TodoItemsTable map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TodoItemsTable(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      content: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}content'])!,
      isDone: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_done'])!,
    );
  }

  @override
  $TodoItemsTable createAlias(String alias) {
    return $TodoItemsTable(attachedDatabase, alias);
  }
}

class TodoItemsTable extends DataClass implements Insertable<TodoItemsTable> {
  final int id;
  final String content;
  final bool isDone;
  const TodoItemsTable(
      {required this.id, required this.content, required this.isDone});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['content'] = Variable<String>(content);
    map['is_done'] = Variable<bool>(isDone);
    return map;
  }

  TodoItemsCompanion toCompanion(bool nullToAbsent) {
    return TodoItemsCompanion(
      id: Value(id),
      content: Value(content),
      isDone: Value(isDone),
    );
  }

  factory TodoItemsTable.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TodoItemsTable(
      id: serializer.fromJson<int>(json['id']),
      content: serializer.fromJson<String>(json['content']),
      isDone: serializer.fromJson<bool>(json['isDone']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'content': serializer.toJson<String>(content),
      'isDone': serializer.toJson<bool>(isDone),
    };
  }

  TodoItemsTable copyWith({int? id, String? content, bool? isDone}) =>
      TodoItemsTable(
        id: id ?? this.id,
        content: content ?? this.content,
        isDone: isDone ?? this.isDone,
      );
  @override
  String toString() {
    return (StringBuffer('TodoItemsTable(')
          ..write('id: $id, ')
          ..write('content: $content, ')
          ..write('isDone: $isDone')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, content, isDone);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TodoItemsTable &&
          other.id == this.id &&
          other.content == this.content &&
          other.isDone == this.isDone);
}

class TodoItemsCompanion extends UpdateCompanion<TodoItemsTable> {
  final Value<int> id;
  final Value<String> content;
  final Value<bool> isDone;
  const TodoItemsCompanion({
    this.id = const Value.absent(),
    this.content = const Value.absent(),
    this.isDone = const Value.absent(),
  });
  TodoItemsCompanion.insert({
    this.id = const Value.absent(),
    required String content,
    required bool isDone,
  })  : content = Value(content),
        isDone = Value(isDone);
  static Insertable<TodoItemsTable> custom({
    Expression<int>? id,
    Expression<String>? content,
    Expression<bool>? isDone,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (content != null) 'content': content,
      if (isDone != null) 'is_done': isDone,
    });
  }

  TodoItemsCompanion copyWith(
      {Value<int>? id, Value<String>? content, Value<bool>? isDone}) {
    return TodoItemsCompanion(
      id: id ?? this.id,
      content: content ?? this.content,
      isDone: isDone ?? this.isDone,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (isDone.present) {
      map['is_done'] = Variable<bool>(isDone.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TodoItemsCompanion(')
          ..write('id: $id, ')
          ..write('content: $content, ')
          ..write('isDone: $isDone')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  _$AppDatabaseManager get managers => _$AppDatabaseManager(this);
  late final $TodoItemsTable todoItems = $TodoItemsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [todoItems];
}

typedef $$TodoItemsTableInsertCompanionBuilder = TodoItemsCompanion Function({
  Value<int> id,
  required String content,
  required bool isDone,
});
typedef $$TodoItemsTableUpdateCompanionBuilder = TodoItemsCompanion Function({
  Value<int> id,
  Value<String> content,
  Value<bool> isDone,
});

class $$TodoItemsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TodoItemsTable,
    TodoItemsTable,
    $$TodoItemsTableFilterComposer,
    $$TodoItemsTableOrderingComposer,
    $$TodoItemsTableProcessedTableManager,
    $$TodoItemsTableInsertCompanionBuilder,
    $$TodoItemsTableUpdateCompanionBuilder> {
  $$TodoItemsTableTableManager(_$AppDatabase db, $TodoItemsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$TodoItemsTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$TodoItemsTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$TodoItemsTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<String> content = const Value.absent(),
            Value<bool> isDone = const Value.absent(),
          }) =>
              TodoItemsCompanion(
            id: id,
            content: content,
            isDone: isDone,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            required String content,
            required bool isDone,
          }) =>
              TodoItemsCompanion.insert(
            id: id,
            content: content,
            isDone: isDone,
          ),
        ));
}

class $$TodoItemsTableProcessedTableManager extends ProcessedTableManager<
    _$AppDatabase,
    $TodoItemsTable,
    TodoItemsTable,
    $$TodoItemsTableFilterComposer,
    $$TodoItemsTableOrderingComposer,
    $$TodoItemsTableProcessedTableManager,
    $$TodoItemsTableInsertCompanionBuilder,
    $$TodoItemsTableUpdateCompanionBuilder> {
  $$TodoItemsTableProcessedTableManager(super.$state);
}

class $$TodoItemsTableFilterComposer
    extends FilterComposer<_$AppDatabase, $TodoItemsTable> {
  $$TodoItemsTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get content => $state.composableBuilder(
      column: $state.table.content,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get isDone => $state.composableBuilder(
      column: $state.table.isDone,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$TodoItemsTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $TodoItemsTable> {
  $$TodoItemsTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get content => $state.composableBuilder(
      column: $state.table.content,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get isDone => $state.composableBuilder(
      column: $state.table.isDone,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class _$AppDatabaseManager {
  final _$AppDatabase _db;
  _$AppDatabaseManager(this._db);
  $$TodoItemsTableTableManager get todoItems =>
      $$TodoItemsTableTableManager(_db, _db.todoItems);
}
