import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:third_flutter/2_applications/core/services/theme_service.dart';
import 'package:third_flutter/2_applications/pages/theme_switcher/widgets/moon.dart';
import 'package:third_flutter/2_applications/pages/theme_switcher/widgets/star.dart';
import 'package:third_flutter/2_applications/pages/theme_switcher/widgets/sun.dart';

class ThemeSwitcherPage extends StatelessWidget {
  const ThemeSwitcherPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: themeData.iconTheme,
        title: Text('Theme Animation', style: themeData.textTheme.headlineLarge,),
        centerTitle: true,
      ),
      body: Consumer<ThemeService>(
        builder:
            (BuildContext context, ThemeService themeService, Widget? child) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Material(
                elevation: 20,
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  height: 500,
                  decoration: BoxDecoration(
                      // boxShadow: const[
                      //   BoxShadow(
                      //     color: Colors.grey,
                      //     offset: Offset(0, 3),
                      //     blurRadius: 5,
                      //     spreadRadius: 7
                      //   )
                      // ],
                      borderRadius: BorderRadius.circular(15),
                      gradient: LinearGradient(
                          colors: themeService.isDarkModeOn
                              ? const [
                                  Color(0xFF94A9FF),
                                  Color(0xFF6B66CC),
                                  Color(0xFF200F75)
                                ]
                              : const [
                                  Color(0xDDFFFA66),
                                  Color(0xDDFFA057),
                                  Color(0xDD940B99)
                                ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter)),
                  child: Stack(
                    children: [
                      Positioned(
                        top: 130,
                        left: 200,
                        child: AnimatedOpacity(
                            duration: const Duration(milliseconds: 300),
                            opacity: themeService.isDarkModeOn ? 1 : 0,
                            child: const Star()),
                      ),
                      Positioned(
                        top: 170,
                        left: 50,
                        child: AnimatedOpacity(
                            duration: const Duration(milliseconds: 300),
                            opacity: themeService.isDarkModeOn ? 1 : 0,
                            child: const Star()),
                      ),
                      Positioned(
                        top: 30,
                        right: 100,
                        child: AnimatedOpacity(
                            duration: const Duration(milliseconds: 300),
                            opacity: themeService.isDarkModeOn ? 1 : 0,
                            child: const Star()),
                      ),
                      Positioned(
                        top: 50,
                        right: 300,
                        child: AnimatedOpacity(
                            duration: const Duration(milliseconds: 300),
                            opacity: themeService.isDarkModeOn ? 1 : 0,
                            child: const Star()),
                      ),
                      Positioned(
                        top: 100,
                        right: 50,
                        child: AnimatedOpacity(
                            duration: const Duration(milliseconds: 300),
                            opacity: themeService.isDarkModeOn ? 1 : 0,
                            child: const Star()),
                      ),
                      Positioned(
                        top: 100,
                        right: 200,
                        child: AnimatedOpacity(
                            duration: const Duration(milliseconds: 300),
                            opacity: themeService.isDarkModeOn ? 1 : 0,
                            child: const Star()),
                      ),
                      AnimatedPositioned(
                        duration: Duration(milliseconds: 200),
                        top: themeService.isDarkModeOn ? 100 : 130,
                        right: themeService.isDarkModeOn ? 100 : -30,
                        child: AnimatedOpacity(
                            duration: const Duration(milliseconds: 300),
                            opacity: themeService.isDarkModeOn ? 1 : 0,
                            child: const Moon()),
                      ),
                      AnimatedPadding(
                        duration: const Duration(milliseconds: 200),
                        padding: EdgeInsets.only(
                            top: themeService.isDarkModeOn ? 120 : 50),
                        child: Center(child: const Sun()),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: 225,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: themeService.isDarkModeOn
                                  ? Colors.grey[850]
                                  : Colors.white,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(15),
                                  bottomRight: Radius.circular(15))),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  themeService.isDarkModeOn
                                      ? 'To dark ?'
                                      : 'To light ?',
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w700),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                Text(
                                  themeService.isDarkModeOn
                                      ? 'Let the sun rise'
                                      : 'Let it be night',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontStyle: FontStyle.italic),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                Switch(
                                    value: themeService.isDarkModeOn,
                                    onChanged: (_) {
                                      themeService.toggleTheme();
                                    })
                              ]),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}