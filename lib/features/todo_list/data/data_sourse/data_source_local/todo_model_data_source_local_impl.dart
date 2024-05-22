import 'package:injectable/injectable.dart';
import 'package:todo_testapp/core/injectable/injectable.dart';
import 'package:todo_testapp/features/todo_list/data/data_sourse/data_source_local/todo_local_drift_database/todo_local_drift_database.dart';
import 'package:todo_testapp/features/todo_list/data/data_sourse/data_source_local/todo_model_data_source_local.dart';
import 'package:todo_testapp/features/todo_list/data/models/todo_model.dart';

@LazySingleton(as: TodoModelDataSourceLocal)
class TodoModelDataSourceLocalImpl implements TodoModelDataSourceLocal {
  @override
  Future<List<TodoModel>> deleteTodo(int id) {
    // TODO: implement deleteTodo
    throw UnimplementedError();
  }

  @override
  Future<List<TodoModel>> doneCheckbox(int id) {
    // TODO: implement doneCheckbox
    throw UnimplementedError();
  }

  @override
  Future<List<TodoModel>> loadAllTodo() async{
    print('-----------------------1');
    final database = getIt<AppDatabase>();
    print('-----------------------2');
    final dbTodos = await database.select(database.todoItems).get();
    print('-----------------------3');
    List<TodoModel> todoList = [];
    print('-----------------------4');
    for(final todoItemsElement in dbTodos){
      print('-----------------------ROtatin');
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
