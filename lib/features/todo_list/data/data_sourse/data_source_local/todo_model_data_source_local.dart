import 'package:todo_testapp/features/todo_list/data/models/todo_model.dart';

abstract class TodoModelDataSourceLocal{
  Future<void> saveModelToBd(String content);
  Future<List<TodoModel>> loadAllTodo();
  Future<void> changeTodo(int id, String content, bool isDone);
  Future<void> deleteTodo(int id, String content, bool isDone);

}