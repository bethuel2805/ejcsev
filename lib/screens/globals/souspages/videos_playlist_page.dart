import 'dart:convert';
import 'package:ejcsev/screens/globals/souspages/page_view.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';

class  VideosPlaylistPage extends StatefulWidget {
  String playlistId;
  String playlistTitle;
   VideosPlaylistPage({Key? key,required this.playlistId,required this.playlistTitle}) : super(key: key);

  @override
  State<VideosPlaylistPage> createState() => _VideosPlaylistPageState();
}

class _VideosPlaylistPageState extends State<VideosPlaylistPage> {
  final apiKey = 'AIzaSyD2f7keTVvog-l-Kt_NWowb05FRwctg50k';
  final _playlistItems = <Map<String, dynamic>>[];
  final _scrollController = ScrollController();
  var _nextPageToken = '';

  @override
  void initState() {
    super.initState();
    _fetchPlaylistItems();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _fetchPlaylistItems() async {
    final url = Uri.https(
      'www.googleapis.com',
      '/youtube/v3/playlistItems',
      {
        'part': 'snippet',
        'playlistId': widget.playlistId,
        'maxResults': '50',
        'key': apiKey,
        'pageToken': _nextPageToken,
      },
    );

    final response = await http.get(url);

    final json = jsonDecode(response.body);

    setState(() {
      _playlistItems.addAll((json['items'] as List).map((item) {
        final snippet = item['snippet'];
        return {
          'videoId': snippet['resourceId']['videoId'].toString(),
          'title': snippet['title'].toString(),
          'description': snippet['description'].toString(),
          'thumbnailUrl': snippet['thumbnails']['high']['url'].toString(),
        };
      }));
      _nextPageToken = json['nextPageToken'] ?? '';
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      appBar: AppBar(
        title: Text(widget.playlistTitle,style: GoogleFonts.openSans(),),
        elevation: 0.0,
      ),
      body: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 0,
        mainAxisSpacing: 0,
        childAspectRatio: 0.9,
        children: List.generate(_playlistItems.length + 1, (index) {
          if (index < _playlistItems.length) {
            final video = _playlistItems[index];
            return Card(
              elevation: 3.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)
              ),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        PageViewVideo(ytInit: video["videoId"],videoName: video["title"],desc: video["description"],),
                  ));
                },
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(5.0),topRight: Radius.circular(5.0),),
                        child: Image.network(video['thumbnailUrl'])),
                    Expanded(
                      child: Center(
                        child: Text(
                          video['title'],
                          style: GoogleFonts.openSans(fontSize: 15,),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else if (_nextPageToken.isNotEmpty) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return const SizedBox();
          }
        }),
      ),
    );
  }
}