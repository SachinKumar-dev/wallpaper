import 'dart:convert';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class Random extends StatefulWidget {
  const Random({Key? key}) : super(key: key);

  @override
  State<Random> createState() => _RandomState();
}

class _RandomState extends State<Random> {
  @override
  List<String> _imageUrls = [];

  Future<void> _fetchRandomPhotos() async {
    final response = await http.get(Uri.parse(
        'https://api.unsplash.com/photos/random?query=random&count=100&client_id=dBOPgqRB1EH4mMaxrkMNhD8dbT2e8E1D32T5Yps4n-Q'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body) as List<dynamic>;
      final imageUrls =
      data.map<String>((item) => item['urls']['regular']).toList();
      setState(() {
        _imageUrls = imageUrls;
      });
    } else {
      throw Exception('Failed to load photos');
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchRandomPhotos();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              expandedHeight: 200,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
                  'assets/images/deadpool.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Text(
                    style: GoogleFonts.aBeeZee(fontSize: 25),"RandomPhotos",
                    textAlign: TextAlign.center,
                  ),
                ),
                GridView.builder(
                  padding: const EdgeInsets.all(8),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                  ),
                  itemCount: _imageUrls.length,
                  itemBuilder: (context, index) {
                    return Image.network(
                      _imageUrls[index],
                      fit: BoxFit.cover,
                    );
                  },
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
