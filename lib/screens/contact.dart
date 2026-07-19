import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class Contact extends StatelessWidget {
  const Contact({super.key});

  Future<void> _launchUrl(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $urlString');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Details', style: TextStyle(fontSize: 30)),
        centerTitle: true,
        toolbarHeight: 90,
      ),

      body: Column(
        children: [
          Card(
            elevation: 3,
            child: ListTile(
              tileColor: Colors.green,
              leading: Icon(Icons.mail),
              title: Text('mdalif10366@gmail.com'),
              subtitle: Text('Gmail'),
              onTap: () => _launchUrl('mailto:mdalif10366@gmail.com'),
            ),
          ),
          Card(
            elevation: 3,
            child: ListTile(
              tileColor: Colors.green,
              leading: Icon(Icons.phone),
              title: Text('07782267281'),
              subtitle: Text('Number'),
              onTap: () => _launchUrl('tel:07782267281'),
            ),
          ),
          Card(
            elevation: 3,
            child: ListTile(
              tileColor: Colors.green,
              leading: FaIcon(FontAwesomeIcons.github),
              title: Text('@Jasper1035'),
              subtitle: Text('Github'),
              onTap: () => _launchUrl('https://github.com/Jasper1035'),
            ),
          ),
          Card(
            elevation: 3,
            child: ListTile(
              tileColor: Colors.green,
              leading: FaIcon(FontAwesomeIcons.linkedin),
              title: Text("@mdalif103"),
              subtitle: Text('LinkedIn'),
              onTap: () => _launchUrl('https://linkedin.com/in/mdalif103'),
            ),
          ),
          Card(
            elevation: 3,
            child: ListTile(
              tileColor: Colors.green,
              leading: FaIcon(FontAwesomeIcons.x),
              title: Text('@jasper_1036'),
              subtitle: Text('X'),
              onTap: () => _launchUrl('https://x.com/jasper_1036'),
            ),
          ),
          Card(
            elevation: 3,
            child: ListTile(
              tileColor: Colors.green,
              leading: Icon(Icons.discord),
              title: Text('@alif10366'),
              subtitle: Text('Discord'),
              onTap: () =>
                  _launchUrl('https://discord.com/users/1377367584940228638'),
            ),
          ),
        ],
      ),
    );
  }
}
