import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_testapp/core/enums/save_response.dart';
import 'package:todo_testapp/core/error/failure.dart';
import 'package:todo_testapp/features/todo_list/data/models/todo_model.dart';
import 'package:todo_testapp/features/todo_list/domain/repository/todo_repository.dart';

@lazySingleton
class TodoUsecase implements TodoRepository{
  TodoUsecase(this.todoRepository);

  final TodoRepository todoRepository;

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
  Future<Either<Failure, List<TodoModel>>> loadAllTodo() async{
    return await todoRepository.loadAllTodo();
  }

  @override
  Future<Either<Failure, SaveResponse>> saveModelToBd(String content) async{
    return await todoRepository.saveModelToBd(content);
  }

}