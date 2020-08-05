import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyRunIT1());
}

class MyRunIT1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyRunIT();
  }
}

AudioPlayer newPlayer = new AudioPlayer();
AudioCache audio = new AudioCache(fixedPlayer: newPlayer);
bool play = false;
bool stop = true;

playAudio() {
  if (play == false || stop == true) {
    audio.play("Kesari.mp3");
    play = true;
    stop = false;
  }
}

pauseAudio() {
  if (play == true) {
    newPlayer.pause();
    play = false;
  }
}

stopAudio() {
  if (play == true && stop == false) {
    newPlayer.stop();
    play = false;
    stop = true;
  }
}

launchURL() async {
  const url = 'https://youtu.be/wF_B_aagLfI';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

MyRunIT() {
  FlutterStatusbarcolor.setStatusBarColor(Colors.black87);
  FlutterStatusbarcolor.setNavigationBarColor(Colors.blue.shade500);

  var body = Scaffold(
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.play_arrow), onPressed: playAudio),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text("What you want to Do?"),
              decoration: BoxDecoration(color: Colors.blue),
            ),
            ListTile(
              title: Text("Play Music"),
              onTap: () {
                playAudio();
              },
            ),
            ListTile(
              title: Text("Pause Music"),
              onTap: () {
                pauseAudio();
              },
            )
          ],
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'RunIT',
          style: TextStyle(fontFamily: 'Ariel'),
        ),
        backgroundColor: Colors.black87,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.youtube_searched_for), onPressed: launchURL)
        ],
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.all(30.0),
              height: 250,
              width: 250,
              decoration:
                  BoxDecoration(color: Colors.orange, shape: BoxShape.circle),
              child: Image.asset("images/hqdefault.jpg"),
            ),
            Container(
                alignment: Alignment.center,
                width: 330,
                height: 40,
                child: Text(
                  "Teri Mitti",
                  style: TextStyle(fontStyle: FontStyle.italic, fontSize: 30),
                )),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  FlatButton(
                    onPressed: playAudio,
                    child: Icon(Icons.play_arrow),
                    color: Colors.blue.shade500,
                  ),
                  FlatButton(
                    onPressed: pauseAudio,
                    child: Icon(Icons.pause),
                    color: Colors.blue.shade500,
                  ),
                  FlatButton(
                    onPressed: stopAudio,
                    child: Icon(Icons.stop),
                    color: Colors.blue.shade500,
                  )
                ])
          ]),
      backgroundColor: Colors.grey.shade300);

  return MaterialApp(
    home: body,
    debugShowCheckedModeBanner: false,
  );
}
