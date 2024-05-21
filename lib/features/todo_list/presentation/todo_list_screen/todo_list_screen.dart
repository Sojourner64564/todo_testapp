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
        onPressed: () {
          showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              content: TextField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: InputDecoration(
                  hintText: 'Enter your todo',
                  enabledBorder: OutlineInputBorder(
                    borderSide:  const BorderSide(color: MyColors.grey2Color),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:  const BorderSide(
                      color: MyColors.buttonAddColor,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, 'OK'),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context, 'OK'),
                  child: const Text('Save'),
                ),
              ],
            ),
          );
        },
        backgroundColor: MyColors.buttonAddColor,
        child: const Icon(
          Icons.add,
          size: 30,
          color: MyColors.whiteColor,
        ),
      ),
      body: TodoListPage(),
    );
  }
}
