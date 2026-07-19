import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Education extends StatelessWidget {
  const Education({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Education', style: TextStyle(fontSize: 30)),
        centerTitle: true,
        toolbarHeight: 90,
      ),
      body: Card(
        elevation: 5,
        color: Colors.green,
        child: Column(
          children: [
            ListTile(
              leading: FaIcon(FontAwesomeIcons.graduationCap, size: 22),
              title: Text('University of wovlerhamptn'),
              isThreeLine: true,
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 8),
                  Text('Bsc (Hons) in Computer Science'),
                  SizedBox(height: 8),
                  Text('2024 - 2026'),
                ],
              ),
            ),
            SizedBox(height: 50),
            ListTile(
              leading: FaIcon(FontAwesomeIcons.graduationCap, size: 22),
              title: Text('Vashantek Govt. College'),
              isThreeLine: true,
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 8),
                  Text('Science'),
                  SizedBox(height: 8),
                  Text('2020-2021'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
