import 'package:todo_testapp/features/todo_list/data/models/todo_model.dart';

abstract class TodoModelDataSourceLocal{
  Future<void> saveModelToBd(String content);
  Future<List<TodoModel>> loadAllTodo();
  Future<List<TodoModel>> doneCheckbox(int id);
  Future<List<TodoModel>> deleteTodo(int id);

}