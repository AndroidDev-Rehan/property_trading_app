import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nb_utils/nb_utils.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController _controller;
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(33.7295, 73.0372),
    zoom: 14.4746,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(body:  Stack(
      children: [
        Hero(tag: 'map',
          child: Container(
            height: Get.height,
            child: GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: _kGooglePlex,
              onMapCreated: (GoogleMapController controller) {
                print("TEST LOADED");
                _controller = controller;
              },
            ),
          ),
        ),
        Positioned(top:10,left: 10,child: IconButton(onPressed: (){Get.back();}, icon: const Icon(Icons.arrow_back,size: 30,color: black,)))
      ],
    )

    ,);
  }
}
