import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:ui' as ui;

// Advisory class information
class Advisory {
  final String fNation;
  final String wSystem;
  final String population;
  final String lat;
  final String lng;
  final String id;
  final String advType;
  final String ephoRec;
  final String dteAdvLift;
  final String advDate;

  const Advisory(
      {required this.fNation,
      required this.wSystem,
      required this.population,
      required this.lat,
      required this.lng,
      required this.id,
      required this.advType,
      required this.ephoRec,
      required this.dteAdvLift,
      required this.advDate});

  factory Advisory.fromJson(Map<String, dynamic> json) {
    return Advisory(
        fNation: json['First Nation'] as String,
        wSystem: json['Water System Name'] as String,
        population: json['Population'] as String,
        lat: json['Latitude'] as String,
        lng: json['Longitude'] as String,
        id: json['ID'] as String,
        advType: json['Type of advisory'] as String,
        ephoRec: json['EPHO recommendation to lift'] as String,
        dteAdvLift: json['Date Advisory Lifted'] as String,
        advDate: json['Date Advisory Set'] as String);
  }
}

// advisory list class -> used to parse json
class AdvisoriesList {
  final List<Advisory> advisories;

  AdvisoriesList({required this.advisories});

  factory AdvisoriesList.fromJson(List<dynamic> parsedJson) {
    List<Advisory> advisories = <Advisory>[];
    advisories = parsedJson.map((i) => Advisory.fromJson(i)).toList();

    return AdvisoriesList(advisories: advisories);
  }
}

// map location checker
Future<LatLng> checkLocationPermission() async {
  await Geolocator.requestPermission();
  Position? position = await Geolocator.getLastKnownPosition();

  return position == null
      ? const LatLng(52.50597, -100.87052)
      : LatLng(position.latitude, position.longitude);
}

// load json file
Future<String> readItemJson() async {
  return await rootBundle.loadString('assets/result.json');
}

// parse json file
Future loadItem() async {
  String jsonString = await readItemJson();
  final jsonResponse = json.decode(jsonString);
  AdvisoriesList advisoriesList = AdvisoriesList.fromJson(jsonResponse);

  return advisoriesList;
}

// get marker image
Future<Uint8List> getBytesFromAsset(String path, int width) async {
  ByteData data = await rootBundle.load(path);
  ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
      targetWidth: width);
  ui.FrameInfo fi = await codec.getNextFrame();
  return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
      .buffer
      .asUint8List();
}
