// To parse this JSON data, do
//
//     final hospital = hospitalFromJson(jsonString);

import 'dart:convert';

Hospital hospitalFromJson(String str) => Hospital.fromJson(json.decode(str));

String hospitalToJson(Hospital data) => json.encode(data.toJson());

class Hospital {
  Hospital({
    this.name,
    this.address,
    this.region,
    // required this.phone,
    this.province,
  });

  String name;
  String address;
  String region;
  // dynamic phone;
  String province;

  factory Hospital.fromJson(Map<String, dynamic> json) => Hospital(
        name: json["name"],
        address: json["address"],
        region: json["region"],
        // phone: json["phone"],
        province: json["province"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "address": address,
        "region": region,
        // "phone": phone,
        "province": province,
      };
}
