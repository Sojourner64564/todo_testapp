import 'package:injectable/injectable.dart';
import 'package:todo_testapp/features/todo_list/domain/usecase/todo_usecase.dart';
import 'package:todo_testapp/features/todo_list/presentation/cubit/refresh_todos_cubit.dart';

@lazySingleton
class SaveTodoController{
  SaveTodoController(this.todoUsecase, this.refreshTodosCubit);

  final TodoUsecase todoUsecase;
  final RefreshTodosCubit refreshTodosCubit;

  Future<void> saveTodo(String content) async{
    final response = await todoUsecase.saveModelToBd(content);
    //TODO сделать обратную связь с сейвРеспонс
    refreshTodosCubit.refreshAllTodos();
  }
}