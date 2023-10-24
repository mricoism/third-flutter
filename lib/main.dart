import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:third_flutter/2_applications/core/services/theme_service.dart';
import 'package:third_flutter/2_applications/pages/advice/advice_page.dart';
import 'package:third_flutter/theme.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => ThemeService(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeService>(builder: (context, ThemeService, child) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeService.isDarkModeOn ? ThemeMode.dark : ThemeMode.light,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        home: const AdvicerPageWrapperProvider(),
      );
    });
  }
}