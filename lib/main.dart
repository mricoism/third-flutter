import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:third_flutter/2_applications/core/services/theme_service.dart';
import 'package:third_flutter/2_applications/pages/advice/advice_page.dart';
import 'package:third_flutter/theme.dart';
import 'injection.dart' as di; // di is dependency injection.

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();


  runApp(ChangeNotifierProvider(
    create: (context) => ThemeService(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeService>(builder: (context, themeService, child) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: themeService.isDarkModeOn ? ThemeMode.dark : ThemeMode.light,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        home: const AdvicerPageWrapperProvider(),
      );
    });
  }
}