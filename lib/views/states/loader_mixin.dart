part of 'networking_state.dart';

mixin LoaderMixin<T> on NetworkingState {
  NetworkProcessState _loaderState = NetworkProcessState.Idle;
  NetworkProcessState get loaderState => _loaderState;

  dynamic _loadError;
  dynamic get loadError => _loadError;

  T _loadedData;
  T get loadedData => _loadedData;

  Future<T> createDataLoader();

  /// Could be overriden
  bool get preloadOnInit => true;

  /// Could be overriden
  Future<void> onDataLoaded(T data) async {}

  /// Could be overriden
  Future<void> onLoadError(dynamic error) async {}

  Future<void> loadData() async {
    if (_loaderState == NetworkProcessState.Loading) return;

    _loaderState = NetworkProcessState.Loading;
    clearPreloadedData();
    _trySetState();

    try {
      _loadedData = await createDataLoader();

      _loaderState = NetworkProcessState.Success;
      if (mounted) await onDataLoaded(loadedData);
    } catch (exception) {
      _loadError = exception;

      _loaderState = NetworkProcessState.Error;
      if (mounted) await onLoadError(exception);
    }

    _trySetState();
  }

  void clearPreloadedData() {
    _loadedData = null;
    _loadError = null;
  }

  void forceReloadData() {
    _loaderState = NetworkProcessState.Idle;

    clearPreloadedData();
    loadData();

    _trySetState();
  }
}
