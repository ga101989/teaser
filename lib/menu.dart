import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:teaser/profil.dart';
import 'login.dart';

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image(image: AssetImage('images/Ellipse.png'),),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(child: Container()), // Ajoute un espace vide pour centrer les boutons
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
            Expanded(child: Container()), // Ajoute un espace vide pour centrer les boutons
          ],
        ),
      ),
    );
  }
}
