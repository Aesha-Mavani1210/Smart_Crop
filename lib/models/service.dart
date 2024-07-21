import 'dart:convert';

class Service {
  final String name;
  final String image;

  const Service ({
   required this.name,
   required this.image,
});
}


class News {
  final String name;
  final String image;

  const News ({
    required this.name,
    required this.image,
  });
}

WeatherDataModel weatherDataModelFromJson(String str) => WeatherDataModel.fromJson(json.decode(str));

String weatherDataModelToJson(WeatherDataModel data) => json.encode(data.toJson());

class WeatherDataModel {
  int? queryCost;
  double? latitude;
  double? longitude;
  String? resolvedAddress;
  String? address;
  String? timezone;
  double? tzoffset;
  String? description;
  List<CurrentConditions>? days;
  List<dynamic>? alerts;
  Stations? stations;
  CurrentConditions? currentConditions;

  WeatherDataModel({
    this.queryCost,
    this.latitude,
    this.longitude,
    this.resolvedAddress,
    this.address,
    this.timezone,
    this.tzoffset,
    this.description,
    this.days,
    this.alerts,
    this.stations,
    this.currentConditions,
  });

  factory WeatherDataModel.fromJson(Map<String, dynamic> json) => WeatherDataModel(
    queryCost: json["queryCost"],
    latitude: json["latitude"]?.toDouble(),
    longitude: json["longitude"]?.toDouble(),
    resolvedAddress: json["resolvedAddress"],
    address: json["address"],
    timezone: json["timezone"],
    tzoffset: json["tzoffset"]?.toDouble(),
    description: json["description"],
    days: json["days"] == null ? [] : List<CurrentConditions>.from(json["days"]!.map((x) => CurrentConditions.fromJson(x))),
    alerts: json["alerts"] == null ? [] : List<dynamic>.from(json["alerts"]!.map((x) => x)),
    stations: json["stations"] == null ? null : Stations.fromJson(json["stations"]),
    currentConditions: json["currentConditions"] == null ? null : CurrentConditions.fromJson(json["currentConditions"]),
  );

  Map<String, dynamic> toJson() => {
    "queryCost": queryCost,
    "latitude": latitude,
    "longitude": longitude,
    "resolvedAddress": resolvedAddress,
    "address": address,
    "timezone": timezone,
    "tzoffset": tzoffset,
    "description": description,
    "days": days == null ? [] : List<dynamic>.from(days!.map((x) => x.toJson())),
    "alerts": alerts == null ? [] : List<dynamic>.from(alerts!.map((x) => x)),
    "stations": stations?.toJson(),
    "currentConditions": currentConditions?.toJson(),
  };
}

class CurrentConditions {
  String? datetime;
  int? datetimeEpoch;
  double? temp;
  double? feelslike;
  double? humidity;
  double? dew;
  double? precip;
  double? precipprob;
  double? snow;
  double? snowdepth;
  dynamic preciptype;
  double? windgust;
  double? windspeed;
  double? winddir;
  double? pressure;
  double? visibility;
  double? cloudcover;
  double? solarradiation;
  double? solarenergy;
  double? uvindex;
  String? conditions;
  String? icon;
  List<String>? stations;
  String? source;
  String? sunrise;
  int? sunriseEpoch;
  String? sunset;
  int? sunsetEpoch;
  double? moonphase;
  double? tempmax;
  double? tempmin;
  double? feelslikemax;
  double? feelslikemin;
  double? precipcover;
  double? severerisk;
  String? description;
  List<CurrentConditions>? hours;

  CurrentConditions({
    this.datetime,
    this.datetimeEpoch,
    this.temp,
    this.feelslike,
    this.humidity,
    this.dew,
    this.precip,
    this.precipprob,
    this.snow,
    this.snowdepth,
    this.preciptype,
    this.windgust,
    this.windspeed,
    this.winddir,
    this.pressure,
    this.visibility,
    this.cloudcover,
    this.solarradiation,
    this.solarenergy,
    this.uvindex,
    this.conditions,
    this.icon,
    this.stations,
    this.source,
    this.sunrise,
    this.sunriseEpoch,
    this.sunset,
    this.sunsetEpoch,
    this.moonphase,
    this.tempmax,
    this.tempmin,
    this.feelslikemax,
    this.feelslikemin,
    this.precipcover,
    this.severerisk,
    this.description,
    this.hours,
  });

