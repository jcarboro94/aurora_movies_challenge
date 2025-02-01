import 'package:aurora_movies/app.dart';
import 'package:aurora_movies/utils/extensions/get_it.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final getIt = GetIt.instance;
  getIt.registerDependencies();

  await getIt.allReady();

  runApp(MyApp());
}
