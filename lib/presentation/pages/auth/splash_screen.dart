import 'package:flutter/material.dart';
import 'package:gshop/app_constants.dart';
import 'package:gshop/infrastructure/local_storage/local_storage.dart';
import 'package:gshop/presentation/route/app_route.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (LocalStorage.getToken().isEmpty) {
        AppRoute.goLogin(context);
        // FlutterNativeSplash.remove();
        return;
      }
      AppRoute.goMain(context);
      // FlutterNativeSplash.remove();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppConstants.loginBg,
      fit: BoxFit.cover,
    );
  }
}
