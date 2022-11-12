import '../../app/app.locator.dart';
import '../../app/app.logger.dart';
import '../../core/constants/api_constants.dart';
import '../../models/country.dart';
import '../network_service/i_network_service.dart';
import 'i_countries_service.dart';

/// This is the implementation of the [ICountriesService] interface.
class CountriesServiceImpl extends ICountriesService {
  final _log = getLogger('CountriesServiceImpl');
  final INetworkService _networkService = locator<INetworkService>();

  /// Provides a list of countries.

  @override
  Future<List<Country>> getCountries() async {
    _log.v('Fetching countries...');
    final response = await _networkService
        .get<List<Map<String, dynamic>>>(ApiConstants.getAllCountriesEndpoint);
    _log
      ..v('Countries fetched successfully.\n ${response.data}')
      ..v('Parsing countries...');

    final countries = List<Country>.from(
      response.data.map(
        Country.fromJson,
      ),
    );
    _log.v('Countries parsed successfully.');
    return countries;
  }

  @override
  Future<Country> getCountryByName(String countryName) {
    // TODO: implement getCountryByName
    throw UnimplementedError();
  }
}
