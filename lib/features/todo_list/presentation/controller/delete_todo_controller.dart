import 'package:injectable/injectable.dart';
import 'package:todo_testapp/features/todo_list/domain/usecase/todo_usecase.dart';
import 'package:todo_testapp/features/todo_list/presentation/cubit/refresh_todos_cubit.dart';

@lazySingleton
class DeleteTodoController{
  DeleteTodoController(this.todoUsecase, this.refreshTodosCubit);

  final TodoUsecase todoUsecase;
  final RefreshTodosCubit refreshTodosCubit;

  Future<void> deleteTodo(int id) async{
    final response = await todoUsecase.deleteTodo(id);
    //TODO сделать обратную связь с сейвРеспонс
    refreshTodosCubit.refreshAllTodos();
  }
}