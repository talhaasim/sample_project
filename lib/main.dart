import 'package:exchange_rate_app/app/routes/routes.dart';
import 'package:exchange_rate_app/repository/home_repository.dart';
import 'package:exchange_rate_app/res/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

import 'app/app_localizations.dart';

GetStorage? storage;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  storage = GetStorage();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeRepository()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // return MultiProvider(
    //   providers: [
    //     ChangeNotifierProvider<HomeRepository>(
    //       create: (_) => HomeRepository(),
    //     ),
    //   ],
    //   child: Consumer<HomeRepository>(builder: (context, model, child) {
    //     return ScreenUtilInit(
    //       designSize: const Size(360, 690),
    //       builder: (con) {
    //         PaintingBinding.instance.imageCache.maximumSizeBytes = 3000 << 20;
    //         PaintingBinding.instance.imageCache.maximumSize = 3000 << 20;
    //         return GetMaterialApp(
    //           debugShowCheckedModeBanner: false,
    //           translations: LocalString(),
    //           locale: const Locale('en'),
    //           localizationsDelegates: const [
    //             AppLocalizations.delegate,
    //             GlobalMaterialLocalizations.delegate,
    //             GlobalWidgetsLocalizations.delegate,
    //             GlobalCupertinoLocalizations.delegate,
    //           ],
    //           builder: (context, child) => Directionality(
    //             textDirection: TextDirection.ltr,
    //             child: child!,
    //           ),
    //           onGenerateRoute: RouteGenerator.generateRoute,
    //         );
    //       },
    //     );
    //   }),
    // );

    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        translations: LocalString(),
        locale: const Locale('en'),
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        builder: (context, child) => Directionality(
              textDirection: TextDirection.ltr,
              child: child!,
            ),
        onGenerateRoute: RouteGenerator.generateRoute);
  }
}
