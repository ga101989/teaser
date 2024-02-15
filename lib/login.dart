import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:teaser/register.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Teaser',
          style: GoogleFonts.shrikhand(color: Colors.white, fontSize: 40),
        ),
        centerTitle: true,
        backgroundColor: Colors.teaserO,
        iconTheme: IconThemeData(color: Colors.white), // Change la couleur de la flèche en blanc
      ),
      body: Container(
        color: Colors.teaserO, // Fond rouge pour le body
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Connexion',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.shrikhand(color: Colors.blancC, fontSize: 40)
                ),
                SizedBox(height: 24),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Username',
                    labelStyle: GoogleFonts.shrikhand(color: Colors.teaserO),
                    filled: true,
                    fillColor: Colors.blancC,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                SizedBox(height: 16),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: GoogleFonts.shrikhand(color: Colors.teaserO),
                    filled: true,
                    fillColor: Colors.blancC,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  obscureText: true,
                ),
                SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    // TODO: Implement login logic
                  },
                  child: Text('Connexion', style: GoogleFonts.shrikhand(color: Colors.white, fontSize: 20)),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.OrangeC,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterPage()),
                    );
                  },
                  child: Text(
                    "Inscription",
                    style: GoogleFonts.shrikhand(color: Colors.red, fontSize: 20, decoration: TextDecoration.underline, decorationColor: Colors.red),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    title: 'Login',
    theme: ThemeData(primarySwatch: Colors.blue),
    home: LoginPage(),
  ));
}
