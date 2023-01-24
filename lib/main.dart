import 'package:flutter/material.dart';
import 'package:livekit_flutter/home_page.dart';
import 'package:livekit_client/livekit_client.dart';

void main() {
 
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}
