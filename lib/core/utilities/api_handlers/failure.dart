import 'package:equatable/equatable.dart';

/// This class will hold all the possible network errors in the app
class Failure with EquatableMixin implements Exception {
  /// Default constructor
  Failure({
    required this.prettyMessage,
    required this.devMessage,
    this.code,
  }) : super();

  /// This would hold a more refined error message for the user.
  final String prettyMessage;

  /// This would hold a more detailed error message for the developer.
  final String devMessage;

  /// Optional network status code parameter
  final int? code;

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [devMessage, code];
}
