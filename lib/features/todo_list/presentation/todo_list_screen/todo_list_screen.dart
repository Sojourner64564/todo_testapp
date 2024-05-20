import 'package:flutter/material.dart';
import 'package:todo_testapp/core/my_colors/my_colors.dart';
import 'package:todo_testapp/core/my_text_styles/my_text_styles.dart';
import 'package:todo_testapp/features/todo_list/presentation/todo_list_screen/todo_list_page.dart';

class TodoListScreen extends StatelessWidget {
  const TodoListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: MyColors.backgroundColor,
        title: const Text(
          'TODO',
          style: MyTextStyles.title1,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
      ),
      body: const TodoListPage(),
    );
  }
}
