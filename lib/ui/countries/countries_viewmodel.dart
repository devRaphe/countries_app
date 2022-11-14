import 'dart:async';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../app/app.bottomsheets.dart';
import '../../app/app.locator.dart';
import '../../app/app.logger.dart';
import '../../app/app.router.dart';
import '../../core/utilities/api_handlers/failure.dart';
import '../../models/country.dart';
import '../../services/countries_service/i_countries_service.dart';
import '../../services/theme_service/theme_service.dart';

/// Business logic layer for Country View.
class CountriesViewModel extends ReactiveViewModel {
  final _countriesService = locator<ICountriesService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _themeService = locator<ThemeService>();
  final _navigationService = locator<NavigationService>();
  final _log = getLogger('CountriesViewModel');

  /// Function to turn on dart mode.
  void turnOnDarkMode() {
    _themeService.setThemeMode(isDarkMode: true);
  }

  /// Function to turn on dart mode.
  void turnOnLightMode() {
    _themeService.setThemeMode(isDarkMode: false);
  }

  List<Country> _initialCountriesList = [];

  List<Country> _countries = [];

  /// Getter of a list of [_countries].
  List<Country> get countries => _countries;

  void _setCountries(List<Country> countries) {
    _countries = countries;
    notifyListeners();
  }

  /// Fetches a list of countries from the [_countriesService].
  Future<dynamic> fetchCountries() async {
    _log.i('Requesting for list of countries...');
    try {
      setBusy(true);
      final countries = await _countriesService.getCountries();
      _initialCountriesList = countries;
      _setCountries(countries);
      notifyListeners();
      _log.i('List of countries recieved successfully.');
    } on Failure catch (error) {
      _log
        ..d('Error occured while fetching countries')
        ..e(
          error.devMessage,
        );
      await _bottomSheetService.showBottomSheet(
        title: 'An error occurred',
        description: error.prettyMessage,
      );
    } finally {
      setBusy(false);
    }
  }

  /// Method to navigate to countries details screen
  void navigateToCountryDetailsView(Country country) {
    unawaited(
      _navigationService.navigateToCountriesDetailView(countryToView: country),
    );
  }

  /// Method to filter countries by name, capital, region and subregion.
  void searchCountries(String query) {
    _log.v('Filtering through shop items');

    if (query.isNotEmpty) {
      final filteredCountries = _countries.where((country) {
        final countryOfficialName = country.officialName.toLowerCase();
        final countryCommonName = country.officialName.toLowerCase();
        final countryCapital = country.capital.toLowerCase();
        final countryRegion = country.region.toLowerCase();
        final countrySubRegion = country.subRegion.toLowerCase();
        final queryLowerCase = query.toLowerCase();
        return countryOfficialName.contains(queryLowerCase) ||
            countryCommonName.contains(queryLowerCase) ||
            countryCapital.contains(queryLowerCase) ||
            countryRegion.contains(queryLowerCase) ||
            countrySubRegion.contains(queryLowerCase);
      }).toList();
      _countries = filteredCountries;
    } else {
      _countries = _initialCountriesList;
    }
    notifyListeners();
  }

  /// Method to filter countries by with certain parameters
  /// like timezones and regions.
  Future<void> filterCountries() async {
    final List<String>? filterParameters = await _openFilterBottomSheet();
    if (filterParameters != null) {}
  }

  Future<List<String>?> _openFilterBottomSheet() async {
    final result =
        await _bottomSheetService.showCustomSheet<List<String>, List<String>>(
      variant: BottomsheetType.filterCountriesBottomSheetView,
      isScrollControlled: true,
    );
    return result?.data;
  }

  @override
  List<ReactiveServiceMixin> get reactiveServices => [_themeService];
}
