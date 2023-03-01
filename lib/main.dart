import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
 List<Widget> _actionMovieCards = [];
  List<Widget> _bollywoodMovieCards = [];
  final GlobalKey _listKey = GlobalKey();
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    addMovies();
  }
  void addMovies() {
  List<Movie> _actionMovies = [
    Movie(
        title: 'Dracula',
        image: 'https://wallpaperaccess.com/full/1923020.jpg',
        url: 'https://www.youtube.com/watch?v=_2aWqecTTuE'),
    Movie(
        title: 'The Maze Runner',
        image:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQczM9W4ScNshPLjZLLRFbNvxzBL7vXOLjTxXZvp2OZE3ri3w2JsNjdpNV5erKRNfTyDzc&usqp=CAU',
        url: 'https://www.youtube.com/watch?v=AwwbhhjQ9Xk'),
    Movie(
        title: '300',
        image: 'https://wallpapercave.com/wp/wp2162772.jpg',
        url: 'https://www.youtube.com/watch?v=UrIbxk7idYA'),
    Movie(
        title: 'Venom',
        image:
            'https://mountaincrestexpress.com/wp-content/uploads/2018/10/Venom-1-1024x756.png',
        url: 'https://www.youtube.com/watch?v=u9Mv98Gr5pY'),
    Movie(
        title: 'Pirates Of the Caribbean',
        image: 'https://cdn.wallpapersafari.com/45/66/q2rdlZ.jpg',
        url: 'https://www.youtube.com/watch?v=Hgeu5rhoxxY')
  ];
  List<Movie> _bollywoodMovies = [
    Movie(
        title: 'Shaandar',
        image:
            'https://www.whoa.in/download/shaandaar-bollywood-movies-hd-poster',
        url: 'https://www.youtube.com/watch?v=k99-vMPh3-A'),
    Movie(
        title: '2 States',
        image: 'https://wallpaperaccess.com/full/1494461.jpg',
        url: 'https://www.youtube.com/watch?v=CGyAaR2aWcA'),
    Movie(
        title: 'Ishaqzaade',
        image:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTSwxz8bwLoiW2C81B6IlqvgnK_ViI9-XPvoQ&usqp=CAU',
        url: 'https://www.youtube.com/watch?v=46kTKQ0C2Ek'),
    Movie(
        title: 'Kick',
        image:
            'https://images.wallpapersden.com/image/ws-tiger-shroff-and-hrithik-roshan-war-movie_66472.jpg',
        url: 'https://www.youtube.com/watch?v=u-j1nx_HY5o'),
    Movie(
        title: 'Happy New Year',
        image:
            'https://c4.wallpaperflare.com/wallpaper/194/620/840/movies-bollywood-movies-wallpaper-preview.jpg',
        url: 'https://www.youtube.com/watch?v=JGHwANkQFrg')
  ];
  _actionMovies.forEach((movie) {
    _actionMovieCards.add(buildCard(movie));
  });
  _bollywoodMovies.forEach((movie) {
    _bollywoodMovieCards.add(buildCard(movie));
  });
}
  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }
Widget buildCard(Movie movie) {
  return InkWell(
      focusColor: Colors.white,
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => VideoPlayer(
                      url: movie.url,
                    )));
      },
      child: Container(
          height: 200,
          width: 200,
          child: Card(
              color: Colors.black12,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: Image.network(
                    movie.image,
                    fit: BoxFit.cover,
                  )),
                  Divider(
                    color: Colors.white,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(movie.title,
                        style: TextStyle(color: Colors.white)),
                  ),
                ],
              ))));
}
    @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'Action Movies',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                      fontSize: 18),
                ),
              ),
              Container(
                height: 200,
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    key: _listKey,
                    itemCount: _actionMovieCards.length,
                    itemBuilder: (context, index) {
                      return _actionMovieCards[index];
                    }),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'Bollywood Movies',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                      fontSize: 18),
                ),
              ),
              Container(
                height: 200,
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    //key: _listKey,
                    itemCount: _bollywoodMovieCards.length,
                    itemBuilder: (context, index) {
                      return _bollywoodMovieCards[index];
                    }),
              ),
            ],
          ),
        ));
  }
} 
class VideoPlayer extends StatefulWidget {
  final String url;
  VideoPlayer({required this.url});
  @override
  _VideoPlayerState createState() => _VideoPlayerState();
}
class _VideoPlayerState extends State<VideoPlayer> {
 late YoutubePlayerController _controller;
 late TextEditingController _idController;
 late TextEditingController _seekToController;
late  PlayerState _playerState;
late  YoutubeMetaData _videoMetaData;
  bool _isPlayerReady = false;
 late String videoId;
  @override
  void initState() {
    super.initState();
    videoId = YoutubePlayer.convertUrlToId(widget.url)!;
    print(videoId);
    _controller = YoutubePlayerController(
        initialVideoId: videoId,
        flags: const YoutubePlayerFlags(
            mute: false,
            autoPlay: true,
            disableDragSeek: false,
            loop: false,
            isLive: false,
            forceHD: false,
            enableCaption: true))
      ..addListener(listener);
    _idController = TextEditingController();
    _seekToController = TextEditingController();
    _videoMetaData = const YoutubeMetaData();
    _playerState = PlayerState.unknown;
  }
  void listener() {
    if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {
      setState(() {
        _playerState = _controller.value.playerState;
        _videoMetaData = _controller.metadata;
      });
    }
  }
  @override
  void dispose() {
    _controller.dispose();
    _idController.dispose();
    _seekToController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      onExitFullScreen: () {
        SystemChrome.setPreferredOrientations(DeviceOrientation.values);
      },
      player: YoutubePlayer(
          controller: _controller,
          showVideoProgressIndicator: true,
          progressIndicatorColor: Colors.blueAccent,
          topActions: <Widget>[
            const SizedBox(width: 8.0),
            Expanded(
                child: Text(_controller.metadata.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1))
          ],
          onReady: () {
            _isPlayerReady = true;
          },
          onEnded: (data) {}),
      builder: (context, player) => Scaffold(
        body: player,
      ),
    );
  }
}


class Movie {
    String title;
    String image;
  String url;
  Movie({required this.title,required this.image,required this.url});
}