import 'package:dbuilder_mobile/api/parser.dart';
import 'package:dbuilder_mobile/models/api_client_exception.dart';
import 'package:http/http.dart' as http;
import 'package:jaguar_serializer/jaguar_serializer.dart';
import 'package:meta/meta.dart';

const String textUnknownException = 'Unknown Exception';

typedef bool Validator<T>(T data);

class ResponseExtractor {
  ResponseExtractor._();

  static bool _isStatusCodeSuccess(int statusCode) {
    return statusCode == 200 || statusCode == 201;
  }

  static Future<ParsedType> _extractData<SerializableType, ParsedType>({
    @required http.Response response,
    @required Serializer<SerializableType> serializer,
    @required IParser<SerializableType, ParsedType> parser,
    @required bool canBeNull,
    @nullable Validator<ParsedType> validator,
  }) async {
    try {
      ParsedType parsedData = parser.parse(response.body, serializer);

      bool isStatusCodeOk = _isStatusCodeSuccess(response.statusCode);
      bool matchNullCondition = parsedData == null ? canBeNull : true;
      bool isValid = validator != null ? validator(parsedData) : true;

      if (isStatusCodeOk && isValid && matchNullCondition) {
        return parsedData;
      }
    } catch (ignored) {
      print(ignored);
    }

    ApiClientException exception = _parseError(response);
    return Future.error(exception);
  }

  static ApiClientException _parseError(http.Response response) =>
      ApiClientException();

  static Future<T> extractItem<T>(
    http.Response response,
    Serializer<T> serializer, {
    bool canBeNull = false,
    @nullable Validator<T> validator,
  }) async {
    return _extractData<T, T>(
      response: response,
      serializer: serializer,
      parser: ItemParser<T>(),
      validator: validator,
      canBeNull: canBeNull,
    );
  }

  static Future<List<T>> extractList<T>(
    http.Response response,
    Serializer<T> serializer, {
    bool canBeNull = false,
    @nullable Validator<List<T>> validator,
  }) async {
    return _extractData<T, List<T>>(
      response: response,
      serializer: serializer,
      parser: ListParser<T>(),
      validator: validator,
      canBeNull: canBeNull,
    );
  }

  static Future<void> extract(http.Response response) async {
    bool isStatusCodeOk = _isStatusCodeSuccess(response.statusCode);

    if (!isStatusCodeOk) {
      ApiClientException exception = _parseError(response);
      return Future.error(exception);
    }
  }
}
