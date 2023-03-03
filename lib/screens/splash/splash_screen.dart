import 'dart:async';
import 'package:app_base/routes/routes.dart' as routes;
import 'package:app_base/themes/colors.dart';
import 'package:app_base/utils/common_utils.dart';
import 'package:app_base/widgets/svg_image.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 2), () {
      Navigator.of(context)
          .pushNamedAndRemoveUntil(routes.homeRoute, (route) => false);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: themingColor(defaultWhiteColor, defaultBlackColor),
      child: Center(
        child: SvgImage(
          'assets/icons/apple-svgrepo-com.svg',
          width: 64.sp,
          height: 64.sp,
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
