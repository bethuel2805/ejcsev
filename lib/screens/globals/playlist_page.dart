import 'package:ejcsev/screens/globals/souspages/videos_playlist_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:googleapis/youtube/v3.dart';
import 'package:googleapis_auth/auth_io.dart';

class PlayListPage extends StatefulWidget {
  const PlayListPage({Key? key}) : super(key: key);

  @override
  State<PlayListPage> createState() => _PlayListPageState();
}

class _PlayListPageState extends State<PlayListPage> {
  var apiKey = 'AIzaSyD2f7keTVvog-l-Kt_NWowb05FRwctg50k';
  //var channelId = 'UCeY0bbntWzzVIaj2z3QigXg';
  var channelId = 'UCDaIrBK-GVHEZPjJoRUrfVg';
  late final YouTubeApi youtube;

  List<Playlist> playlists = [];

  @override
  void initState() {
    super.initState();

    youtube = YouTubeApi(clientViaApiKey(apiKey));
    getPlaylists();
  }

  Future<void> getPlaylists() async {
    var playlists = await youtube.playlists.list(
        ['snippet', 'contentDetails', 'id'],
        channelId: channelId, maxResults: 25);
    setState(() {
      this.playlists = playlists.items ?? [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F7),
      appBar: AppBar(
        title: Text(
          "Playlists",
          style: GoogleFonts.openSans(fontWeight: FontWeight.bold),
        ),
        actions: [
          Container(
              margin: const EdgeInsets.only(right: 15),
              child: const Icon(
                Icons.video_collection,
                size: 30,
              ))
        ],
        elevation: 0.0,
      ),
      body: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 0,
        mainAxisSpacing: 0,
        childAspectRatio: 0.9,
        children: List.generate(playlists.length, (index) {
          final playlist = playlists[index];
          return Card(
            elevation: 3.0,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
            child: InkWell(
              onTap: () {
                print("${playlist.id}");
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => VideosPlaylistPage(playlistId: playlist.id.toString(),playlistTitle: playlist.snippet!.title.toString(),),));
              },
              child: Column(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(topRight: Radius.circular(5),topLeft: Radius.circular(5),),
                        image: DecorationImage(
                          image: NetworkImage(playlist.snippet?.thumbnails?.high?.url ?? '',),
                            fit: BoxFit.cover
                        )
                      ),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Text("${playlist.snippet?.title!.toUpperCase()}" ?? '',style: GoogleFonts.openSans(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,color: Color(0xFF303030)),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
