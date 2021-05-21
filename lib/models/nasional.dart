// To parse this JSON data, do
//
//     final covidNasional = covidNasionalFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

CovidNasional covidNasionalFromJson(String str) =>
    CovidNasional.fromJson(json.decode(str));

String covidNasionalToJson(CovidNasional data) => json.encode(data.toJson());

class CovidNasional {
  CovidNasional({
    this.countryRegion,
    this.lastUpdate,
    this.confirmed,
    this.deaths,
    this.recovered,
    this.active,
  });

  String countryRegion;
  int lastUpdate;
  int confirmed;
  int deaths;
  int recovered;
  int active;

  factory CovidNasional.fromJson(Map<String, dynamic> json) => CovidNasional(
        countryRegion: json["Country_Region"],
        lastUpdate: json["Last_Update"],
        confirmed: json["Confirmed"],
        deaths: json["Deaths"],
        recovered: json["Recovered"],
        active: json["Active"],
      );

  Map<String, dynamic> toJson() => {
        "Country_Region": countryRegion,
        "Last_Update": lastUpdate,
        "Confirmed": confirmed,
        "Deaths": deaths,
        "Recovered": recovered,
        "Active": active,
      };
}
