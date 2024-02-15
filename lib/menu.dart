import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:teaser/profil.dart';
//import 'login.dart';

class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _isPaused = false;

@override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5), // Durée de la rotation
    )..repeat(); // Répéter l'animation en boucle
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
        actions: [
          IconButton(
            icon: Icon(Icons.account_circle, size: 40, color: Colors.teaserO),
            onPressed: () {
               Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/vinyle_noir.png'), 
            fit: BoxFit.fitWidth,
            alignment: Alignment.center,
          ),
        ),
        child: Center(
          child: GestureDetector(
            onTap: () {
              setState(() {
                if (_isPaused) {
                  _controller.repeat(); // Reprendre l'animation si elle est en pause
                } else {
                  _controller.stop(); // Mettre en pause l'animation
                }
                _isPaused = !_isPaused; // Inverser l'état de la pause
              });
            },
            child: Stack(
              children: [
                RotationTransition(
                  turns: _controller,
                  child: Center(
                  child: Container(
                    width: 300,
                    height: 300,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('images/Ellipse.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  ),
                ),
                if (_isPaused)
                  Center(
                    child: Icon(
                      Icons.play_arrow,
                      size: 100,
                      color: Colors.white,
                    ),
                  ),
              ],
            ),
          ),
        ),
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
                    icon: Icon(Icons.comment, size: 40, color: Colors.teaserO),
                    onPressed: () {},
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
                    icon: Icon(Icons.add, size: 40, color: Colors.teaserO),
                    onPressed: () {},
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
                    icon: Icon(Icons.favorite, size: 40, color: Colors.teaserO),
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
    super.dispose();
  }
}
