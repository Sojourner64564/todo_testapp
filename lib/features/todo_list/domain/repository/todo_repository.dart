import 'package:todo_testapp/core/enums/checkbox_response.dart';
import 'package:todo_testapp/core/enums/deleted_response.dart';
import 'package:todo_testapp/core/enums/save_response.dart';
import 'package:todo_testapp/core/error/failure.dart';
import 'package:todo_testapp/features/todo_list/data/models/todo_model.dart';
import 'package:dartz/dartz.dart';

abstract class TodoRepository{
  Future<Either<Failure, SaveResponse>> saveModelToBd(String content);
  Future<Either<Failure, List<TodoModel>>> loadAllTodo();
  Future<Either<Failure, CheckboxResponse>> changeTodo(TodoModel todoModel);
  Future<Either<Failure, DeletedResponse>> deleteTodo(int id);
}
