import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('Welcome To My Portfolio')),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        'https://thumbs.dreamstime.com/b/vector-icon-user-avatar-web-site-mobile-app-man-face-flat-style-social-network-profile-45836554.jpg',
                      ),
                      fit: BoxFit.cover,
                      alignment: Alignment.center,
                      // ),
                    ),
                    shape: BoxShape.circle,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Md Alif',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Text(
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                '"Results-driven Flutter Developer with a passion for crafting beautiful, native-quality user interfaces from a single codebase. Proficient in Dart and highly experienced with industry-standard state management architectures (Bloc, Provider, Riverpod). Proven track record of optimizing application performance, integrating robust REST APIs, and publishing scalable mobile applications to both the App Store and Google Play."',
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 45,
                  width: 341,
                  alignment: Alignment.center,
                  color: Colors.grey[700],
                  child: Text(
                    'Thank You',
                    style: TextStyle(color: Colors.cyanAccent),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
