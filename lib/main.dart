import 'package:aurora_movies/app.dart';
import 'package:aurora_movies/utils/extensions/get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: "env.prod");

  final getIt = GetIt.instance;
  getIt.registerDependencies();

  await getIt.allReady();

  runApp(MyApp());
}
