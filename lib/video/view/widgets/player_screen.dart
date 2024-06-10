import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class PlayerScreen extends StatefulWidget {
  const PlayerScreen({super.key});

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  late VideoPlayerController _controller;
  late ChewieController chewieController;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(
        'https://caspian13.cdn.asset.aparat.com/aparat-video/ceef8e33737705e1cbfef8d96448efb559182390-480p.mp4?wmsAuthSign=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbiI6IjM0OGU4YjFmNjYzNmViYmE1OGZmOGY1NDU1ZWM1NmMyIiwiZXhwIjoxNzE3NTIzODgzLCJpc3MiOiJTYWJhIElkZWEgR1NJRyJ9.XuX8fN8CaJ5lD5VtSR41XRmPctyh5UNhrYS8H3BcM-M'))
      ..initialize().then((_) {
        setState(() {});
      });
    chewieController = ChewieController(videoPlayerController: _controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _controller.value.isInitialized
            ? AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: Chewie(
                  controller: chewieController,
                ),
              )
            : const CircularProgressIndicator(),
      ),
    );
  }
}
