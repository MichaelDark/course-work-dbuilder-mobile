part of 'networking_state.dart';

mixin SenderMixin<T, V> on NetworkingState {
  NetworkProcessState _senderState = NetworkProcessState.Idle;
  NetworkProcessState get senderState => _senderState;

  V _senderResponse;
  V get senderResponse => _senderResponse;

  dynamic _sendError;
  dynamic get sendError => _sendError;

  bool get hasSendError => _sendError != null;

  Future<void> createDataSender(T data);

  /// Could be overriden
  Future<void> onDataSent(T data, V response) async {}

  /// Could be overriden
  Future<void> onSendError(dynamic error) async {}

  Future<void> sendData(T data) async {
    if (_senderState == NetworkProcessState.Loading) return;

    _senderState = NetworkProcessState.Loading;
    _sendError = null;
    _trySetState();

    try {
      Future<V> dataSender = createDataSender(data);
      _senderResponse = await dataSender;

      _senderState = NetworkProcessState.Success;
      await onDataSent(data, _senderResponse);
    } catch (exception) {
      _sendError = exception;

      _senderState = NetworkProcessState.Error;
      await onSendError(exception);
    }

    _trySetState();
  }
}
