import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_testapp/core/injectable/injectable.dart';
import 'package:todo_testapp/core/my_colors/my_colors.dart';
import 'package:todo_testapp/core/my_text_styles/my_text_styles.dart';
import 'package:todo_testapp/features/todo_list/data/models/todo_model.dart';
import 'package:todo_testapp/features/todo_list/presentation/controller/change_todo_controller.dart';
import 'package:todo_testapp/features/todo_list/presentation/controller/check_todo_controller.dart';
import 'package:todo_testapp/features/todo_list/presentation/controller/delete_todo_controller.dart';
import 'package:todo_testapp/features/todo_list/presentation/cubit/checkbox_cubit/checkbox_cubit.dart';

class TodoTileWidget extends StatelessWidget {
  TodoTileWidget({super.key, required this.todoModel});

  final TodoModel todoModel;
  final deleteTodoController = getIt<DeleteTodoController>();
  final checkboxCubit = getIt<CheckboxCubit>();
  final checkTodoController = getIt<CheckTodoController>();
  final textEditingController = TextEditingController();
  final changeTodoController = getIt<ChangeTodoController>();

  @override
  Widget build(BuildContext context) {
    checkboxCubit.initCheckbox(todoModel.isDone);
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: (context) {
                deleteTodoController.deleteTodo(todoModel);
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
            onTap: () {
              textEditingController.text = todoModel.text;
              showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  content: TextField(
                    controller: textEditingController,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    decoration: InputDecoration(
                      hintText: 'Enter your todo',
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: MyColors.grey2Color),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: MyColors.buttonAddColor,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        changeTodoController.changeTodo(todoModel, textEditingController.text);
                        Navigator.pop(context);
                      },
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
                    GestureDetector(
                      onTap: () {
                        checkTodoController.checkTodo(todoModel);
                      },
                      child: BlocBuilder<CheckboxCubit, CheckboxState>(
                        bloc: checkboxCubit,
                        builder: (context, state) {
                          if (state is CheckboxIsDone) {
                            return Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: MyColors.greenColor,
                              ),
                              child: const Icon(
                                Icons.check,
                                color: MyColors.whiteColor,
                              ),
                            );
                          }
                          if (state is CheckboxIsNotDone) {
                            return Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.white,
                                  border: Border.all(
                                      color: MyColors.grey2Color, width: 2)),
                            );
                          } else {
                            return Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: MyColors.redColor,
                              ),
                            );
                          }
                        },
                      ),
                    ),
                    const SizedBox(width: 10),
                    SizedBox(
                      width: 250,
                      child: Text(
                        todoModel.text,
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
                    const Icon(
                      Icons.delete,
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
