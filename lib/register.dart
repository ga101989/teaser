import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';


class RegisterPage extends StatelessWidget {
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
        iconTheme: const IconThemeData(color: Colors.white), // Change la couleur de la flèche en blanc
      ),
      body: Container(
        color: Colors.teaserO,
        child: Center( // Wrap your Column with Center
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Inscription',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.shrikhand(color: Colors.blancC, fontSize: 40)
                  ),
                  const SizedBox(height: 24),
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
                  const SizedBox(height: 24),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: GoogleFonts.shrikhand(color: Colors.teaserO),
                      filled: true,
                      fillColor: Colors.blancC,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b')),
                    ],
                  ),
                  const SizedBox(height: 24),
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
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.OrangeC,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: Text('Inscription', style: GoogleFonts.shrikhand(color: Colors.white, fontSize: 20)),
                  ),
                  const SizedBox(height: 16),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Connexion",
                      style: GoogleFonts.shrikhand(color: Colors.red, fontSize: 20, decoration: TextDecoration.underline, decorationColor: Colors.red),
                      
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    title: 'Register',
    theme: ThemeData(primarySwatch: Colors.blue),
    home: RegisterPage(),
  ));
}
