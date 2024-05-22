import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'checkbox_state.dart';

@injectable
class CheckboxCubit extends Cubit<CheckboxState> {
  CheckboxCubit() : super(CheckboxIsNotDone());

  Future<void> initCheckbox(bool isDone) async{
    if(isDone){
      emit(CheckboxIsDone());
    }
    if(!isDone){
      emit(CheckboxIsNotDone());
    }
  }
}
