import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_testapp/features/todo_list/data/models/todo_model.dart';
import 'package:todo_testapp/features/todo_list/domain/usecase/todo_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'refresh_todos_state.dart';

@lazySingleton
class RefreshTodosCubit extends Cubit<RefreshTodosState> {
  RefreshTodosCubit(this.todoUsecase) : super(RefreshTodosStateInitial());

  final TodoUsecase todoUsecase;

  Future<void> refreshAllTodos() async{
    emit(RefreshTodosStateLoading());
    final failureOrTodosEither = await todoUsecase.loadAllTodo();
    final todos = failureOrTodosEither.toOption().toNullable();

    if(todos == null){
      emit(RefreshTodosStateError());
      return;
    }
    if(todos.isEmpty){
      emit(RefreshTodosStateEmpty());
      return;
    }
      emit(RefreshTodosStateLoaded(todos));

  }
}
