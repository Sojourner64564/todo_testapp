
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_testapp/core/my_colors/my_colors.dart';
import 'package:todo_testapp/core/my_text_styles/my_text_styles.dart';
import 'package:todo_testapp/features/todo_list/data/models/todo_model.dart';

class TodoTileWidget extends StatelessWidget{
  const TodoTileWidget({super.key, required this.todoModel});
  final TodoModel todoModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: (context){

              },
              borderRadius: BorderRadius.circular(20),
              backgroundColor: MyColors.redColor,
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: GestureDetector(
            onTap: (){
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
                      child: const Text('Save'),
                    ),
                  ],
                ),
              );
            },
            child: Container(
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(
                color: MyColors.tileColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 10),
                    const SizedBox(
                      width: 250,
                      child: Text(
                        'fdgdfgdf',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: MyTextStyles.text1,
                      ),
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.arrow_back_ios,
                      size: 20,
                      color: MyColors.greyColor,
                    ),
                    const Icon(Icons.delete,
                      size: 20,
                      color: MyColors.greyColor,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

}