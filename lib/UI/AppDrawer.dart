import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallpaper/UI/RandomPhotos.dart';

import 'SuperHero.dart';

class Wallpaper extends StatefulWidget {
  const Wallpaper({super.key});

  @override
  State<Wallpaper> createState() => _WallpaperState();
}

class _WallpaperState extends State<Wallpaper> {
  void out() {
    setState(() {
      FirebaseAuth.instance.signOut();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.black,
          child: ListView(children: [
            DrawerHeader(
                child: Image.asset(
              'assets/images/ironman.jpg',
              fit: BoxFit.cover,
            )),
            ListTile(
                leading: Image.asset(
                  'assets/images/one.png',
                  height: 30,
                ),
                title: Text(
                  'Wallpapers',
                  style: GoogleFonts.aBeeZee(color: Colors.white, fontSize: 20),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Random()));
                }),
            ListTile(
                leading: Image.asset(
                  'assets/images/two.png',
                  height: 35,
                ),
                title: Text(
                  'Cars',
                  style: GoogleFonts.aBeeZee(color: Colors.white, fontSize: 20),
                ),
                onTap: () {}),
            ListTile(
                leading: Image.asset(
                  'assets/images/flower.png',
                  height: 30,
                ),
                title: Text(
                  'Flowers',
                  style: GoogleFonts.aBeeZee(color: Colors.white, fontSize: 20),
                ),
                onTap: () {}),
            ListTile(
                leading: Image.asset(
                  'assets/images/superh.png',
                  height: 30,
                ),
                title: Text(
                  'Superheroes',
                  style: GoogleFonts.aBeeZee(color: Colors.white, fontSize: 20),
                ),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const MP()));
                }),
            const SizedBox(
              height: 50,
            ),
            const Divider(
              thickness: 2,
              color: Colors.white,
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.exit_to_app,
                        color: Colors.white,
                        size: 30,
                      ),
                    )),
                Container(
                    margin: const EdgeInsets.only(left: 20),
                    child: Text(
                      style: GoogleFonts.aBeeZee(
                          color: Colors.white, fontSize: 20),
                      'Exit the app.',
                    ))
              ],
            ),
            Row(
              children: [
                GestureDetector(
                    onTap: out,
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.person,
                        color: Colors.white,
                        size: 30,
                      ),
                    )),
                Container(
                    margin: const EdgeInsets.only(left: 20),
                    child: Text(
                      style: GoogleFonts.aBeeZee(
                          color: Colors.white, fontSize: 20),
                      'LogOut.',
                    ))
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
