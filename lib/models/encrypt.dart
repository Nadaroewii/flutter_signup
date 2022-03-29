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

  Encrypt.fromJson(Map<String, dynamic> json) :
        duration = json['duration'],
        distance = json['distance'],
        dataactv = json['dataactv'],
        kal = json['kal'],
        lastlatitude = json['lastlatitude'],
        lastlongitude = json['lastlongitude'];
  }
