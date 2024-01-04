// ignore_for_file: avoid_print, non_constant_identifier_names, sized_box_for_whitespace, unused_import

import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:audioplayers/audioplayers.dart';

class SongPage extends StatefulWidget {
  const SongPage({Key? key}) : super(key: key);

  @override
  State<SongPage> createState() => _SongPageState();
}

class _SongPageState extends State<SongPage> {
  List<Map<String, dynamic>> imageList = [
    {
      "id": 1,
      "audio": 'snap_barish.mp3',
      "image": "img_1.jpg",
      "text": "Snap Barish"
    },
    {
      "id": 2,
      "audio": 'one_love.mp3',
      "image": "img_2.jpg",
      "text": "One Love"
    },
    {
      "id": 3,
      "audio": 'waka_waka.mp3',
      "image": "img_3.jpg",
      "text": "Waka Waka"
    },
    {
      "id": 4,
      "audio": 'dametu_cosita.mp3',
      "image": "img_4.jpg",
      "text": "Dame tu Cosita"
    },
  ];

  bool isPlaying = false;
  double value = 0;
  final player = AudioPlayer();
  Duration duration = Duration.zero;
  int currentIndex = 0;

  // Properties for background and main image
  String backgroundImg = "assets/img_1.jpg";
  String mainImg = "assets/img_1.jpg";
  String songText = "Snap Barish";

  void initPlayer() async {
    try {
      await player
          .setSource(AssetSource(imageList[currentIndex]["audio"] as String));
      duration = (await player.getDuration())!;
    } catch (e) {
      print("Error initializing player: $e");
    }
  }

  void playNextSong() async {
    if (currentIndex < imageList.length - 1) {
      currentIndex++;
    } else {
      currentIndex = 0;
    }

    updateUI(); // Update UI properties
    await player.setSource(
      AssetSource(imageList[currentIndex]["audio"] as String),
    );
    duration = (await player.getDuration())!;
    await player.resume();

    // Register a listener for position changes
    player.onPositionChanged.listen(
      (Duration d) {
        setState(() {
          value = d.inSeconds.toDouble();
          print(value);
        });
      },
    );
  }

  void playPreviousSong() async {
    if (currentIndex > 0) {
      currentIndex--;
    } else {
      currentIndex = imageList.length - 1;
    }

    updateUI(); // Update UI properties
    await player.setSource(
      AssetSource(imageList[currentIndex]["audio"] as String),
    );
    duration = (await player.getDuration())!;
    await player.resume();

    // Register a listener for position changes
    player.onPositionChanged.listen(
      (Duration d) {
        setState(() {
          value = d.inSeconds.toDouble();
          print(value);
        });
      },
    );
  }

  // Update UI properties based on the current index
  void updateUI() {
    setState(() {
      backgroundImg = "assets/${imageList[currentIndex]["image"]}";
      mainImg = "assets/${imageList[currentIndex]["image"]}";
      songText = imageList[currentIndex]["text"] as String;
    });
  }

  // init the player
  @override
  void initState() {
    super.initState();
    initPlayer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            constraints: const BoxConstraints.expand(),
            height: 300.0,
            width: 300.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(backgroundImg),
                fit: BoxFit.cover,
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 28, sigmaY: 28),
              child: Container(
                color: Colors.black.withOpacity(0.6),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // setting the music cover
              ClipRRect(
                borderRadius: BorderRadius.circular(30.0),
                child: Image.asset(
                  mainImg,
                  width: 250.0,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Text(
                songText,
                style: const TextStyle(
                    color: Colors.white, fontSize: 36, letterSpacing: 6),
              ),
              // Setting the seekbar
              const SizedBox(
                height: 50.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${(value / 60).floor()}: ${(value % 60).floor()}",
                    style: const TextStyle(color: Colors.white),
                  ),
                  Container(
                    width: 260.0,
                    child: Slider.adaptive(
                      onChangeEnd: (new_value) async {
                        setState(() {
                          value = new_value;
                          print(new_value);
                        });
                        await player.seek(Duration(seconds: new_value.toInt()));
                      },
                      min: 0.0,
                      value: value,
                      max: 214.0,
                      onChanged: (value) {},
                      activeColor: Colors.white,
                    ),
                  ),
                  Text(
                    "${duration.inMinutes} : ${duration.inSeconds % 60}",
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
              // setting the player controller
              const SizedBox(
                height: 60.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(60.0),
                      color: Colors.black87,
                      border: Border.all(color: Colors.white38),
                    ),
                    width: 50.0,
                    height: 50.0,
                    child: InkWell(
                      onTapDown: (details) {
                        playPreviousSong();
                      },
                      onTapUp: (details) {
                        player.setPlaybackRate(1);
                      },
                      child: const Center(
                        child: Icon(
                          Icons.fast_rewind_rounded,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(60.0),
                      color: Colors.black87,
                      border: Border.all(color: Colors.pink),
                    ),
                    width: 60.0,
                    height: 60.0,
                    child: InkWell(
                      onTap: () async {
                        if (isPlaying) {
                          await player.pause();
                        } else {
                          await player.resume();

                          player.onPositionChanged.listen(
                            (Duration d) {
                              setState(() {
                                value = d.inSeconds.toDouble();
                                print(value);
                              });
                            },
                          );
                        }

                        setState(() {
                          isPlaying = !isPlaying;
                        });
                      },
                      child: Center(
                        child: Icon(
                          isPlaying ? Icons.pause : Icons.play_arrow,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(60.0),
                      color: Colors.black87,
                      border: Border.all(color: Colors.white38),
                    ),
                    width: 50.0,
                    height: 50.0,
                    child: InkWell(
                      onTapDown: (details) {
                        playNextSong();
                      },
                      onTapUp: (details) {
                        player.setPlaybackRate(1);
                      },
                      child: const Center(
                        child: Icon(
                          Icons.fast_forward_rounded,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
