import 'package:crypto_challenge/src/shareds/cg_cached_image.dart';
import 'package:crypto_challenge/src/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CoinItem extends StatelessWidget {
  final String url;
  final String symbol;
  final String name;
  final num currentPrice;
  final bool isFavorite;
  final void Function() onTapFavorite;
  final void Function() onTapCoin;

  const CoinItem({
    super.key,
    required this.url,
    required this.symbol,
    required this.name,
    required this.isFavorite,
    required this.onTapFavorite,
    required this.onTapCoin,
    required this.currentPrice,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapCoin,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Container(
              width: 64,
              height: 64,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.scaffoldLight,
                borderRadius: BorderRadius.circular(8),
              ),
              child: CGCachedImage(imageUrl: url),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  Text(
                    '$symbol - \$${NumberFormat.currency(locale: 'en_US', decimalDigits: 2, symbol: '').format(currentPrice)}',
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: onTapFavorite,
                  icon: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: isFavorite ? Colors.red : null,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
