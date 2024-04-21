import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim_soul/constants.dart';
import 'package:muslim_soul/core/network/local/cache_helper.dart';
import 'package:muslim_soul/core/utils/service_locator.dart';
import 'package:muslim_soul/features/home/data/repos/home_repo_impl.dart';
import 'package:muslim_soul/features/home/presentation/menegar/aya_of_day_cubit/aya_of_day_cubit.dart';

import 'core/utils/app_router.dart';

void main() async {
  WidgetsFlutterBinding();
  await CacheHelper.init();
  setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AyaOfDayCubit(getIt.get<HomeRepoImpl>())
            ..init()
            ..getAyaOfTheDay(),
        )
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        title: 'Muslim Soul',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Constants.kSwatchColor,
          primaryColor: Constants.kPrimary,
          scaffoldBackgroundColor: Colors.white,
          fontFamily: 'Poppins',
          // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
      ),
    );
  }
}
