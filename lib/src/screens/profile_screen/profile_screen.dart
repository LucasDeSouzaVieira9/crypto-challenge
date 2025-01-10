import 'package:crypto_challenge/src/screens/profile_screen/components/profile_card.dart';
import 'package:crypto_challenge/src/shareds/cg_scaffold.dart';
import 'package:crypto_challenge/src/utils/app_assets.dart';
import 'package:crypto_challenge/src/utils/app_colors.dart';
import 'package:crypto_challenge/src/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CGScaffold(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 80,
              width: 80,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.asset(AppAssets.imageProfile),
              ),
            ),
            const SizedBox(height: 16),
            Text("Lucas Souza", style: AppTextStyle.familyMulishW700s16),
            const SizedBox(height: 32),
            ProfileCard(
              title: 'Lista de transações',
              subtitle: 'Transações que você tem',
              iconBackgroundColor: AppColors.honeydew,
              icon: SvgPicture.asset(AppAssets.document),
            ),
            const SizedBox(height: 8),
            ProfileCard(
              title: 'Privacidade',
              subtitle: 'Esqueceu seu e-mail e senha?',
              iconBackgroundColor: AppColors.lightCyan,
              icon: SvgPicture.asset(AppAssets.lock),
            ),
            const SizedBox(height: 8),
            ProfileCard(
              title: 'Pagamento',
              subtitle: 'Atualizar configurações de pagamento',
              iconBackgroundColor: AppColors.lavender,
              icon: SvgPicture.asset(AppAssets.wallet),
            ),
            const SizedBox(height: 8),
            ProfileCard(
              title: 'Notificações',
              subtitle: 'Alterar configurações de notificação',
              iconBackgroundColor: AppColors.warningLight,
              icon: SvgPicture.asset(AppAssets.notification),
            ),
            const SizedBox(height: 8),
            ProfileCard(
              title: 'Sair',
              subtitle: 'Sair do aplicativo',
              iconBackgroundColor: AppColors.palePink,
              icon: SvgPicture.asset(AppAssets.logout),
            ),
          ],
        ),
      ),
    );
  }
}
