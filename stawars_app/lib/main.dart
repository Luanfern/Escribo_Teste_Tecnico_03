import 'package:dependency_module/dependency_module.dart';
import 'package:flutter/material.dart';
import 'package:stawars_app/app/app_modular.dart';
import 'package:stawars_app/app/app_widget.dart';

void main() {
  runApp(ModularApp(
    module: AppModule(),
    child: const App(),
  ));
}
