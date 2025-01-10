enum CoinDetailStatus { loading, error, success, exceededRateLimit }

extension CoinsStatusX on CoinDetailStatus {
  bool get isLoading => this == CoinDetailStatus.loading;
  bool get isError => this == CoinDetailStatus.error;
  bool get isExceededRateLimit => this == CoinDetailStatus.exceededRateLimit;
  bool get isSuccess => this == CoinDetailStatus.success;
}
