import 'package:stacked/stacked.dart';

/// This is the view model for the FilterCountryView view.
class FilterCountriesBottomSheetViewModel extends BaseViewModel {
  final List<String> _timeZones = [
    'UTC-06:00',
    'UTC-07:00',
    'UTC-08:00',
    'UTC-11:00',
    'UTC-10:00',
    'UTC+12:00',
    'UTC+12:45',
    'UTC+13:00'
  ];

  /// Getter that provides a list of time zones.
  List<String> get timeZones => _timeZones;

  final List<String> _regions = [
    'Africa',
    'Americas',
    'Asia',
    'Europe',
    'Oceania',
    'Polar'
  ];

  /// Getter for list regions
  List<String> get regions => _regions;
}
