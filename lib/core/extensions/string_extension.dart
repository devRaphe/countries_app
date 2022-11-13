/// String extenstion to add certain functionalities
/// that don't come with dart out of the box.
extension StringExtension on String {
  /// This getter capitalizes the first letter of a string.
  String get capitalizeFirstLetter {
    return '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
  }
}
