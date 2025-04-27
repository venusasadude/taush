import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';

class LogoVideo extends StatefulWidget {
  const LogoVideo({super.key});
  @override
  State<LogoVideo> createState() => _LogoVideoState();
}

class _LogoVideoState extends State<LogoVideo> {
  late final VideoPlayerController _ctrl;

  @override
  void initState() {
    super.initState();
    _ctrl = VideoPlayerController.asset('assets/videos/taush_logo.mp4')
      ..setLooping(true) // endless loop :contentReference[oaicite:5]{index=5}
      ..initialize().then((_) {
        setState(() {}); // refresh once ready
        _ctrl.play(); // autostart
      });
  }

  @override
  Widget build(BuildContext context) {
    if (!_ctrl.value.isInitialized) return const SizedBox.shrink();
    return SizedBox(
      height: kToolbarHeight * 0.6, // roughly 24 px on standard 40 px toolbar
      child: VideoPlayer(_ctrl), // no controls by default
    );
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }
}
