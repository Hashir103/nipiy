import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/services.dart';
import 'package:nipiy/widgets/advisory_parse.dart';
import 'package:nipiy/widgets/widget_info.dart';

void main() {
  runApp(const MapPage());
}

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  String _mapStyle = '';

  @override
  void initState() {
    super.initState();

    // load map style
    rootBundle.loadString('assets/map_style.txt').then((string) {
      _mapStyle = string;
    });
  }

  final Map<String, Marker> _markers = {};

  Future<void> _onMapCreated(GoogleMapController controller) async {
    // variables needed for map info
    GoogleMapController mapController = controller;
    final AdvisoriesList advisoriesList = await loadItem();
    final Uint8List blueAdv =
        await getBytesFromAsset('assets/bluemarker.png', 100);
    final Uint8List redAdv =
        await getBytesFromAsset('assets/redmarker.png', 100);
    final Uint8List yellowAdv =
        await getBytesFromAsset('assets/yellowmarker.png', 100);

    mapController.setMapStyle(_mapStyle);
    setState(() {
      _markers.clear();

      // set each marker
      for (final advisory in advisoriesList.advisories) {
        final Uint8List setMarker;
        String status;
        String advisoryIconStr;
        String dateUpdate;

        // check advisory type
        if (advisory.dteAdvLift != '') {
          // no advisory -> green marker
          status = 'NO ADVISORY';
          setMarker = blueAdv;
          advisoryIconStr = 'assets/blueStatus.png';
          dateUpdate = advisory.dteAdvLift;
        } else if (advisory.ephoRec != '') {
          // advisory lift recommendation -> yellow marker
          status =
              '${advisory.advType} \n The EPHO has recommended to lift this advisory';
          setMarker = yellowAdv;
          dateUpdate = advisory.advDate;
          advisoryIconStr = 'assets/yellowStatus.png';
        } else {
          // advisory -> red marker
          status = advisory.advType.toUpperCase();
          setMarker = redAdv;
          advisoryIconStr = 'assets/redStatus.png';
          dateUpdate = advisory.advDate;
        }

        // create marker
        final marker = Marker(
          markerId: MarkerId(advisory.id),
          position:
              LatLng(double.parse(advisory.lat), double.parse(advisory.lng)),
          onTap: () {
            setState(() {
              // update info pill based on marker clicked
              showPill = 80;
              waterSystem = advisory.wSystem;
              firstNation = advisory.fNation;
              population = advisory.population;
              advisoryInfo = status;
              advisoryIcon = advisoryIconStr;
              advisoryDate = dateUpdate;
            });
          },
          icon: BitmapDescriptor.fromBytes(setMarker),
        );
        _markers[advisory.id] = marker;
      }
    });

    // change camera position to user location
    LatLng newLocation = await checkLocationPermission();

    mapController.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: newLocation, zoom: 6)));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.blue[700],
      ),
      home: Scaffold(
          body: Stack(
        children: [
          // google maps widget
          Positioned.fill(
              child: GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: const CameraPosition(
              target: LatLng(52.50597, -100.87052),
              zoom: 6,
            ),
            onTap: (argument) {
              setState(() {
                showPill = -1000;
              });
            },
            markers: _markers.values.toSet(),
            myLocationEnabled: true,
            compassEnabled: false,
            tiltGesturesEnabled: false,
          )),
          // info pill widget
          AnimatedPositioned(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
              left: 0,
              right: 0,
              bottom: showPill,
              // ignore: prefer_const_constructors
              child: infoPill())
        ],
      )),
    );
  }
}
