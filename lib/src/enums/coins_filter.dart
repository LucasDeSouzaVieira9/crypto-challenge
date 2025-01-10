enum CoinsFilter {
  all,
  favorites,
}

extension HomeFilterExtension on CoinsFilter {
  bool get isAll => this == CoinsFilter.all;
  bool get isFavorites => this == CoinsFilter.favorites;

  String get label {
    switch (this) {
      case CoinsFilter.all:
        return 'Todos';

      case CoinsFilter.favorites:
        return 'Favoritos';
    }
  }
}
