class DataStatus {
  final bool isLoading;
  final bool isError;
  final bool isSuccess;
  final bool isEmpty;
  final bool isLoadingMore;
  final String? errorMessage;

  DataStatus._({
    this.isEmpty = false,
    this.isLoading = false,
    this.isError = false,
    this.isSuccess = false,
    this.errorMessage,
    this.isLoadingMore = false,
  });

  factory DataStatus.loading() {
    return DataStatus._(isLoading: true);
  }

  factory DataStatus.loadingMore() {
    return DataStatus._(isSuccess: true, isLoadingMore: true);
  }

  factory DataStatus.success() {
    return DataStatus._(isSuccess: true);
  }

  factory DataStatus.error([String? message]) {
    return DataStatus._(isError: true, errorMessage: message);
  }

  factory DataStatus.empty() {
    return DataStatus._(isEmpty: true);
  }
}
