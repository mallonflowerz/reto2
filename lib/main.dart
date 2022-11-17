import 'dart:js';

import 'package:f_shopping_app_r2_template/ui/pages/cambioName.dart';
import 'package:f_shopping_app_r2_template/ui/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loggy/loggy.dart';

import 'ui/app.dart';
import 'ui/controllers/shopping_controller.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Loggy.initLoggy(
    logPrinter: const PrettyPrinter(
      showColors: true,
    ),
  );
  Get.put(ShoppingController());
  // TODO
  // agregar el ShoppingController al DI de Get
  runApp(const MyApp());
}
