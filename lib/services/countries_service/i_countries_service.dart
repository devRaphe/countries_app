import '../../models/country.dart';

/// Countries service or repository interface.
/// This is the interface that describes the methods for the countries service.
abstract class ICountriesService {
  /// This method provides a list of countries.
  Future<List<Country>> getCountries();

  /// This method provides a single countries.
  Future<Country> getCountryByName(String countryName);
}
