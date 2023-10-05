import 'package:ejcsev/screens/globals/playlist_page.dart';
import 'package:ejcsev/screens/globals/profil.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'globals/direct_page.dart';
import 'globals/programme_page.dart';

class GlobalApp extends StatefulWidget {
  const GlobalApp({Key? key}) : super(key: key);

  @override
  State<GlobalApp> createState() => _GlobalAppState();
}

class _GlobalAppState extends State<GlobalApp> {
  int i = 0;
  void clicked(int j) {
    setState(() {
      i = j;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          i == 0 ? Expanded(child: DirectPage()) : Container(),
          i == 1 ? Expanded(child: PlayListPage()) : Container(),
          i == 2 ? const Expanded(child: ProgrammePage()) : Container(),
          i == 3 ? Expanded(child: ProfilPage()) : Container(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: i,
        onTap: clicked,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_filled), label: "Acceuil"),
          BottomNavigationBarItem(
              icon: Icon(Icons.video_collection), label: "Playlists"),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month), label: "Programme"),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: "Parametres"),
        ],
      ),
    );
  }
}
