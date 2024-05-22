// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../features/todo_list/data/data_sourse/data_source_local/todo_local_drift_database/todo_local_drift_database.dart'
    as _i3;
import '../../features/todo_list/data/data_sourse/data_source_local/todo_model_data_source_local.dart'
    as _i4;
import '../../features/todo_list/data/data_sourse/data_source_local/todo_model_data_source_local_impl.dart'
    as _i5;
import '../../features/todo_list/data/repository_impl/todo_repository_impl.dart'
    as _i7;
import '../../features/todo_list/domain/repository/todo_repository.dart' as _i6;
import '../../features/todo_list/domain/usecase/todo_usecase.dart' as _i8;
import '../../features/todo_list/presentation/controller/save_todo_controller.dart'
    as _i10;
import '../../features/todo_list/presentation/cubit/refresh_todos_cubit.dart'
    as _i9;

// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.lazySingleton<_i3.AppDatabase>(() => _i3.AppDatabase());
  gh.lazySingleton<_i4.TodoModelDataSourceLocal>(
      () => _i5.TodoModelDataSourceLocalImpl());
  gh.lazySingleton<_i6.TodoRepository>(
      () => _i7.TodoRepositoryImpl(gh<_i4.TodoModelDataSourceLocal>()));
  gh.lazySingleton<_i8.TodoUsecase>(
      () => _i8.TodoUsecase(gh<_i6.TodoRepository>()));
  gh.lazySingleton<_i9.RefreshTodosCubit>(
      () => _i9.RefreshTodosCubit(gh<_i8.TodoUsecase>()));
  gh.lazySingleton<_i10.SaveTodoController>(() => _i10.SaveTodoController(
        gh<_i8.TodoUsecase>(),
        gh<_i9.RefreshTodosCubit>(),
      ));
  return getIt;
}
