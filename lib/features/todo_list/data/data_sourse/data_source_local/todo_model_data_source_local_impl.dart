import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_testapp/core/injectable/injectable.dart';
import 'package:todo_testapp/features/todo_list/data/data_sourse/data_source_local/todo_local_drift_database/todo_local_drift_database.dart';
import 'package:todo_testapp/features/todo_list/data/data_sourse/data_source_local/todo_model_data_source_local.dart';
import 'package:todo_testapp/features/todo_list/data/models/todo_model.dart';

@LazySingleton(as: TodoModelDataSourceLocal)
class TodoModelDataSourceLocalImpl implements TodoModelDataSourceLocal {
  @override
  Future<void> deleteTodo(int id, String content, bool isDone) async {
    final database = getIt<AppDatabase>();
    database.delete(database.todoItems).delete(
          TodoItemsCompanion(
            id: Value(id),
            content: Value(content),
            isDone: Value(isDone),
          ),
        );
  }

  @override
  Future<void> changeTodo(int id, String content, bool isDone) async {
    final database = getIt<AppDatabase>();
    await database.update(database.todoItems).replace(
          TodoItemsCompanion(
            id: Value(id),
            content: Value(content),
            isDone: Value(isDone),
          ),
        );
  }

  @override
  Future<List<TodoModel>> loadAllTodo() async {
    final database = getIt<AppDatabase>();
    final dbTodos = await database.select(database.todoItems).get();
    List<TodoModel> todoList = [];
    for (final todoItemsElement in dbTodos) {
      todoList.add(
        TodoModel(
          id: todoItemsElement.id,
          text: todoItemsElement.content,
          isDone: todoItemsElement.isDone,
        ),
      );
    }
    return todoList;
  }

  @override
  Future<void> saveModelToBd(String content) async {
    final database = getIt<AppDatabase>();
    final dbTodos = database.into(database.todoItems);
    dbTodos.insert(
      TodoItemsCompanion.insert(
        content: content,
        isDone: false,
      ),
    );
  }
}
