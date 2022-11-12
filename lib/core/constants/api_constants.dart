// Base Related

///
const String _scheme = 'https';

///
const String _host = 'restcountries.com';

///This is the base uri for the countries app
Uri baseUri = Uri(scheme: _scheme, host: _host, path: '/');

// Countries Payments Endpoints

/// This is the endpoint for getting all countries
Uri allCountriesEndpoint = Uri(scheme: _scheme, host: _host, path: '/v3.1/all');
