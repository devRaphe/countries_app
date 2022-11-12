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
        isIndependent: json['Independent'] as bool?,
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
      ];
}
