import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: Center(
        child: GoogleMap(
          mapType: MapType.hybrid,
          initialCameraPosition: controller.kGooglePlex,
          onMapCreated: (GoogleMapController _) {
            controller.mapController.complete(_);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: controller.goToTheLake,
        label: Text('To the lake!'),
        icon: Icon(Icons.directions_boat),
      ),
    );
  }
}
