import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:flirtr/AppWidgets/iconBubbleWidget.dart';

class VideoWidget extends StatefulWidget {
  final String url;
  VideoWidget({@required this.url});

  @override
  _VideoWidgetState createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> with AutomaticKeepAliveClientMixin<VideoWidget>, SingleTickerProviderStateMixin{
  VideoPlayerController _controller;
  Future<void> _initialiseController;
  AnimationController playPauseController;

  @override
  void initState() {
    playPauseController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    _controller = VideoPlayerController.asset(widget.url);
    _initialiseController = _controller.initialize();
    _controller.addListener(() {
      if(_controller.value.position == _controller.value.duration) {
        _resetPlayback();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    super.build(context);
    return Container(
      width: MediaQuery.of(context).size.width * .90,
      child: FutureBuilder(
        future: _initialiseController,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Stack(
              fit: StackFit.expand,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(15.0),),
                  child: VideoPlayer(_controller),
                ),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      if(_controller.value.isPlaying) {
                        playPauseController.reverse(from: 1.0);
                        _controller.pause();
                      } else {
                        playPauseController.forward(from: 0.0);
                        _controller.play();
                      }
                    },
                    child: IconBubbleWidget(
                      widgetSize: Size(60, 60),
                      widgetChild: Center(
                        child: AnimatedIcon(
                          size: 30.0,
                          icon: AnimatedIcons.play_pause,
                          progress: CurvedAnimation(curve: Curves.bounceIn, parent: playPauseController),
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: VideoProgressIndicator(
                    _controller,
                    padding: EdgeInsets.only(bottom: 20.0),
                    allowScrubbing: true,
                    colors: VideoProgressColors(
                      playedColor: Color(0xff23231A),
                      bufferedColor: Color(0xff9B9B96),
                      backgroundColor: Color(0xffF8F4E3),
                    ),
                  ),
                )
              ],
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;

  void _resetPlayback() async {
    playPauseController.reverse(from: 1.0);
    await _controller.seekTo(Duration());
    _controller.pause();
  }
}
