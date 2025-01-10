import 'package:crypto_challenge/src/core/injection.dart';
import 'package:crypto_challenge/src/screens/coins_screen/coins_screen.dart';
import 'package:crypto_challenge/src/screens/home_screen/home_screen.dart';
import 'package:crypto_challenge/src/screens/profile_screen/profile_screen.dart';
import 'package:crypto_challenge/src/utils/app_colors.dart';
import 'package:crypto_challenge/src/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  await setup();

  runApp(const BrasilCriptoApp());
}

class BrasilCriptoApp extends StatelessWidget {
  const BrasilCriptoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crypto Challenge',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primary,
          surface: AppColors.white,
          onSurface: AppColors.black,
          primary: AppColors.primary,
          secondary: AppColors.secondary,
          error: AppColors.red,
          onPrimary: AppColors.white,
          onSecondary: AppColors.white,
          onError: AppColors.white,
          brightness: Brightness.light,
        ),
        canvasColor: AppColors.white,
        scaffoldBackgroundColor: AppColors.scaffoldLight,
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.white,
        ),
        menuTheme: MenuThemeData(style: MenuStyle(backgroundColor: WidgetStateProperty.all(AppColors.white))),
        scrollbarTheme: ScrollbarThemeData(
          thickness: WidgetStateProperty.all(5),
          // ignore: deprecated_member_use
          thumbColor: WidgetStateProperty.all(AppColors.primary.withOpacity(.4)),
        ),
        popupMenuTheme: const PopupMenuThemeData(color: AppColors.white),
        bottomSheetTheme: const BottomSheetThemeData(backgroundColor: AppColors.white),
        dialogTheme: const DialogTheme(backgroundColor: AppColors.white),
      ),
      initialRoute: AppRoutes.home,
      routes: {
        AppRoutes.coins: (_) => CoinsScreen.create(),
        AppRoutes.home: (_) => const HomeScreen(),
        AppRoutes.profile: (_) => const ProfileScreen(),
      },
    );
  }
}
