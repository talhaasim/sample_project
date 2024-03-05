import 'package:appcenter_sdk_flutter/appcenter_sdk_flutter.dart';
import 'package:exchange_rate_app/app/routes/routes.dart';
import 'package:exchange_rate_app/repository/home_repository.dart';
import 'package:exchange_rate_app/res/strings.dart';
import 'package:exchange_rate_app/utils/constants.dart';
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
  startAppCenter();
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

startAppCenter() async {
  await AppCenter.start(secret: AppConstants.appCenterId);
  FlutterError.onError = (final details) async {
    await AppCenterCrashes.trackException(
      message: details.exception.toString(),
      type: details.exception.runtimeType,
      stackTrace: details.stack,
    );
  };
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
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
