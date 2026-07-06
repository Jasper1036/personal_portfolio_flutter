import 'package:flutter/material.dart';
import 'package:personal_portfolio_flutter/screens/contact.dart';
import 'package:personal_portfolio_flutter/screens/education.dart';
import 'package:personal_portfolio_flutter/screens/projects.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int current = 0;

  Widget colorSwt() {
    switch (current) {
      case 0:
        return homepage();
      case 1:
        return Projects();
      case 2:
        return Education();
      case 3:
        return Contact();
      default:
        return homepage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black, size: 30),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Welcome To My Portfolio',
          style: TextStyle(color: Colors.black),
        ),
      ),
      drawer: SafeArea(
        child: Drawer(
          child: ListView.builder(
            itemCount: 1,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                spacing: 20,
                children: [
                  SizedBox(height: 120),

                  GestureDetector(
                    onTap: () {
                      setState(() {
                        current = 0;
                      });
                      Navigator.pop(context);
                    },
                    child: Card(
                      elevation: 10,
                      child: Container(
                        color: current == 0 ? Colors.green : Colors.red,
                        height: 55,
                        width: double.infinity,
                        child: Center(child: Text('Home')),
                      ),
                    ),
                  ),

                  GestureDetector(
                    onTap: () {
                      setState(() {
                        current = 1;
                      });
                      Navigator.pop(context);
                    },
                    child: Card(
                      elevation: 10,
                      child: Container(
                        color: current == 1 ? Colors.green : Colors.red,

                        height: 55,
                        width: double.infinity,
                        child: Center(child: Text('Projects')),
                      ),
                    ),
                  ),

                  GestureDetector(
                    onTap: () {
                      setState(() {
                        current = 2;
                      });
                      Navigator.pop(context);
                    },
                    child: Card(
                      elevation: 10,
                      child: Container(
                        color: current == 2 ? Colors.green : Colors.red,

                        height: 55,
                        width: double.infinity,
                        child: Center(child: Text('Education')),
                      ),
                    ),
                  ),

                  GestureDetector(
                    onTap: () {
                      setState(() {
                        current = 3;
                      });
                      Navigator.pop(context);
                    },
                    child: Card(
                      elevation: 10,
                      child: Container(
                        color: current == 3 ? Colors.green : Colors.red,

                        height: 55,
                        width: double.infinity,
                        child: Center(child: Text('Contact Details')),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
      body: colorSwt(),
    );
  }
}

Widget homepage() {
  return Padding(
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
  );
}
