import 'dart:async';

import 'package:flutter/material.dart';

import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Itinerary extends StatefulWidget {
  const Itinerary({super.key});

  @override
  State<Itinerary> createState() => _ItineraryState();
}

class _ItineraryState extends State<Itinerary> {
  Completer<GoogleMapController> _controller = Completer();
  //variable
  var itineraire = [
    "Cocody-carrefour la vie",
    "Adjamé-Forum",
    "Plateau-cité administrative",
    "Yopougon-cosmos",
    "Koumassi-grand carrefour",
    "Treichville-palais des sports",
    "Abobo-mairie "
  ];
  String? depart;
  String? destination;
  String? place;

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(5.3484342, -4.119753),
    zoom: 14.4746,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  // ignore: dead_code
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(children: [
        GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: _kGooglePlex,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        ),
        //fin carte map

        Positioned(
            top: 0,
            width: width,
            height: 200,
            child: Container(
              color: Colors.transparent,
              child: ListView(
                children: [
                  Container(
                    margin: EdgeInsets.all(15),
                    child: Column(
                      children: [
                        //Dropdown
                        Container(
                          color: Colors.white,
                          child: DropdownButtonFormField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  hintText: "Point de départ",
                                  hintStyle: TextStyle(color: Colors.black)),
                              value: place,
                              items: itineraire
                                  .map((e) => DropdownMenuItem(
                                        child: Text(e),
                                        value: e,
                                      ))
                                  .toList(),
                              onChanged: (val) {
                                setState(() {
                                  depart = val as String;
                                });
                                print(depart);
                              }),
                        ),

                        SizedBox(height: 10),

                        Container(
                          color: Colors.white,
                          child: DropdownButtonFormField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  hintText: "Destination",
                                  hintStyle: TextStyle(color: Colors.black)),
                              value: place,
                              items: itineraire
                                  .map((e) => DropdownMenuItem(
                                        child: Text(e),
                                        value: e,
                                      ))
                                  .toList(),
                              onChanged: (val) {
                                setState(() {
                                  destination = val as String;
                                });
                                print(destination);
                              }),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )),
        Positioned(
            bottom: 0,
            child: Container(
                color: Colors.transparent,
                width: width,
                height: 100,
                child: Center(
                  child: ElevatedButton(
                    child: const Text(
                      "Afficher les moyens disponibles",
                      style:
                          TextStyle(color: Color.fromARGB(255, 151, 149, 243)),
                    ),
                    style: ElevatedButton.styleFrom(
                        shape: StadiumBorder(),
                        backgroundColor: Colors.white,
                        // ignore: prefer_const_constructors
                        side: BorderSide(color: Color(0xff403E9F))),
                    onPressed: () {
                      //Bottom sheet
                      showModalBottomSheet<void>(
                        context: context,
                        builder: (BuildContext context) {
                          return Container(
                            height: height,
                            color: Colors.white,
                            child: Center(
                              child: Column(
                                children: <Widget>[
                                  Text("Itinéraire"),
                                  Text("$depart ==> $destination"),
                                  Spacer(),
                                  ElevatedButton(
                                    child: const Text('Voir itinéraire'),
                                    onPressed: () {},
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );

                      //end bottom sheet
                    },
                  ),
                ))),
      ]),
    );

    //Les fonctions
    Future<void> _goToTheLake() async {
      final GoogleMapController controller = await _controller.future;
      controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
    }

    //Bottomsheet
  }
}
