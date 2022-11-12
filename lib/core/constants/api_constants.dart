/// This class holds all the endpoints to be used in this app.
class ApiConstants {
  // Base Related

  ///
  static const String _scheme = 'https';

  ///
  static const String _host = 'restcountries.com';

  ///This is the base uri for the countries app
  static Uri baseUri = Uri(scheme: _scheme, host: _host, path: '/');

// Countries Payments Endpoints

  /// This is the endpoint for getting all countries
  static Uri getAllCountriesEndpoint =
      Uri(scheme: _scheme, host: _host, path: '/v3.1/all');
}
