import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(10.0),
                  color: Colors.lightBlueAccent,
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 2.9,
                  child: Center(
                    child: Image.asset("assets/images/login_toff.png"),
                  ),
                ),
          SizedBox(height: 17.0,),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.all(20.0),
                child:RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                                style:
                                    GoogleFonts.openSans(color: Colors.black, fontSize: 17),
                                children: [
                                  const TextSpan(text: "A PROPOS DE EJCSEV\n"),
                                  const TextSpan(text: "\n"),
                                  TextSpan(text: "Notre Vision\n",style: GoogleFonts.openSans(fontWeight: FontWeight.bold)),
                                  const TextSpan(text: "\n"),
                                  const TextSpan(text: "L'éternel déclara dans Mathieu au Chapitre 28: 19-20\n"),
                                  const TextSpan(text: '\n'),
                                  const TextSpan(
                                      text:
                                          "Allez faites de toutes les nations des disciples, les baptisant au nom du "),
                                  TextSpan(text: 'Père, du Fils et du Saint Esprit...\n',style: GoogleFonts.openSans(fontWeight: FontWeight.bold)),
                                  const TextSpan(text: '\n'),
                                  const TextSpan(
                                      text:
                                          "Puisse cette demande de l'éternel soit une source de lumière pour vous qui recevrer le  "),
                                  TextSpan(
                                      text: "Seigneur Jésus Christ ",
                                      style: GoogleFonts.openSans(
                                          fontWeight: FontWeight.bold)),
                                  const TextSpan(text: " dans vos vie. "),
                                  const TextSpan(
                                      text:
                                          "Imaginez Dieu vous répondre en vous attirant près de lui et en vous étreignant dans sa grâce!\n"),
                                  const TextSpan(
                                      text:
                                          "Son désir est de vous faire connaître sa présence, il est un Dieu de proximité. Imaginez qu’il vous sourit de plaisir et qu’il est rempli d’affection pour vous, alors même qu’il vous bénit.\n"),
                                  const TextSpan(text: '\n'),
                                  const TextSpan(
                                      text:
                                          "Que la vraie paix qui ne vient que de Dieu, vous accompagne, celle qui offre une plénitude intérieure quelles que soient les circonstances.\n"),
                                ]),
                          ),
                ),
            ),
          ),
              ],
            ),
          Positioned(
            top: 30,
              left: 0,
              width: 100,
              child: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back,color: Colors.white,size: 30),
          ),),
        ],
      ),
    );
  }
}
