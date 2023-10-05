import 'dart:async';
import 'package:carousel_nullsafety/carousel_nullsafety.dart';
import 'package:ejcsev/screens/globals/souspages/map_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ProgrammePage extends StatefulWidget {
  const ProgrammePage({Key? key}) : super(key: key);

  @override
  State<ProgrammePage> createState() => _ProgrammePageState();
}

class _ProgrammePageState extends State<ProgrammePage> {
  final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();

  String valueT = "pointe-noire";

  List programList = [];

  List<Map<String, dynamic>> listPosition = [
    {
      "annexeName": "Pointe-Noire",
      "annexeProgram": [
        "slide4.png",
        "slide5.png",
        "slide6.png",
      ],
      "annexeMap": {
        "lat": -4.8176264,
        "long": 11.8695326,
      },
    },
    {
      "annexeName": "Paris",
      "annexeProgram": [
        "pro_4.jpg",
        "slider1.jpg",
        "slider2.jpg",
      ],
      "annexeMap": {
        "lat": 48.8583764,
        "long": 2.142055,
      },
    },
    {
      "annexeName": "Oyo",
      "annexeProgram": [
        "slide444.png",
        "slide55.png",
        "slide1.png",
        "pro_3.jpg"
      ],
      "annexeMap": {
        "lat": -4.2615394,
        "long": 15.2120594,
      },
    },
  ];
  double lat = 0.0;
  double long = 0.0;
  String annexeName = "";
  int i = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Programmes",
          style: GoogleFonts.openSans(fontWeight: FontWeight.bold),
        ),
        elevation: 0.0,
        actions: [
          Container(
              margin: const EdgeInsets.only(right: 15),
              child: const Icon(
                Icons.calendar_month,
                size: 30,
              ))
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              // color: Colors.grey
            ),
            height: 50,
            margin: const EdgeInsets.only(top: 10, left: 5.0, right: 10),
            child: Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(5.0)),
              child: DropdownButton(
                enableFeedback: true,
                borderRadius: BorderRadius.zero,
                underline: const Text(""),
                hint: const Text(
                  "Selectionner une region",
                  style: TextStyle(color: Colors.black),
                ),
                isExpanded: true,
                value: valueT,
                icon: const Icon(Icons.location_on_sharp),
                items: List.generate(
                  listPosition.length,
                  (index) {
                    switch (valueT) {
                      case "pointe-noire":
                        setState(() {
                          i = 0;
                          programList = listPosition[0]["annexeProgram"];
                          lat = listPosition[0]["annexeMap"]["lat"];
                          long = listPosition[0]["annexeMap"]["long"];
                          annexeName = listPosition[0]["annexeName"];
                          print("La liste de Pn : $programList");
                        });
                        break;
                      case "paris":
                        setState(() {
                          i = 1;
                          programList = listPosition[1]["annexeProgram"];
                          lat = listPosition[1]["annexeMap"]["lat"];
                          long = listPosition[1]["annexeMap"]["long"];
                          annexeName = listPosition[1]["annexeName"];
                          print("La liste de Paris : $programList");
                        });
                        break;
                      case "oyo":
                        setState(() {
                          i = 2;
                          programList = listPosition[2]["annexeProgram"];
                          lat = listPosition[2]["annexeMap"]["lat"];
                          long = listPosition[2]["annexeMap"]["long"];
                          annexeName = listPosition[2]["annexeName"];
                          print("La liste de oyo : $programList");
                        });
                        break;
                      default:
                        setState(() {
                          i = 0;
                          programList = listPosition[0]["annexeProgram"];
                          lat = listPosition[0]["annexeMap"]["lat"];
                          long = listPosition[0]["annexeMap"]["long"];
                          annexeName = listPosition[0]["annexeName"];
                          print("La liste de Pn : $programList");
                        });
                    }
                    return DropdownMenuItem(
                      child: Text("${listPosition[index]["annexeName"]}"),
                      value:
                          "${listPosition[index]["annexeName"].toString().toLowerCase()}",
                    );
                  },
                ),
                onChanged: (value) {
                  setState(() {
                    valueT = value!;
                    print("la valeur actuel est de : $valueT");
                  });
                },
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10, bottom: 10, left: 10),
            child: Text(
              "Nos activités hebdomadaires",
              style: GoogleFonts.openSans(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.start,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 2),
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 3.8,
            child: const Carousel(
              boxFit: BoxFit.fill,
              // images: List.generate(programList.length, (index) {
              //   return AssetImage("assets/images/${programList[0]}");
              // }),
              images: [
                AssetImage("assets/images/pro_1.jpg"),
                AssetImage("assets/images/pro_2.jpg"),
                AssetImage("assets/images/pro_3.jpg"),
                AssetImage("assets/images/pro_4.jpg"),
                AssetImage("assets/images/pro_5.jpg"),
              ],
              showIndicator: false,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
              child: Column(
                children: [
                  i == 0 ? Expanded(child: SizedBox(
              child: GoogleMap(
              markers: Set.of([
                  Marker(
                  markerId: MarkerId("Pointe - Noire"),
            position: LatLng(-4.8176264, 11.8695326),
            infoWindow: InfoWindow(
              title: "EJCSEV",
              snippet: "Pointe - Noire",
            ),
          ),
        ]),
      mapType: MapType.normal,
      initialCameraPosition: CameraPosition(
        target: LatLng(-4.8176264, 11.8695326),
        zoom: 10.643167,
      ),
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
    ),
    ),) : Container(),

                  i == 1 ? Expanded(child: SizedBox(
                    child: GoogleMap(
                      markers: Set.of([
                        Marker(
                          markerId: MarkerId("Paris"),
                          position: LatLng(48.8583764, 2.142055),
                          infoWindow: InfoWindow(
                            title: "EJCSEV",
                            snippet: "Paris",
                          ),
                        ),
                      ]),
                      mapType: MapType.normal,
                      initialCameraPosition: CameraPosition(
                        target: LatLng(48.8583764, 2.142055),
                        zoom: 10.643167,
                      ),
                      onMapCreated: (GoogleMapController controller) {
                        _controller.complete(controller);
                      },
                    ),
                  ),) : Container(),

                  i == 2 ? Expanded(child: SizedBox(
                    child: GoogleMap(
                      markers: Set.of([
                        Marker(
                          markerId: MarkerId("Oyo"),
                          position: LatLng(-4.2615394, 15.2120594),
                          infoWindow: InfoWindow(
                            title: "EJCSEV",
                            snippet: "Oyo",
                          ),
                        ),
                      ]),
                      mapType: MapType.normal,
                      initialCameraPosition: CameraPosition(
                        target: LatLng(-4.2615394, 15.2120594),
                        zoom: 10.643167,
                      ),
                      onMapCreated: (GoogleMapController controller) {
                        _controller.complete(controller);
                      },
                    ),
                  ),) : Container(),
                ],
              )
            ,),
          // Expanded(
          //   child: SizedBox(
          //     child: GoogleMap(
          //       markers: Set.of([
          //         Marker(
          //           markerId: MarkerId(annexeName),
          //           position: LatLng(lat, long),
          //           infoWindow: InfoWindow(
          //             title: "EJCSEV",
          //             snippet: annexeName,
          //           ),
          //         ),
          //       ]),
          //       mapType: MapType.normal,
          //       initialCameraPosition: CameraPosition(
          //         target: LatLng(lat, long),
          //         zoom: 10.643167,
          //       ),
          //       onMapCreated: (GoogleMapController controller) {
          //         _controller.complete(controller);
          //       },
          //     ),
          //   ),
          // ),
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton.extended(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MapPage(
                        city: annexeName,
                        lat: lat,
                        long: long,
                        zoom: 10.643167),
                  ));
            },
            label: const Text("Agrandir"),
          ),
        ],
      ),
    );
  }
}
