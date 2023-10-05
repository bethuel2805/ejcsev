import 'dart:async';
import 'dart:convert';
import 'package:ejcsev/screens/globals/souspages/live.dart';
import 'package:ejcsev/screens/globals/souspages/message_page.dart';
import 'package:ejcsev/screens/globals/souspages/no_live.dart';
import 'package:ejcsev/screens/globals/souspages/videos_playlist_page.dart';
import 'package:flutter/material.dart';
import 'package:carousel_nullsafety/carousel_nullsafety.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';

class DirectPage extends StatefulWidget {
  DirectPage({Key? key}) : super(key: key);

  @override
  State<DirectPage> createState() => _DirectPageState();
}

class _DirectPageState extends State<DirectPage> {
  String? code;
  List items = ["citation1.jpg", "citation2.jpg", "citation3.jpg"];
  String url =
      "https://api.airtable.com/v0/appO9A4qyRkO5HbJs/live?maxRecords=3&view=Grid%20view";
  Map<String, String> headers = {"Authorization": "Bearer key8goi88RW8ugb2B"};
  void getCode() async {
    var response = await http.get(Uri.parse(url), headers: headers);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      code = data["records"][0]["fields"]["code"];
      print(data);
      setState(() {});
    }
  }

  CodePass() {
    Timer(const Duration(seconds: 5), () {
      Navigator.pop(context);
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => code == null ? const NoLive() : Live(code: code!),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          width: 200,
          height: 97.83,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/logos_home.png"),
                fit: BoxFit.fill),
          ),
        ),
        elevation: 0.0,
        centerTitle: true,
        toolbarHeight: 70,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              color: Colors.red,
              height: 60,
              child: Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        child: Image.asset(
                      "assets/images/li.png",
                      width: 80,
                      height: 70,
                    )),
                    Container(
                      width: 190,
                      height: 30,
                      child: ElevatedButton(
                        style: const ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.white),
                            elevation: MaterialStatePropertyAll(0.0)),
                        onPressed: () {
                          getCode();
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0)),
                                content: SizedBox(
                                  height: 100,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Center(
                                        child: CircularProgressIndicator(
                                          backgroundColor: Colors.blue,
                                          color: Colors.white,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "Accès au live en cours...",
                                        style: GoogleFonts.openSans(
                                            color: const Color(0xFF303030),
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                          CodePass();
                        },
                        child: const Text(
                          "Suivre le direct",
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 4,
                      child: const Carousel(
                        images: [
                          AssetImage(
                            "assets/images/slider1.jpg",
                          ),
                          AssetImage(
                            "assets/images/slider2.jpg",
                          ),
                          AssetImage(
                            "assets/images/slide11.png",
                          ),
                        ],
                        animationDuration: Duration(seconds: 1),
                        boxFit: BoxFit.fill,
                        overlayShadow: false,
                        showIndicator: false,
                        animationCurve: Curves.easeOutQuad,
                      )),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 4,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/slide44x.jpg"),
                          fit: BoxFit.fill
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 20),
                          child: RichText(
                            textAlign: TextAlign.end,
                            text: const TextSpan(
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.blue,
                                ),
                                children: <TextSpan>[
                                  TextSpan(text: "Méssage de bienvenue \n"),
                                  TextSpan(
                                      text: "du Couple Pastoral ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blue)),
                                ]),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 20),
                          width: 190,
                          height: 30,
                          child: ElevatedButton(
                            style: const ButtonStyle(
                                elevation: MaterialStatePropertyAll(0.0)),
                            onPressed: () {
                               Navigator.of(context).push(MaterialPageRoute(builder: (context) => const MessagePage(),));
                            },
                            child: const Text(
                              "Lire",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 4,
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      image: DecorationImage(
                          image: AssetImage("assets/images/slide55.png"),
                          fit: BoxFit.fill),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 20),
                          child: RichText(
                            textAlign: TextAlign.end,
                            text: const TextSpan(
                                style: TextStyle(
                                  fontSize: 17,
                                ),
                                children: <TextSpan>[
                                  TextSpan(text: "Découvrez "),
                                  TextSpan(
                                      text:
                                          "l'oeuvre de DIEU \nau sein du Ministère ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                ]),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 20),
                          width: 190,
                          height: 30,
                          child: ElevatedButton(
                            style: const ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.white),
                                elevation: MaterialStatePropertyAll(0.0)),
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => VideosPlaylistPage(
                                  playlistTitle: "Témoignages",
                                  playlistId:
                                      "PLAeIvKzUZNRs67iOSzJTOs9y5bMt09DxL",
                                ),
                              ));
                            },
                            child: const Text(
                              "Suivre les témoignages",
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Stack(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height / 7.5,
                          child: Image.asset(
                            "assets/images/slide6.png",
                            height: 50,
                            fit: BoxFit.fill,
                          ),
                        ),
                        // Positioned(child: Icon(Icons.))
                      ],
                    ),
                  ),
                  SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 4,
                      child: FlutterCarousel(
                        items: List.generate(items.length, (index) => Card(
                          elevation: 5.0,
                          child: Container(
                            padding: const EdgeInsets.only(right: 40),
                            height: 100,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              image: DecorationImage(
                                image: AssetImage("assets/images/${items[index]}"),
                                fit: BoxFit.cover
                              )
                            ),
                          ),
                        )),
                        options: CarouselOptions(
                          autoPlayAnimationDuration: const Duration(seconds: 1),
                          autoPlayInterval: const Duration(seconds: 6),
                          autoPlay: true,
                          showIndicator: false,
                          padEnds: true,
                          enlargeCenterPage: false,
                          enableInfiniteScroll: true
                        ),
                      )
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
