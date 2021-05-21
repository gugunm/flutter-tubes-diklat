import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/nasional.dart';
import '../constant/url.dart';
import '../models/provinsi.dart';
import '../models/vaksin.dart';
import '../models/hospital.dart';

Future<List<CovidNasional>> getCovidNasional() async {
  // await Future.delayed(Duration(seconds: 300));

  await Future.delayed(Duration(seconds: 1));

  final res =
      await http.get(Uri.https(AppUrl.urlCovid, 'api/negara/indonesia'));

  if (res.statusCode == 200) {
    List<dynamic> body = jsonDecode(res.body);

    List<CovidNasional> covidNasional = body
        .map(
          (dynamic item) => CovidNasional.fromJson(item),
        )
        .toList();

    return covidNasional;
  } else {
    throw Exception('Failed to load data covid nasional');
  }
}

Future<List<Provinsi>> fetchprovinsi() async {
  final res =
      await http.get(Uri.https('covid19.keponet.com', '/api/provinsi/'));

  if (res.statusCode == 200) {
    List<dynamic> body = jsonDecode(res.body);

    List<Provinsi> provinsi = body
        .map(
          (dynamic item) => Provinsi.fromJson(item),
        )
        .toList();

    return provinsi;
  } else {
    throw "Unable to retrieve data.";
  }
}

Future<Vaksin> fetchVaksin() async {
  await Future.delayed(Duration(seconds: 1));
  final response =
      await http.get(Uri.https('vaksincovid19-api.vercel.app', 'api/vaksin'));
  if (response.statusCode == 200) {
    return Vaksin.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load data vaksin');
  }
}

Future<List<Hospital>> fetchHospital() async {
  await Future.delayed(Duration(seconds: 1));

  final res = await http
      .get(Uri.https('dekontaminasi.com', 'api/id/covid19/hospitals'));

  if (res.statusCode == 200) {
    List<dynamic> body = jsonDecode(res.body);

    List<Hospital> hospital = body
        .map(
          (dynamic item) => Hospital.fromJson(item),
        )
        .toList();

    return hospital;
  } else {
    throw "Unable to retrieve data.";
  }
}
