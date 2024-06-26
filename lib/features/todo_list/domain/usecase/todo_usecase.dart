import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_testapp/core/enums/change_response.dart';
import 'package:todo_testapp/core/enums/checkbox_response.dart';
import 'package:todo_testapp/core/enums/deleted_response.dart';
import 'package:todo_testapp/core/enums/save_response.dart';
import 'package:todo_testapp/core/error/failure.dart';
import 'package:todo_testapp/features/todo_list/data/models/todo_model.dart';
import 'package:todo_testapp/features/todo_list/domain/repository/todo_repository.dart';

@lazySingleton
class TodoUsecase implements TodoRepository{
  TodoUsecase(this.todoRepository);

  final TodoRepository todoRepository;

  @override
  Future<Either<Failure, DeletedResponse>> deleteTodo(TodoModel todoModel) async{
    return await todoRepository.deleteTodo(todoModel);
  }

  @override
  Future<Either<Failure, ChangeResponse>> changeTodo(TodoModel todoModel) async{
    return await todoRepository.changeTodo(todoModel);
  }

  @override
  Future<Either<Failure, List<TodoModel>>> loadAllTodo() async{
    return await todoRepository.loadAllTodo();
  }

  @override
  Future<Either<Failure, SaveResponse>> saveModelToBd(String content) async{
    return await todoRepository.saveModelToBd(content);
  }

  @override
  Future<Either<Failure, CheckboxResponse>> checkboxTodo(TodoModel todoModel) async{
    return await todoRepository.checkboxTodo(todoModel);
  }

}