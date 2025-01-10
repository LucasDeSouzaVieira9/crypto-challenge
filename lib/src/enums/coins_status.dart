enum CoinsStatus { loading, error, success, empty, searchEmpty, paginationLoading }

extension CoinsStatusExt on CoinsStatus {
  bool get isLoading => this == CoinsStatus.loading;
  bool get isError => this == CoinsStatus.error;
  bool get isSuccess => this == CoinsStatus.success;
  bool get isEmpty => this == CoinsStatus.empty;
  bool get isSearchEmpty => this == CoinsStatus.searchEmpty;
  bool get isPaginationLoading => this == CoinsStatus.paginationLoading;

  String message() {
    switch (this) {
      case CoinsStatus.loading:
      case CoinsStatus.paginationLoading:
      case CoinsStatus.success:
        return '';
      case CoinsStatus.error:
        return 'Erro ao carregar as criptomoedas';
      case CoinsStatus.empty:
        return 'Nenhuma criptomoeda encontrada';
      case CoinsStatus.searchEmpty:
        return 'Nenhuma criptomoeda encontrada com esse termo pesquisado. Tente novamente';
    }
  }
}
