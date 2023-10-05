import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NoLive extends StatelessWidget {
  const NoLive({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title:const Text("Pas de direct "),
      ),
      body: Center(
        child: Column(
          children: [
            Image.asset("assets/images/no_living.png"),
            SizedBox(height: 10,),
            Text("Pas de Direct pour l'instant...",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),)
          ],
        ),
      ),
        );
  }
}
