import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../app/app.locator.dart';
import '../../app/app.logger.dart';
import '../../core/utilities/api_handlers/failure.dart';
import '../../models/country.dart';
import '../../services/countries_service/i_countries_service.dart';

/// Business logic layer for Country View.
class CountriesViewModel extends BaseViewModel {
  final _countriesService = locator<ICountriesService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _log = getLogger('CountriesViewModel');

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
}
