part of 'refresh_todos_cubit.dart';

@immutable
abstract class RefreshTodosState {}

class RefreshTodosStateInitial extends RefreshTodosState {}
class RefreshTodosStateLoading extends RefreshTodosState {}
class RefreshTodosStateLoaded extends RefreshTodosState {
  final List<TodoModel> todoList;

  RefreshTodosStateLoaded(this.todoList);
}
class RefreshTodosStateEmpty extends RefreshTodosState {}
class RefreshTodosStateError extends RefreshTodosState {}
