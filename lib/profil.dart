import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool _isSelected = true; // Initialiser la sélection à true pour "Mes teases"
  List<Teaser> teasers = [
    Teaser(title: 'Tease 1', views: 100),
    Teaser(title: 'Tease 2', views: 200),
    Teaser(title: 'Tease 3', views: 300),
    Teaser(title: 'Tease 1', views: 100),
    Teaser(title: 'Tease 2', views: 200),
    Teaser(title: 'Tease 3', views: 300),
    Teaser(title: 'Tease 1', views: 100),
    Teaser(title: 'Tease 2', views: 200),
    Teaser(title: 'Tease 3', views: 300),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Teaser',
          style: GoogleFonts.shrikhand(color: Colors.teaserO, fontSize: 40),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.teaserO, size: 40),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings,size: 40, color: Colors.teaserO),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfilePage()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Center(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  margin: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF4F3F3),
                    border: Border.all(color: Colors.orange, width: 2),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: 150,
                        height: 150,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage('images/Ellipse.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        '@ Nom d\'utilisateur',
                        style: GoogleFonts.shrikhand(color: Colors.teaserO, fontSize: 24),
                      ),
                      const SizedBox(height: 20),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ProfileStat(label: 'Sons', value: '100'),
                          ProfileStat(label: 'Followers', value: '500'),
                          ProfileStat(label: 'Suivis', value: '300'),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _isSelected = true;
                              });
                            },
                            child: Text(
                              'Mes teases',
                              style: GoogleFonts.shrikhand(fontSize: 20, color: _isSelected ? const Color(0xFFFF914D) : const Color(0xFFFF914D).withOpacity(0.5)),
                            ),
                          ),
                          const SizedBox(width: 20),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _isSelected = false;
                              });
                            },
                            child: Text(
                              'Mes likes',
                              style: GoogleFonts.shrikhand(fontSize: 20, color: _isSelected ? const Color(0xFFFF914D).withOpacity(0.5) : const Color(0xFFFF914D)),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 2,
                            width: 120,
                            color: _isSelected ? const Color(0xFFFF914D) : const Color(0xFFFF914D).withOpacity(0.5),
                          ),
                          const SizedBox(width: 20),
                          Container(
                            height: 2,
                            width: 120,
                            color: !_isSelected ? const Color(0xFFFF914D) : const Color(0xFFFF914D).withOpacity(0.5),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  children: List.generate(
                    teasers.length,
                    (index) {
                      return GestureDetector(
                        onTap: () {
                          // Action à effectuer lors du tap sur un teaser
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.teaserO,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.play_circle_filled, size: 40, color: Colors.white),
                              const SizedBox(height: 10),
                              Text(
                                '${teasers[index].views}',
                                style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}

class ProfileStat extends StatelessWidget {
  final String label;
  final String value;

  const ProfileStat({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: GoogleFonts.shrikhand(color: Colors.teaserO, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 5),
        if(label == 'Sons') const Icon(Icons.music_note, color: Colors.teaserO, size: 20),
        if(label != 'Sons') Text(
          label,
          style: GoogleFonts.shrikhand(color: Colors.teaserO, fontSize: 14),
        ),
      ],
    );
  }
}

class Teaser {
  final String title;
  final int views;

  Teaser({required this.title, required this.views});
}