  factory CurrentConditions.fromJson(Map<String, dynamic> json) => CurrentConditions(
    datetime: json["datetime"],
    datetimeEpoch: json["datetimeEpoch"],
    temp: json["temp"]?.toDouble(),
    feelslike: json["feelslike"]?.toDouble(),
    humidity: json["humidity"]?.toDouble(),
    dew: json["dew"]?.toDouble(),
    precip: json["precip"]?.toDouble(),
    precipprob: json["precipprob"]?.toDouble(),
    snow: json["snow"]?.toDouble(),
    snowdepth: json["snowdepth"]?.toDouble(),
    preciptype: json["preciptype"],
    windgust: json["windgust"]?.toDouble(),
    windspeed: json["windspeed"]?.toDouble(),
    winddir: json["winddir"]?.toDouble(),
    pressure: json["pressure"]?.toDouble(),
    visibility: json["visibility"]?.toDouble(),
    cloudcover: json["cloudcover"]?.toDouble(),
    solarradiation: json["solarradiation"]?.toDouble(),
    solarenergy: json["solarenergy"]?.toDouble(),
    uvindex: json["uvindex"]?.toDouble(),
    conditions: json["conditions"],
    icon: json["icon"],
    stations: json["stations"] == null ? [] : List<String>.from(json["stations"]!.map((x) => x)),
    source: json["source"],
    sunrise: json["sunrise"],
    sunriseEpoch: json["sunriseEpoch"],
    sunset: json["sunset"],
    sunsetEpoch: json["sunsetEpoch"],
    moonphase: json["moonphase"]?.toDouble(),
    tempmax: json["tempmax"],
    tempmin: json["tempmin"]?.toDouble(),
    feelslikemax: json["feelslikemax"]?.toDouble(),
    feelslikemin: json["feelslikemin"]?.toDouble(),
    precipcover: json["precipcover"]?.toDouble(),
    severerisk: json["severerisk"]?.toDouble(),
    description: json["description"],
    hours: json["hours"] == null ? [] : List<CurrentConditions>.from(json["hours"]!.map((x) => CurrentConditions.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "datetime": datetime,
    "datetimeEpoch": datetimeEpoch,
    "temp": temp,
    "feelslike": feelslike,
    "humidity": humidity,
    "dew": dew,
    "precip": precip,
    "precipprob": precipprob,
    "snow": snow,
    "snowdepth": snowdepth,
    "preciptype": preciptype,
    "windgust": windgust,
    "windspeed": windspeed,
    "winddir": winddir,
    "pressure": pressure,
    "visibility": visibility,
    "cloudcover": cloudcover,
    "solarradiation": solarradiation,
    "solarenergy": solarenergy,
    "uvindex": uvindex,
    "conditions": conditions,
    "icon": icon,
    "stations": stations == null ? [] : List<dynamic>.from(stations!.map((x) => x)),
    "source": source,
    "sunrise": sunrise,
    "sunriseEpoch": sunriseEpoch,
    "sunset": sunset,
    "sunsetEpoch": sunsetEpoch,
    "moonphase": moonphase,
    "tempmax": tempmax,
    "tempmin": tempmin,
    "feelslikemax": feelslikemax,
    "feelslikemin": feelslikemin,
    "precipcover": precipcover,
    "severerisk": severerisk,
    "description": description,
    "hours": hours == null ? [] : List<dynamic>.from(hours!.map((x) => x.toJson())),
  };
}

class Stations {
  Vabv? vabv;

  Stations({
    this.vabv,
  });

  factory Stations.fromJson(Map<String, dynamic> json) => Stations(
    vabv: json["VABV"] == null ? null : Vabv.fromJson(json["VABV"]),
  );

  Map<String, dynamic> toJson() => {
    "VABV": vabv?.toJson(),
  };
}

class Vabv {
  double? distance;
  double? latitude;
  double? longitude;
  int? useCount;
  String? id;
  String? name;
  int? quality;
  double? contribution;

  Vabv({
    this.distance,
    this.latitude,
    this.longitude,
    this.useCount,
    this.id,
    this.name,
    this.quality,
    this.contribution,
  });

  factory Vabv.fromJson(Map<String, dynamic> json) => Vabv(
    distance: json["distance"]?.toDouble(),
    latitude: json["latitude"]?.toDouble(),
    longitude: json["longitude"]?.toDouble(),
    useCount: json["useCount"],
    id: json["id"],
    name: json["name"],
    quality: json["quality"],
    contribution: json["contribution"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "distance": distance,
    "latitude": latitude,
    "longitude": longitude,
    "useCount": useCount,
    "id": id,
    "name": name,
    "quality": quality,
    "contribution": contribution,
  };
}
