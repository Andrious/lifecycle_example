import 'dart:convert';

import 'package:lifecycle_example/src/source.dart';

import 'package:http/http.dart' as http;

class Countries {
  Countries({
    @required this.name,
    @required this.topLevelDomain,
    @required this.alpha2Code,
    @required this.alpha3Code,
    @required this.callingCodes,
    @required this.capital,
    @required this.altSpellings,
    @required this.region,
    @required this.subregion,
    @required this.population,
    @required this.latlng,
    @required this.demonym,
    @required this.area,
    @required this.gini,
    @required this.timezones,
    @required this.borders,
    @required this.nativeName,
    @required this.numericCode,
    @required this.currencies,
    @required this.translations,
    @required this.flag,
    @required this.regionalBlocs,
    @required this.cioc,
  });

  factory Countries.fromJson(dynamic json) => Countries(
        name: json['name'],
        topLevelDomain: json['topLevelDomain'],
        alpha2Code: json['alpha2Code'],
        alpha3Code: json['alpha3Code'],
        callingCodes: json['callingCodes'],
        capital: json['capital'],
        altSpellings: json['altSpellings'],
        region: json['region'],
        subregion: json['subregion'],
        population: json['population'],
        latlng: json['latlng'],
        demonym: json['demonym'],
        area: json['area'],
        gini: json['gini'],
        timezones: json['timezones'],
        borders: json['borders'],
        nativeName: json['nativeName'],
        numericCode: json['numericCode'],
        currencies: json['currencies'],
        translations: json['translations'],
        flag: json['flag'],
        regionalBlocs: json['regionalBlocs'],
        cioc: json['cioc'],
      );

  static Future<List<dynamic>> get() async {
    //
    List<dynamic> countryList;

    final response = await http.get('https://restcountries.eu/rest/v2/all');

    if (response.statusCode == 200) {
      try {
        countryList = json
            .decode(response.body)
            .map((dynamic i) => Countries.fromJson(i))
            .toList();
      } catch (ex) {
        countryList = [];
      }
    } else {
      countryList = [];
    }
    return countryList;
  }

  final String name;
  final List<dynamic> topLevelDomain;
  final String alpha2Code;
  final String alpha3Code;
  final List<dynamic> callingCodes;
  final String capital;
  final List<dynamic> altSpellings;
  final String region;
  final String subregion;
  final int population;
  final List<dynamic> latlng;
  final String demonym;
  final double area;
  final double gini;
  final List<dynamic> timezones;
  final List<dynamic> borders;
  final String nativeName;
  final String numericCode;
  final List<dynamic> currencies;
  final Map<String, dynamic> translations;
  final String flag;
  final List<dynamic> regionalBlocs;
  final String cioc;
}
