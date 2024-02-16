import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:teaser/profil.dart';
//import 'login.dart';

class RecordingPage extends StatefulWidget {
  @override
  _RecordingPageState createState() => _RecordingPageState();
}

class _RecordingPageState extends State<RecordingPage> with SingleTickerProviderStateMixin {

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
        iconTheme: const IconThemeData(color: Colors.teaserO, size: 40),
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
      body: Container(
        child: Center(
          child: Text(
            'Enregistrement',
            style: GoogleFonts.shrikhand(color: Colors.teaserO, fontSize: 40),
          ),
        ),
      ),
    );
  }
}
