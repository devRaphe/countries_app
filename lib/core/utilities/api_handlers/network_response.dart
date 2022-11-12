import 'package:equatable/equatable.dart';

/// This class acts as a value object for the http network response
class NetworkResponse extends Equatable {
  /// Default constructor
  const NetworkResponse({
    required this.data,
    required this.statusCode,
  });

  /// Contains the data response from the network or API.
  final dynamic data;

  /// Contains the status code of the network response.
  final int? statusCode;

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [data, statusCode];
}
