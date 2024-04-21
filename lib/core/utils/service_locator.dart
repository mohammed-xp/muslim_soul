import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:muslim_soul/core/utils/api_services.dart';
import 'package:muslim_soul/features/home/data/repos/home_repo_impl.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiServices>(
    ApiServices(
      Dio(),
    ),
  );

  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(
      getIt.get<ApiServices>(),
    ),
  );
}