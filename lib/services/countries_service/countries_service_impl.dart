import '../../app/app.locator.dart';
import '../../core/constants/api_constants.dart';
import '../../models/country.dart';
import '../network_service/i_network_service.dart';
import 'i_countries_service.dart';

/// This is the implementation of the [ICountriesService] interface.
class CountriesServiceImpl extends ICountriesService {
  final INetworkService _networkService = locator<INetworkService>();

  /// Provides a list of countries.

  @override
  Future<List<Country>> getCountries() async {
    final response = await _networkService
        .get<List<Map<String, dynamic>>>(ApiConstants.getAllCountriesEndpoint);
    final countries = List<Country>.from(
      response.data.map(
        Country.fromJson,
      ),
    );
    return countries;
  }

  @override
  Future<Country> getCountryByName(String countryName) {
    // TODO: implement getCountryByName
    throw UnimplementedError();
  }
}
