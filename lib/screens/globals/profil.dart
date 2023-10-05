import 'package:ejcsev/screens/globals/souspages/about.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share/share.dart';
import '../../widgets/founctions.dart';

class ProfilPage extends StatefulWidget {
  ProfilPage({Key? key}) : super(key: key);

  @override
  State<ProfilPage> createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/background_login.png"),
                fit: BoxFit.fill)),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.white,
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                      height: MediaQuery.of(context).size.height / 2.9,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  "assets/images/background_login.png"),
                              fit: BoxFit.fill)),
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            CircleAvatar(
                              backgroundImage:
                                  AssetImage("assets/images/icon_app.jpg"),
                              radius: 60,
                            ),
                             SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: double.infinity,
                              alignment: Alignment.center,
                              padding:  EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                "Eglise Jesus Christ Source d'Eau Vie",
                                style:  TextStyle(
                                  fontSize: 25,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      )),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Container(
                            child: ListTile(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const AboutPage(),
                                ));
                              },
                              leading:const Icon(
                                Icons.info_outline,
                                color: Colors.lightBlueAccent,
                              ),
                              title: Text("A propos de EJCSEV"),
                            ),
                          ),
                          Divider(height: 10,color:Colors.black ,),
                          SizedBox(height: 10,),
                          Container(
                            child: ListTile(
                              onTap: () {
                                Share.share(
                                    'Altaïr VBA tu est trop bon. Respect');
                              },
                              leading: const Icon(
                                Icons.share,
                                color: Colors.lightBlueAccent,
                              ),
                              title: Text("Partager"),
                            ),
                          ),
                          Divider(height: 10,color: Colors.black,)
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Suivez nous sur : ",style: GoogleFonts.openSans(fontWeight: FontWeight.bold),),
                      SizedBox(width: 10,),
                      InkWell(
                        onTap: () =>
                            Fonction().goUrl(url: "https://www.youtube.com/@eglisejesus-christsourcede1603"),
                        child: Image.asset(
                          "assets/images/youtube_logo.png",
                          width: 35,
                        ),
                      ),
                      SizedBox(width: 10,),
                      InkWell(
                        onTap: () =>
                            Fonction().goUrl(url: "https://www.facebook.com/ejcsev"),
                        child: Image.asset(
                          "assets/images/facebook_logo.png",
                          width: 35,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
              // Positioned(
              //   right: 0,
              //   left: 0,
              //   bottom: MediaQuery.of(context).size.height/8,
              //   child: Padding(
              //     padding: const EdgeInsets.only(left: 30, right: 30),
              //     child: SizedBox(
              //       height: 40,
              //       width: MediaQuery.of(context).size.width,
              //       child: ElevatedButton.icon(
              //         style: ButtonStyle(
              //           elevation: MaterialStatePropertyAll(0.0),
              //           shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)))
              //         ),
              //         onPressed: () {
              //           Auths().logOut();
              //           Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginPage(),));
              //         },
              //         label:const Text(
              //           "Se déconnecter",
              //           style: TextStyle(fontSize: 18),
              //         ),
              //         icon:const Icon(
              //           Icons.logout,
              //           size: 25,
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
