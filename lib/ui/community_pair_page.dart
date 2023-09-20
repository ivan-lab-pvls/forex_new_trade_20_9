import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trading_app/models/community_model.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class CommunityDetailsPage extends StatefulWidget {
  final CommunityView community;
  const CommunityDetailsPage({
    super.key,
    required this.community,
  });

  @override
  State<CommunityDetailsPage> createState() => _CommunityDetailsPageState();
}

class _CommunityDetailsPageState extends State<CommunityDetailsPage> {
  late final YoutubePlayerController _youtubePlayerController;

  @override
  void initState() {
    _youtubePlayerController = YoutubePlayerController(
      initialVideoId: widget.community.videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      builder: (context, player) => Scaffold(
        backgroundColor: const Color.fromARGB(255, 27, 72, 18),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 27, 72, 18),
          elevation: 0,
        ),
        body: SafeArea(
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
                child: player,
              ),
              const SizedBox(height: 16),
              Text(
                "by ${widget.community.author}",
                style: GoogleFonts.dmSans(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                widget.community.title,
                style: GoogleFonts.dmSans(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                widget.community.description,
                style: GoogleFonts.dmSans(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
      player: YoutubePlayer(
        controller: _youtubePlayerController,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _youtubePlayerController.dispose();
  }
}
