import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'dart:io';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:sqlite3/sqlite3.dart';
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';

part 'todo_local_drift_database.g.dart';

@DataClassName('TodoItemsTable')
class TodoItems extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get content => text()();
  BoolColumn get isDone => boolean()();

}

@lazySingleton
@DriftDatabase(tables: [TodoItems])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(NativeDatabase.memory());

  @override
  int get schemaVersion => 1;
}