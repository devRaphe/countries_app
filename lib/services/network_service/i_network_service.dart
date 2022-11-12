import 'package:equatable/equatable.dart';

import '../../core/utilities/api_handlers/network_response.dart';

/// This is the network service interface that decribes http methods
abstract class INetworkService extends Equatable {
  /// This method will make a get request to the provided [uri]
  Future<NetworkResponse<T>> get<T>(Uri uri);

  /// This method will make a post request to the provided [uri]
  Future<NetworkResponse<T>> post<T>(Uri uri);
}
