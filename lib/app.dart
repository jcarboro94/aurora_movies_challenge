import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

class MyApp extends StatelessWidget {
  final bool? isDev;
  const MyApp({Key? key, this.isDev}) : super(key: key);

  final MaterialColor myAccent = const MaterialColor(
    0xFFC4295A,
    {
      50: Color(0xFF0078c9),
      100: Color(0xFF0078c9),
      200: Color(0xFF0078c9),
      300: Color(0xFF0078c9),
      400: Color(0xFF0078c9),
      500: Color(0xFF0078c9),
      600: Color(0xFF0078c9),
      700: Color(0xFF0078c9),
      800: Color(0xFF0078c9),
      900: Color(0xFF0078c9),
    },
  );

  @override
  Widget build(BuildContext context) {
    final GoRouter router = GetIt.instance<GoRouter>();

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: MaterialApp.router(
        color: const Color(0xFF496368),
        debugShowCheckedModeBanner: isDev == true,
        title: 'IMED',
        theme: ThemeData(
          primarySwatch: myAccent,
          colorScheme: const ColorScheme(
            brightness: Brightness.light,
            primary: Colors.black,
            onPrimary: Colors.white,
            secondary: Color(0xFF474c54),
            onSecondary: Color(0xFF0078c9),
            error: Color(0xFFBF4F51),
            onError: Colors.white,
            surface: Color(0xFFfafbfc),
            onSurface: Color(0xFF465f65),
            tertiary: Color(0xFF0078c9),
            onTertiary: Color(0xff474c54),
          ),
          scaffoldBackgroundColor: const Color(0xFFEBF0F1),
        ),
        darkTheme: ThemeData(
          primarySwatch: myAccent,
          colorScheme: const ColorScheme(
            brightness: Brightness.dark,
            primary: Colors.white,
            onPrimary: Colors.black,
            secondary: Color(0xFF0078c9),
            onSecondary: Color(0xFF474c54),
            error: Color(0xFFBF4F51),
            onError: Colors.white,
            surface: Color(0xFF313334),
            onSurface: Colors.white,
            tertiary: Color(0xFF474c54),
            onTertiary: Color(0xFF0078c9),
          ),
          scaffoldBackgroundColor: const Color(0xFF252627),
        ),
        routerDelegate: router.routerDelegate,
        routeInformationParser: router.routeInformationParser,
        routeInformationProvider: router.routeInformationProvider,
      ),
    );
  }
}
