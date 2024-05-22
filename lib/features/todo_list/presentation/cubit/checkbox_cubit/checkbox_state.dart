part of 'checkbox_cubit.dart';

@immutable
abstract class CheckboxState {}

class CheckboxIsNotDone extends CheckboxState {}
class CheckboxIsDone extends CheckboxState {}
class CheckboxError extends CheckboxState {}
