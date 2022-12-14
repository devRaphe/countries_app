import 'package:dio/dio.dart';

import '../../app/app.logger.dart';
import '../../core/constants/api_constants.dart';
import '../../core/utilities/api_handlers/failure.dart';
import '../../core/utilities/api_handlers/network_response.dart';
import 'i_network_service.dart';

/// This is the implementation of the [INetworkService] interface.
class DioNetworkService extends INetworkService {
  /// Default constructor used for setting up dio init functions
  DioNetworkService() {
    _dio.options.baseUrl = ApiConstants.baseUri.toString();
    _log.i('Dio service constructed');
  }

  final Dio _dio = Dio();
  final _log = getLogger('DioNetworkService');

  @override
  Future<NetworkResponse<T>> get<T>(Uri uri) async {
    try {
      _log.v('Fetching data from $uri...');
      final response = await _dio.getUri<T>(uri);
      _log.v('Data fetched successfully.');
      return NetworkResponse<T>(
        data: response.data as T,
        statusCode: response.statusCode,
      );
    } on DioError catch (error) {
      switch (error.type) {
        case DioErrorType.connectTimeout:
          _log.e('Connection timeout');
          throw Failure(
            prettyMessage:
                '''Opps there was a connection timed out. Please ensure your internet connection is stable''',
            devMessage: error.message,
            code: error.response?.statusCode,
          );

        case DioErrorType.sendTimeout:
          _log.e('Send timeout');
          throw Failure(
            prettyMessage:
                '''Opps there was something wrong with getting your request. Please try again''',
            devMessage: error.message,
            code: error.response?.statusCode,
          );

        case DioErrorType.receiveTimeout:
          _log.e('Receive timeout');
          throw Failure(
            prettyMessage:
                '''Opps there was something wrong with processing your request. Pls try again''',
            devMessage: error.message,
            code: error.response?.statusCode,
          );

        case DioErrorType.response:
          _log.e('Response error');
          throw Failure(
            prettyMessage:
                '''Opps there was something wrong with processing your request.Pls ensure your internet connection is stable''',
            devMessage: error.message,
            code: error.response?.statusCode,
          );

        case DioErrorType.cancel:
          _log.e('Request cancelled');
          throw Failure(
            prettyMessage: '''Opps your was terminated. Please try again''',
            devMessage: error.message,
            code: error.response?.statusCode,
          );
        case DioErrorType.other:
          _log.wtf('An error occurred pls see logs');
          throw Failure(
            prettyMessage:
                '''Opps there was something wrong. Please try again''',
            devMessage: error.message,
            code: error.response?.statusCode,
          );
      }
    } catch (error, stackTrace) {
      _log.wtf('An error occurred pls see logs');
      throw Failure(
        prettyMessage: 'Something went wrong fetching yoor request',
        devMessage: error.toString() + stackTrace.toString(),
      );
    }
  }

  @override
  Future<NetworkResponse<T>> post<T>(Uri uri) {
    // TODO: implement post
    throw UnimplementedError();
  }

  @override
  List<Object?> get props => [_dio, _log];
}
