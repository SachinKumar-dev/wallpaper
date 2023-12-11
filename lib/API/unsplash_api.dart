import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Unsplash extends StatefulWidget {
  const Unsplash({Key? key}) : super(key: key);

  @override
  State<Unsplash> createState() => _UnsplashState();
}

class _UnsplashState extends State<Unsplash> {

  Future<Map<String, dynamic>> fetchRandomPhotos() async {
    final response = await http.get(Uri.parse(
        'https://api.unsplash.com/photos/Dwu85P9SOIk?client_id=dBOPgqRB1EH4mMaxrkMNhD8dbT2e8E1D32T5Yps4n-Q'));
    if (response.statusCode == 200) {
      var data = json.decode(response.body) as Map<String, dynamic>;
      // var urls = data.map<String>((item) => item['urls']['full']).toList();
      // return urls;
      return data;
    } else {
      throw Exception('Failed to load photos');
    }
  }
  @override
  Widget build(BuildContext context) {
    return
       Scaffold(
        appBar: AppBar(
          title: const Text('Random Photos'),
        ),
        body: FutureBuilder<Map<String, dynamic>>(
          future: fetchRandomPhotos(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: 1,
                itemBuilder: (context, index) {
                  return Container(
                    child:Image.network(snapshot.data!['url']['regular']),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
    );
  }
}
