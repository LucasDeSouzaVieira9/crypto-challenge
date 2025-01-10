import 'package:crypto_challenge/src/enums/coins_filter.dart';
import 'package:crypto_challenge/src/enums/coins_status.dart';
import 'package:crypto_challenge/src/screens/coin_detail_screen/coin_detail_screen.dart';
import 'package:crypto_challenge/src/screens/coins_screen/coins_view_model.dart';
import 'package:crypto_challenge/src/screens/coins_screen/components/coin_item.dart';
import 'package:crypto_challenge/src/shareds/cg_empty_state.dart';
import 'package:crypto_challenge/src/shareds/cg_erro_state.dart';
import 'package:crypto_challenge/src/shareds/cg_pull_to_refresh.dart';
import 'package:crypto_challenge/src/shareds/cg_scaffold.dart';
import 'package:crypto_challenge/src/shareds/cg_tab.dart';
import 'package:crypto_challenge/src/shareds/cg_text_form_field.dart';
import 'package:crypto_challenge/src/shareds/cg_warning_confirmated.dart';
import 'package:crypto_challenge/src/utils/app_assets.dart';
import 'package:crypto_challenge/src/utils/debouncer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

class CoinsScreen extends StatefulWidget {
  const CoinsScreen({super.key});

  static Widget create() {
    return ChangeNotifierProvider(create: (context) => GetIt.I<CoinsViewModel>(), child: const CoinsScreen());
  }

  @override
  State<CoinsScreen> createState() => _CoinsScreenState();
}

class _CoinsScreenState extends State<CoinsScreen> {
  final debouncer = Debouncer(milliseconds: 600);
  CoinsFilter filterSelected = CoinsFilter.all;
  CoinsViewModel? model;

  @override
  void initState() {
    super.initState();

    model = context.read();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      model!.getCryptos(filter: filterSelected);
      model!.loadFavorites();
    });
  }

  @override
  Widget build(BuildContext context) {
    model = context.watch();

    return CGScaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: CGPullToRefresh(
            onRefresh: () {
              model!.clearResults();
              return model!.getCryptos(isPullToRefresh: true, filter: filterSelected);
            },
            child: Column(
              children: [
                const SizedBox(height: 16),
                CGTextFormField(
                  labelText: 'Pesquisar',
                  suffixIcon: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [SvgPicture.asset(AppAssets.search, width: 25)],
                  ),
                  onChanged: (value) => debouncer.run(() async => model!.getCryptos(query: value, filter: filterSelected)),
                ),
                const SizedBox(height: 16),
                CGTab<CoinsFilter>(
                  items: CoinsFilter.values
                      .map((filter) => MLTabDto(
                            value: filter,
                            text: filter.label,
                          ))
                      .toList(),
                  valueSelected: CoinsFilter.all,
                  onChanged: (value) {
                    filterSelected = value;
                    model!.getCryptos(filter: filterSelected);
                  },
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: Builder(
                    builder: (context) {
                      if (model!.status.isLoading) return const Center(child: CircularProgressIndicator());

                      if (model!.status.isError) return CGErroState(message: model!.errorMessage);

                      if (model!.status.isEmpty || model!.status.isSearchEmpty) {
                        return CGEmptyState(message: model!.status.message());
                      }

                      return NotificationListener<ScrollNotification>(
                        onNotification: (scrollInfo) {
                          model!.getCryptos(scrollNotification: scrollInfo, filter: filterSelected);
                          return false;
                        },
                        child: ListView.separated(
                          itemCount: model!.cryptos.length,
                          separatorBuilder: (context, index) => const SizedBox(height: 8),
                          itemBuilder: (context, index) {
                            final crypto = model!.cryptos[index];
                            final isFavorite = model!.favoriteCryptos.contains(crypto.id);

                            return CoinItem(
                              url: crypto.image ?? '',
                              symbol: crypto.symbol,
                              name: crypto.name,
                              currentPrice: crypto.currentPrice ?? 0,
                              isFavorite: isFavorite,
                              onTapCoin: () async {
                                await Navigator.push(context, MaterialPageRoute(builder: (context) => CoinDetailScreen.create(crypto.id)));
                                model!.loadFavorites();
                              },
                              onTapFavorite: () {
                                if (isFavorite) {
                                  CGWarningConfirmed.show(
                                    context,
                                    title: "Remover Favorito",
                                    description: "Deseja remover essa moeda dos favoritos?",
                                    onConfirm: () => model!.favoriteCrypto(crypto.id),
                                  );
                                } else {
                                  model!.favoriteCrypto(crypto.id);
                                }
                              },
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
                if (model!.status.isPaginationLoading) ...[
                  const SizedBox(height: 10),
                  const Center(child: CircularProgressIndicator()),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
