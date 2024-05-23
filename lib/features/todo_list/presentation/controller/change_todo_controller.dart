import 'package:injectable/injectable.dart';
import 'package:todo_testapp/features/todo_list/data/models/todo_model.dart';
import 'package:todo_testapp/features/todo_list/domain/usecase/todo_usecase.dart';
import 'package:todo_testapp/features/todo_list/presentation/cubit/refresh_todos_cubit.dart';

@lazySingleton
class ChangeTodoController{
  ChangeTodoController(this.todoUsecase, this.refreshTodosCubit);

  final TodoUsecase todoUsecase;
  final RefreshTodosCubit refreshTodosCubit;

  Future<void> changeTodo(TodoModel todoModel, String text) async{
    final trimeText = text.trim();
    final myTodo = TodoModel(
        id: todoModel.id,
        text: trimeText,
        isDone: todoModel.isDone,
    );
    final response = await todoUsecase.changeTodo(myTodo);
    final checkEnum = response.toOption().toNullable();
    if(checkEnum == null){
      print('dfdfdf');
    }
    print(checkEnum);
    //TODO сделать обратную связь с чекРеспонс
    refreshTodosCubit.refreshAllTodos();
  }
}