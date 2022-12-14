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
        .get<List<dynamic>>(ApiConstants.getAllCountriesEndpoint);
    _log
      ..v('Countries fetched successfully.')
      ..v('Parsing countries...');

    final countries = List<Country>.from(
      response.data.map((e) => Country.fromJson(e as Map<String, dynamic>)),
    );
    _log.v('Countries parsed successfully.\n$countries');
    return countries;
  }

  @override
  Future<Country> getCountryByName(String countryName) {
    // TODO: implement getCountryByName
    throw UnimplementedError();
  }
}
