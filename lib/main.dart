import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/app_router.dart';
import 'package:news/core/di.dart';
import 'package:news/core/utils/my_theme_data.dart';
import 'package:news/my_bloc_observer.dart';

void main() {
   Bloc.observer = MyBlocObserver();
   configureDependencies();  
   
  runApp( MyApp(appRouter: AppRouter(),));
  
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter ;

  const MyApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(412, 870),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_ , child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: MyThemeData.lightTheme,
          home: child,
          onGenerateRoute: appRouter.generateRoute,

        );
      },
    );
  }
}

