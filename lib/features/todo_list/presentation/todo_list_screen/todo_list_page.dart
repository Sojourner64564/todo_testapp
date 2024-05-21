import 'package:flutter/material.dart';
import 'package:todo_testapp/core/injectable/injectable.dart';
import 'package:todo_testapp/features/todo_list/presentation/cubit/refresh_todos_cubit.dart';
import 'package:todo_testapp/features/todo_list/presentation/todo_list_screen/widget/todo_tile_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoListPage extends StatelessWidget {
  TodoListPage({super.key});

  final refreshTodosCubit = getIt<RefreshTodosCubit>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: BlocBuilder<RefreshTodosCubit, RefreshTodosState>(
            bloc: refreshTodosCubit,
            builder: (context, state) {
              if(state is RefreshTodosStateInitial){

              }
              if(state is RefreshTodosStateLoading){

              }
              if(state is RefreshTodosStateLoaded){
                return ListView.builder(
                  itemCount: state.todoList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return TodoTileWidget(todoModel: state.todoList[index],);
                  },
                );
              }
              if(state is RefreshTodosStateEmpty){

              }
              if(state is RefreshTodosStateError){

              }else{

              }

            },
          ),
        ),
      ],
    );
  }

}