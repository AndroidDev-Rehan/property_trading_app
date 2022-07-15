import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:property_trading_app/view/map/mapscreen.dart';

import '../../utils/app-color.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late GoogleMapController _controller;
  static CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(33.7295, 73.0372),
    zoom: 14.4746,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Buy Now',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: white),
        ),
        backgroundColor: darkMain,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'To Buy the file visit the Owner',
              style: TextStyle(
                  fontSize: 25, fontWeight: FontWeight.bold, color: darkMain),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Shah Faisal Ave, E-8, Islamabad, Islamabad Capital Territory 44000',
              style: TextStyle(fontSize: 20, color: darkMain),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Location',
              style: TextStyle(
                  fontSize: 25, fontWeight: FontWeight.bold, color: darkMain),
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: mainGolden, width: 2)),
              height: 180,
              child: Hero(
                tag: 'map',
                child: GoogleMap(
                  onTap: (pos) {
                    Get.to(() => const MapScreen());
                  },
                  mapType: MapType.normal,
                  initialCameraPosition: _kGooglePlex,
                  onMapCreated: (GoogleMapController controller) {
                    print("TEST LOADED");
                    _controller = controller;
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
