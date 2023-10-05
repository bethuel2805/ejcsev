import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NoConnexion extends StatelessWidget {
  const NoConnexion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/no_connexion.png",
                width: 150,
              ),
              SizedBox(
                height: 15,
              ),
              const Text(
                "Pas de connexion internet",
                style: TextStyle(fontSize: 25),
              ),
              SizedBox(
                height: 10,
              ),
              TextButton(
                  onPressed: () {
                    SystemChannels.platform.invokeMethod('SystemNavigator.pop');
                  },
                  child: Text(
                    "Sortir",
                    style: TextStyle(color: Colors.red),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
