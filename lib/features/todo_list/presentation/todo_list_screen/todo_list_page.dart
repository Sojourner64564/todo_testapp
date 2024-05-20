import 'package:flutter/material.dart';
import 'package:todo_testapp/core/my_colors/my_colors.dart';

class TodoListPage extends StatelessWidget{
  const TodoListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: 50,
            itemBuilder: (BuildContext context, int index) {
               return Padding(
                 padding: const EdgeInsets.fromLTRB(15, 0, 15, 20),
                 child: Container(
                   height: 100,
                   width: double.infinity,
                   decoration: BoxDecoration(
                     color: MyColors.tileColor,
                      borderRadius: BorderRadius.circular(20),
                   ),
                 ),
               );
            },
          ),
        ),
    ],
    );
  }

}