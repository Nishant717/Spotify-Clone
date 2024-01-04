import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black26,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(5, 20, 0, 0),
          child: ListView(children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () {
                        // Implement booking functionality
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            const Color.fromARGB(255, 214, 81, 51)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                50.0), // Adjust the radius as needed
                          ),
                        ),
                      ),
                      child: const Text('Y'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Implement booking functionality
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            const Color.fromARGB(255, 20, 102, 23)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                20.0), // Adjust the radius as needed
                          ),
                        ),
                      ),
                      child: const Text('All'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Implement booking functionality
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            const Color.fromARGB(255, 81, 80, 80)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                20.0), // Adjust the radius as needed
                          ),
                        ),
                      ),
                      child: const Text('Music'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Implement booking functionality
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            const Color.fromARGB(255, 81, 80, 80)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                20.0), // Adjust the radius as needed
                          ),
                        ),
                      ),
                      child: const Text('Podcasts & Shows'),
                    ),
                  ],
                ),
                Column(
                  children: [
                    for (int i = 1; i < 3; i++)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          for (int j = 1; j < 3; j++)
                            GestureDetector(
                              onTap: () {
                                // Handle click on the image
                                playAudio(context, 'img_$i.mp3');
                              },
                              child: SizedBox(
                                width: 190,
                                height: 65,
                                child: Card(
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 0, 5, 0),
                                        child: Image.asset(
                                          'assets/img_$i.jpg',
                                          width: 100.0,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      const Flexible(
                                        child: Text(
                                          "Snap x baarishen",
                                          style: TextStyle(
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                  ],
                ),
                const SizedBox(
                  height: 15.0,
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 100, 0),
                  child: Text(
                    "Shows that you might like",
                    style: TextStyle(
                      fontSize: 23.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: <Widget>[
                      for (int i = 1; i < 5; i++)
                        GestureDetector(
                          onTap: () {
                            playAudio(context, 'podcast_$i.mp3');
                          },
                          child: SizedBox(
                            width: 155,
                            height: 240,
                            child: Card(
                              color: Colors.black26,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(20.0),
                                      child: Image.asset(
                                        "assets/podcast_$i.jpg",
                                        fit: BoxFit.fill,
                                        height: 160,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10.0,
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.fromLTRB(0, 0, 80, 0),
                                      child: Text(
                                        "Education",
                                        style: TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.green,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5.0,
                                    ),
                                    const Text(
                                      "Words beyond action",
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5.0,
                                    ),
                                    const Flexible(
                                      child: Text(
                                        "Show • Words beyond action",
                                        style: TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ]),
                            ),
                          ),
                        )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 215, 0),
                  child: Text(
                    "Recently played",
                    style: TextStyle(
                      fontSize: 23.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: <Widget>[
                      for (int i = 1; i < 4; i++)
                        GestureDetector(
                          onTap: () {
                            playAudio(context, 'img_$i.mp3');
                          },
                          child: SizedBox(
                            width: 155,
                            height: 265,
                            child: Card(
                              color: Colors.black26,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(20.0),
                                      child: Image.asset(
                                        "assets/img_$i.jpg",
                                        fit: BoxFit.fill,
                                        height: 160,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5.0,
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Flexible(
                                        child: Text(
                                          "Snap x baarishen",
                                          style: TextStyle(
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ),
                                  ]),
                            ),
                          ),
                        )
                    ],
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home', // This is the text displayed below the icon
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_music_outlined),
            label: 'Your Library',
          ),
        ],
      ),
    );
  }

  void playAudio(BuildContext context, String audioFileName) {
    Navigator.pushNamed(context, "/song", arguments: audioFileName);
  }
}
