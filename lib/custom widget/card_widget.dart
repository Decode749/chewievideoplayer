import 'package:chewievideoplayer/screen/player_screen.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:get/get.dart';

class CardWidget extends StatefulWidget {
  final snap;

  const CardWidget({super.key, required this.snap});

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Get.to(() =>  PlayerScreen(snap: widget.snap,));
        },
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(8)),
          padding: const EdgeInsets.all(8),
          height: 100,
          width: double.infinity,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8)),
                width: 120,
                child: AspectRatio(
                  aspectRatio: 4/3,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network("${widget.snap['thumbnail']}", fit: BoxFit.cover,),
                  ),
                ),
              ),
              12.widthBox,
              Expanded(child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(widget.snap['title']),
              )),
              IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
            ],
          ),
        ),
      ),
    );
  }
}
