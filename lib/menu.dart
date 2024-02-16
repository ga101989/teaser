import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:teaser/login.dart';
import 'package:teaser/profil.dart';
import 'package:teaser/recording.dart';

class Sound {
  final String imagePath;
  final String title;
  final String artist;
  final String description;

  Sound({
    required this.imagePath,
    required this.title,
    required this.artist,
    required this.description,
  });
}

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> with SingleTickerProviderStateMixin {
  late PageController _pageController;
  late AnimationController _controller;
  bool _isPlaying = false;
  bool _isCommentSectionVisible = false;
  //int _currentSoundIndex = 0;

  final List<Sound> sounds = [
    Sound(
      imagePath: 'images/Ellipse.png',
      title: 'Titre de la chanson 1',
      artist: 'Artiste 1',
      description: 'Description du son 1',
    ),
    Sound(
      imagePath: 'images/didier.png',
      title: 'Titre de la chanson 2',
      artist: 'Artiste 2',
      description: 'Description du son 2',
    ),
    Sound(
      imagePath: 'images/minh.png',
      title: 'Titre de la chanson 3',
      artist: 'Artiste 3',
      description: 'Description du son 3',
    ),
    Sound(
      imagePath: 'images/tera.png',
      title: 'Titre de la chanson 4',
      artist: 'Artiste 4',
      description: 'Description du son 4',
    ),
    // Ajoutez d'autres sons ici
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5), // Durée de la rotation
      )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        
        title: Text(
          'Teaser',
          style: GoogleFonts.shrikhand(color: Colors.teaserO, fontSize: 40),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.search, size: 40, color: Colors.teaserO),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const LoginPage()),
            );
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle, size: 40, color: Colors.teaserO),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfilePage()),
              );
            }, 
          ),
        ],
      ),
      body: Stack(
        children: [
          GestureDetector(
          onHorizontalDragEnd: (details) {
            if (details.primaryVelocity! > 0) {
              _pageController.previousPage(
                duration: const Duration(milliseconds: 500),
                curve: Curves.ease,
              );
            } else if (details.primaryVelocity! < 0) {
              _pageController.nextPage(
                duration: const Duration(milliseconds: 500),
                curve: Curves.ease,
              );
            }
          },
          onTap: () {
                setState(() {
                  if (_isPlaying) {
                    _controller.repeat(); // Reprendre l'animation si elle est en pause
                  } else {
                    _controller.stop(); // Mettre en pause l'animation
                  }
                  _isPlaying = !_isPlaying; // Inverser l'état de la pause
                });
              },
          child: PageView.builder(
            //_isPlaying,
            controller: _pageController,
            itemCount: sounds.length,
            itemBuilder: (context, index) {
              return Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/vinyle_noir.png'),
                    fit: BoxFit.fitWidth,
                    alignment: Alignment.center,
                  ),
                ),
                child: Stack(
                  children: [
                    Center(
                      child: RotationTransition(
                        turns: _controller,
                        child: Container(
                          width: 300,
                          height: 300,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage(sounds[index].imagePath),//sounds[index].imagePath
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                                              
                      ),
                    ),
                    Positioned(
                      bottom: 20,
                      left: 20,
                      right: 20,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            sounds[index].title,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.shrikhand(color: Colors.teaserO, fontSize: 24,fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            sounds[index].artist,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.shrikhand(color: Colors.teaserO, fontSize: 18),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            sounds[index].description,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.teaserO,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          ),
          if (_isCommentSectionVisible)
              Positioned(
                bottom: 80,
                left: 0,
                right: 0,
                child: Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Commentaires',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.teaserO,
                        ),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
        ],
      ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.teaserO,
          child: Container(
            color: Colors.transparent,
            child: Theme(
              data: ThemeData(
                splashColor: Colors.white, // Couleur de l'effet de surbrillance
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(child: Container()),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.teaserO),
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.comment, size: 40, color: Colors.teaserO),
                      onPressed: () {
                        _isCommentSectionVisible = !_isCommentSectionVisible;
                      },
                    ),
                  ),
                  Expanded(child: Container()),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.teaserO),
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.add, size: 40, color: Colors.teaserO),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => RecordingPage()),
                        );
                      },
                    ),
                  ),
                  Expanded(child: Container()),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.teaserO),
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.favorite, size: 40, color: Colors.teaserO),
                      onPressed: () {},
                    ),
                  ),
                  Expanded(child: Container()),
                ],
              ),
            ),
          ),
        ),
      );
  }

  @override
  void dispose() {
    _controller.dispose();
    _pageController.dispose();
    super.dispose();
  }
}