import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_testapp/core/enums/save_response.dart';
import 'package:todo_testapp/core/error/failure.dart';
import 'package:todo_testapp/features/todo_list/data/data_sourse/data_source_local/todo_model_data_source_local.dart';
import 'package:todo_testapp/features/todo_list/data/models/todo_model.dart';
import 'package:todo_testapp/features/todo_list/domain/repository/todo_repository.dart';

@LazySingleton(as: TodoRepository)
class TodoRepositoryImpl implements TodoRepository{
  TodoRepositoryImpl(this.todoModelDataSourceLocal);

  final TodoModelDataSourceLocal todoModelDataSourceLocal;

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
    final response = await todoModelDataSourceLocal.loadAllTodo();


    try{
      final response = await todoModelDataSourceLocal.loadAllTodo();
      return Right(response);
    }catch(e){
      return Left(DatabaseFailure());
    }
  }

  @override
  Future<Either<Failure, SaveResponse>> saveModelToBd(String content) async{
    try{
      await todoModelDataSourceLocal.saveModelToBd(content);
      return const Right(SaveResponse.saved);
    }catch(e){
      return Left(DatabaseFailure());
    }
  }
  
}