import 'package:flutter/material.dart';
import 'package:money_expense/global/color/colors.dart';
import 'package:money_expense/router/router.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: myRouter,
      theme: ThemeData(
        useMaterial3: false,
        scaffoldBackgroundColor: AppColors.white,
        bottomSheetTheme: const BottomSheetThemeData(
          backgroundColor: AppColors.white,
        ),
        primaryColor: AppColors.blueBackground,
      ),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('id')],
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        return GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(body: child),
        );
      },
    );
  }
}
