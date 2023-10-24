import 'package:get_it/get_it.dart';
import 'package:third_flutter/0_data/datasources/advice_remote_datasource.dart';
import 'package:third_flutter/0_data/repositories/advice_repo_impl.dart';
import 'package:third_flutter/1_domain/repositories/advice_repo.dart';
import 'package:third_flutter/1_domain/usecases/advice_usecases.dart';
import 'package:third_flutter/2_applications/pages/advice/bloc/advicer_bloc.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.I; // sl is service locator

Future<void> init() async {
  // ! Application Layer
  // Factory is every time a new/fresh instance of that class
  sl.registerFactory(() => AdvicerBloc(adviceUsecases: sl()));

  // ! Domain Layer
  sl.registerFactory(() => AdviceUsecases(adviceRepo: sl()));

  // ! Data layer | Repositories
  sl.registerFactory<AdviceRepo>(
      () => AdviceRepoImpl(adviceRemoteDatasource: sl()));
  sl.registerFactory<AdviceRemoteDatasource>(
      () => AdviceRemoteDatasourceImpl(client: sl()));

  // ! externs
  sl.registerFactory(() => http.Client());
}
