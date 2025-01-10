import 'package:crypto_challenge/src/enums/coin_detail_status.dart';
import 'package:crypto_challenge/src/screens/coin_detail_screen/coin_detail_view_model.dart';
import 'package:crypto_challenge/src/screens/coin_detail_screen/components/chart_coin.dart';
import 'package:crypto_challenge/src/screens/coin_detail_screen/components/overview_details.dart';
import 'package:crypto_challenge/src/shareds/cg_erro_state.dart';
import 'package:crypto_challenge/src/shareds/cg_loading_state.dart';
import 'package:crypto_challenge/src/shareds/cg_scaffold.dart';
import 'package:crypto_challenge/src/shareds/cg_warning_confirmated.dart';
import 'package:crypto_challenge/src/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

class CoinDetailScreen extends StatefulWidget {
  final String id;

  const CoinDetailScreen({super.key, required this.id});

  static Widget create(String id) {
    return ChangeNotifierProvider(create: (context) => GetIt.I<CoinDetailViewModel>(), child: CoinDetailScreen(id: id));
  }

  @override
  State<CoinDetailScreen> createState() => _CoinDetailScreenState();
}

class _CoinDetailScreenState extends State<CoinDetailScreen> {
  CoinDetailViewModel? model;
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    model = context.read();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      model!.getDetails(id: widget.id);
      model!.loadFavorites();
    });
  }

  @override
  Widget build(BuildContext context) {
    model = context.watch();
    isFavorite = model!.favoriteCryptos.contains(widget.id);

    return CGScaffold(
      body: Column(
        children: [
          Row(
            children: [
              const SizedBox(width: 12),
              IconButton(
                icon: const Icon(Icons.arrow_back_ios_new),
                onPressed: () => Navigator.of(context).pop(),
              ),
              Text(widget.id.toUpperCase(), style: AppTextStyle.familyMulishW700s16),
              const Spacer(),
              IconButton(
                onPressed: () {
                  if (isFavorite) {
                    CGWarningConfirmed.show(
                      context,
                      title: "Remover Favorito",
                      description: "Deseja remover essa moeda dos favoritos?",
                      onConfirm: () => model!.favoriteCrypto(widget.id),
                    );
                  } else {
                    model!.favoriteCrypto(widget.id);
                  }
                },
                icon: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: isFavorite ? Colors.red : null,
                ),
              ),
              const SizedBox(width: 12),
            ],
          ),
          const SizedBox(height: 16),
          if (model!.status.isLoading) ...[
            const Expanded(child: CGLoadingState()),
          ] else if (model!.status == CoinDetailStatus.error) ...[
            Expanded(child: CGErroState(message: model!.errorMessage)),
          ] else ...[
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ChartCoin(
                      simbol: model!.cryptoDetail.symbol,
                      price: model!.cryptoDetail.marketData.currentPrice,
                      percent: model!.cryptoDetail.marketData.priceChangePercent24h,
                      history: model!.cryptoHistory,
                    ),
                    const SizedBox(height: 16),
                    OverviewDetails(details: model!.cryptoDetail),
                  ],
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
