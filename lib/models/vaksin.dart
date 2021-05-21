import 'dart:convert';

Vaksin vaksinFromJson(String str) => Vaksin.fromJson(json.decode(str));

String vaksinToJson(Vaksin data) => json.encode(data.toJson());

class Vaksin {
  Vaksin({
    this.totalsasaran,
    this.sasaranvaksinsdmk,
    this.sasaranvaksinlansia,
    this.sasaranvaksinpetugaspublik,
    this.vaksinasi1,
    this.vaksinasi2,
    this.lastUpdate,
  });

  int totalsasaran;
  int sasaranvaksinsdmk;
  int sasaranvaksinlansia;
  int sasaranvaksinpetugaspublik;
  int vaksinasi1;
  int vaksinasi2;
  DateTime lastUpdate;

  factory Vaksin.fromJson(Map<String, dynamic> json) => Vaksin(
        totalsasaran: json["totalsasaran"],
        sasaranvaksinsdmk: json["sasaranvaksinsdmk"],
        sasaranvaksinlansia: json["sasaranvaksinlansia"],
        sasaranvaksinpetugaspublik: json["sasaranvaksinpetugaspublik"],
        vaksinasi1: json["vaksinasi1"],
        vaksinasi2: json["vaksinasi2"],
        lastUpdate: DateTime.parse(json["lastUpdate"]),
      );

  Map<String, dynamic> toJson() => {
        "totalsasaran": totalsasaran,
        "sasaranvaksinsdmk": sasaranvaksinsdmk,
        "sasaranvaksinlansia": sasaranvaksinlansia,
        "sasaranvaksinpetugaspublik": sasaranvaksinpetugaspublik,
        "vaksinasi1": vaksinasi1,
        "vaksinasi2": vaksinasi2,
        "lastUpdate": lastUpdate.toIso8601String(),
      };
}
