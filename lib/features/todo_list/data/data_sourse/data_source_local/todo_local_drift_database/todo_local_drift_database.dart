import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:injectable/injectable.dart';

part 'todo_local_drift_database.g.dart';

@DataClassName('TodoItemsTable')
class TodoItems extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get content => text().named('content')();
  BoolColumn get isDone => boolean().named('is_done')();

}

@lazySingleton
@DriftDatabase(tables: [TodoItems])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(NativeDatabase.memory());

  @override
  int get schemaVersion => 1;
}