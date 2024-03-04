import 'package:exchange_rate_app/view_models/services/splash_vm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  SplashController splashService = SplashController();

  @override
  void initState() {
    super.initState();
    splashService.goToHome(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          "assets/images/octek.jpeg",
          width: 240,
          height: 80,
        ),
      ),
    );
  }
}
