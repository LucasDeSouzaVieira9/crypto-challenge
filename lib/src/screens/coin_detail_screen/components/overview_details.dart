import 'package:crypto_challenge/src/dto/crypto_details_dto.dart';
import 'package:crypto_challenge/src/screens/coin_detail_screen/components/overview_item.dart';
import 'package:crypto_challenge/src/utils/app_colors.dart';
import 'package:crypto_challenge/src/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OverviewDetails extends StatelessWidget {
  final CryptoDetailsDto details;
  const OverviewDetails({super.key, required this.details});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Overview', style: AppTextStyle.familyMulishW600s16),
          const Divider(height: 32),
          OverviewItem(
            title: 'Current Price',
            value: details.marketData.currentPrice,
          ),
          const SizedBox(height: 8),
          OverviewItem(
            title: 'Market Cap',
            value: details.marketData.marketCap,
          ),
          const SizedBox(height: 8),
          OverviewItem(
            title: 'All-Time High (ATH)',
            value: details.marketData.ath,
          ),
          const SizedBox(height: 8),
          OverviewItem(
            title: 'All-Time Low (ATL)',
            value: details.marketData.atl,
          ),
          const SizedBox(height: 8),
          OverviewItem(
            title: 'Circulating Supply',
            value: details.marketData.circulatingSupply,
          ),
          const SizedBox(height: 8),
          OverviewItem(
            title: 'Max Supply',
            value: details.marketData.maxSupply,
          ),
          const SizedBox(height: 8),
          OverviewItem(
            title: 'Market Cap Rank',
            value: details.marketData.marketCapRank,
          ),
          const SizedBox(height: 8),
          OverviewItem(
            title: 'Price Change 24h',
            value: details.marketData.priceChangePercent24h,
          ),
          const SizedBox(height: 8),
          OverviewItem(
            title: 'Total Supply',
            value: details.marketData.totalSupply,
          ),
          const SizedBox(height: 8),
          OverviewItem(
            title: 'Last Updated',
            valueText: DateFormat('dd/MM/yyyy HH:mm').format(details.marketData.lastUpdated!.toLocal()),
          ),
          const SizedBox(height: 20),
          Text("Description:", style: AppTextStyle.familyMulishW700s14),
          const SizedBox(height: 8),
          Text(details.description ?? '-', style: AppTextStyle.familyMulishW400s14),
        ],
      ),
    );
  }
}
