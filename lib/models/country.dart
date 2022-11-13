import 'package:equatable/equatable.dart';

/// This class acts as a DTO for the country service
class Country extends Equatable {
  /// Default constructor for the country class.
  /// All parameters are optional, hence null on initial state.
  const Country({
    required this.population,
    required this.commonName,
    required this.officialName,
    required this.capital,
    required this.isIndependent,
    required this.area,
    required this.timeZones,
    required this.flagImageUrl,
    required this.coatOfArmsImageUrl,
    required this.drivingSide,
    required this.region,
    required this.subRegion,
    required this.altSpelling,
    required this.continent,
    required this.coordinates,
    required this.startOfTheWeek,
    required this.unitedNationsMember,
    required this.googleMapUrl,
  });

  /// factory constructor that return [Country].
  /// This constructor instantiates the [Country] class.
  /// And provides all its fields with data coming a Json object.
  factory Country.fromJson(Map<String, dynamic> json) => Country(
        population: json['population'] != null
            ? (json['population'] as num).toDouble()
            : 0.0,
        commonName:
            (json['name'] as Map<String, dynamic>)['common'] as String? ??
                'N/A',
        officialName:
            (json['name'] as Map<String, dynamic>)['official'] as String? ??
                'N/A',
        capital: json['capital'] != null
            ? (json['capital'] as List<dynamic>).first as String
            : 'N/A',
        isIndependent: json['independent'] as bool?,
        area: json['area'] != null ? (json['area'] as num).toDouble() : 0.0,
        timeZones: json['timezones'] != null
            ? (json['timezones'] as List<dynamic>).cast<String>()
            : [],
        flagImageUrl:
            (json['flags'] as Map<String, dynamic>)['png'] as String? ?? '',
        coatOfArmsImageUrl:
            (json['coatOfArms'] as Map<String, dynamic>)['png'] as String? ??
                '',
        drivingSide:
            (json['car'] as Map<String, dynamic>)['side'] as String? ?? '',
        region: json['region'] as String? ?? 'N/A',
        subRegion: json['subregion'] as String? ?? 'N/A',
        altSpelling:
            (json['altSpellings'] as List<dynamic>).first as String? ?? 'N/A',
        continent:
            (json['continents'] as List<dynamic>).first as String? ?? 'N/A',
        coordinates: json['latlng'] != null
            ? List<double>.from(
                (json['latlng'] as List<dynamic>).map((x) => x),
              )
            : [],
        startOfTheWeek: json['startOfWeek'] as String? ?? 'N/A',
        unitedNationsMember: json['unMember'] as bool?,
        googleMapUrl:
            (json['maps'] as Map<String, dynamic>)['googleMaps'] as String? ??
                '',
      );

  /// countryPopulation
  final double population;

  /// countryCommonName
  final String commonName;

  /// countryOfficialName
  final String officialName;

  /// countryCapital
  final String capital;

  /// Boolean to indicate if the country is independent
  final bool? isIndependent;

  /// countryArea in Km2
  final double area;

  /// countryTimeZones
  final List<String>? timeZones;

  /// countryFlagImageUrl
  final String flagImageUrl;

  /// countryCoatOfArmsImageUrl
  final String coatOfArmsImageUrl;

  /// country car driving side
  final String drivingSide;

  /// country region
  final String region;

  /// country subregion
  final String subRegion;

  /// country continent
  final String continent;

  /// country alternative spelling.
  final String altSpelling;

  /// boolean to know if country is a un member.
  final bool? unitedNationsMember;

  /// coordinates of the country.
  final List<double> coordinates;

  /// start day of the week.
  final String startOfTheWeek;

  /// google map location url.
  final String googleMapUrl;

  @override
  List<Object?> get props => [
        population,
        commonName,
        officialName,
        capital,
        isIndependent,
        area,
        timeZones,
        flagImageUrl,
        coatOfArmsImageUrl,
        drivingSide,
        region,
        subRegion,
        continent,
        altSpelling,
        unitedNationsMember,
        coordinates,
        startOfTheWeek,
        googleMapUrl,
      ];
}
