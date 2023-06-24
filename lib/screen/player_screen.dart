import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:velocity_x/velocity_x.dart';

class PlayerScreen extends StatefulWidget {
  const PlayerScreen({super.key});

  @override
  State<PlayerScreen> createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayerScreen> {

  late VideoPlayerController controller;
  ChewieController? chewieController;

  Future<void> loadVideoPlayer() async {
    controller = VideoPlayerController.network("https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4");

    await Future.wait([
      controller.initialize()
    ]
    );

    chewieController = ChewieController(
      videoPlayerController: controller,
      autoPlay: false,
      looping: false,
    );
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    loadVideoPlayer();
  }

  @override
  void dispose() {
    controller.dispose();
    chewieController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: const Text('Video Player',style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.redAccent,
      ),
      body: Column(
        children: [
          Expanded(child: Center(
            child: chewieController!=null && 
            chewieController!.videoPlayerController.value.isInitialized ? 
            Chewie(controller: chewieController!)
            : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircularProgressIndicator(),
                12.heightBox,
                const Text('Loading')
              ],
            )
          )
          )
        ],
      ),
    );
  }
}