import 'package:app_base/bloc/common_bloc/common_bloc.dart';
import 'package:app_base/data/di/config.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void printResponse(String text) {
  if (kDebugMode) {
    print('\x1B[33m$text\x1B[0m');
  }
}

void printError(String text) {
  if (kDebugMode) {
    print('\x1B[31m$text\x1B[0m');
  }
}

void printTest(String text) {
  if (kDebugMode) {
    print('\x1B[32m$text\x1B[0m');
  }
}

Color themingColor(Color lightColor, Color darkColor) {
  return getIt<CommonBloc>().state.isLightTheme ? lightColor : darkColor;
}
