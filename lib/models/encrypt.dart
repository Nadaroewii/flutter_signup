import 'dart:convert';
Encrypt dataEncryptFromJson(String str) => Encrypt.fromJson(json.decode(str));

String dataEncryptToJson(Encrypt encrypt) => json.encode(encrypt.toJson());

class Encrypt {
  String duration;
  double distance;
  String dataactv;
  String kal;
  double lastlatitude;
  double lastlongitude;


  Encrypt({
    required this.duration,
    required this.distance,
    required this.dataactv,
    required this.kal,
    required this.lastlatitude,
    required this.lastlongitude
  });

  factory Encrypt.fromJson(Map<String, dynamic> json) => Encrypt(
        duration : json['duration'],
        distance : json['distance'],
        dataactv : json['dataactv'],
        kal : json['kal'],
        lastlatitude : json['lastlatitude'],
        lastlongitude : json['lastlongitude']
  );

  Map<String, dynamic> toJson() => {
    "duration": duration,
    "distance": distance,
    "dataactv" : dataactv,
    "kal" : kal,
    "lastlatitude" : lastlatitude,
    "lastlongitude" : lastlongitude
  };
  }
