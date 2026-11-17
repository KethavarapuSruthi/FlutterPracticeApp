import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Homepage());
  }
}

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  Future<void> _openBroswerView() async {
    final uri = Uri.parse('https://flutter.dev');
    final opened = await launchUrl(uri, mode: LaunchMode.inAppBrowserView);

    if (!opened) {
      debugPrint("Could not open $uri");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("In-app Browser")),
      body: Center(
        child: ElevatedButton(
          onPressed: _openBroswerView,
          child: Text("Click here for in-app browser"),
        ),
      ),
    );
  }
}
