import 'package:crypto_challenge/src/screens/coins_screen/coins_screen.dart';
import 'package:crypto_challenge/src/screens/profile_screen/profile_screen.dart';
import 'package:crypto_challenge/src/shareds/cg_scaffold.dart';
import 'package:crypto_challenge/src/utils/app_assets.dart';
import 'package:crypto_challenge/src/utils/app_colors.dart';
import 'package:crypto_challenge/src/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final PageController _pageController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return CGScaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedLabelStyle: AppTextStyle.familyMulishW400s12.copyWith(color: AppColors.primary),
        unselectedLabelStyle: AppTextStyle.familyMulishW400s12.copyWith(color: AppColors.gray),
        unselectedItemColor: AppColors.gray,
        selectedItemColor: AppColors.primary,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppAssets.market,
              colorFilter: ColorFilter.mode(_currentIndex == 0 ? AppColors.primary : AppColors.gray, BlendMode.srcIn),
            ),
            label: 'Mercado',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppAssets.profile,
              colorFilter: ColorFilter.mode(_currentIndex == 1 ? AppColors.primary : AppColors.gray, BlendMode.srcIn),
            ),
            label: 'Perfil',
          ),
        ],
        onTap: (index) {
          _pageController.animateToPage(index, duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
        },
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() => _currentIndex = index);
        },
        children: [
          CoinsScreen.create(),
          const ProfileScreen(),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
