import 'package:flutter/material.dart';
import 'package:todo_testapp/core/injectable/injectable.dart';
import 'package:todo_testapp/core/my_text_styles/my_text_styles.dart';
import 'package:todo_testapp/features/todo_list/presentation/cubit/refresh_todos_cubit.dart';
import 'package:todo_testapp/features/todo_list/presentation/todo_list_screen/widget/todo_tile_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({super.key});

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  final refreshTodosCubit = getIt<RefreshTodosCubit>();

  @override
  void initState() {
    refreshTodosCubit.refreshAllTodos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: BlocBuilder<RefreshTodosCubit, RefreshTodosState>(
            bloc: refreshTodosCubit,
            builder: (context, state) {
              if(state is RefreshTodosStateInitial){
                return const Center(child: Text('Initial', style: MyTextStyles.title2,),);
              }
              if(state is RefreshTodosStateLoading){
                return const Center(child: Text('Loading', style: MyTextStyles.title2,),);
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
                return const Center(child: Text('Empty', style: MyTextStyles.title2,),);
              }
              if(state is RefreshTodosStateError){
                return const Center(child: Text('Database error', style: MyTextStyles.title2,),);
              }else{
                return const Center(child: Text('Unexpected Error', style: MyTextStyles.title2,),);
              }

            },
          ),
        ),
      ],
    );
  }
}