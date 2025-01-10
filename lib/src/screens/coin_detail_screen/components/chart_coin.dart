import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:crypto_challenge/src/dto/crypto_values_dto.dart';
import 'package:crypto_challenge/src/utils/app_colors.dart';
import 'package:crypto_challenge/src/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChartCoin extends StatefulWidget {
  const ChartCoin({super.key, required this.simbol, required this.price, required this.percent, required this.history});

  final String simbol;
  final num price;
  final num percent;
  final CryptoValuesDto history;

  @override
  State<ChartCoin> createState() => _ChartCoinState();
}

class _ChartCoinState extends State<ChartCoin> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      height: 346,
      width: double.infinity,
      decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '\$${NumberFormat.currency(
                      locale: 'en_US',
                      decimalDigits: 2,
                      symbol: '',
                    ).format(widget.price)}',
                    style: AppTextStyle.familyMulishW700s32,
                  ),
                  Text('/ 1 ${widget.simbol.toUpperCase()}', style: AppTextStyle.familyMulishW700s14.copyWith(color: AppColors.gray)),
                ],
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                height: 32,
                width: 73,
                decoration: BoxDecoration(
                  color: widget.percent > 0 ? AppColors.primary : AppColors.danger,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    '${widget.percent > 0 ? '+' : ''}${widget.percent.toStringAsFixed(2)}%',
                    style: AppTextStyle.familyMulishW700s12.copyWith(color: AppColors.white),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Sparkline(
                data: widget.history.prices.map((e) => e.value).toList(),

                // (widget.history['prices'] as List).map((e) => ((e as List).last as double)).toList(),
                fillMode: FillMode.below,
                lineColor: AppColors.primary,
                lineWidth: 3,
                gridLinesEnable: true,
                gridLinelabel: (gridLineValue) => '  \$${NumberFormat.currency(
                  locale: 'en_US',
                  decimalDigits: 2,
                  symbol: '',
                ).format(gridLineValue)}',
                fillGradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [AppColors.primary, AppColors.white],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
