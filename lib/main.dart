// import 'dart:ui_web';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:twitter_api/components/alpha.dart';
import 'package:twitter_api/feed_page.dart';
import 'package:twitter_api/firebase_options.dart';
import 'package:device_preview/device_preview.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  // debugEmulateFlutterTesterEnvironment = true;
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(DevicePreview(
    enabled: true,
    builder: (BuildContext context) {
      // ignore: deprecated_member_use
      return const MaterialApp(useInheritedMediaQuery: true, home: MyApp());
    },
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const FeedPage()));
            },
            child: const Icon(Icons.add),
          ),
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Colors.black,
            leading: GestureDetector(
                onTap: () {}, child: const Icon(Icons.person_outline)),
          ),
          body: const SingleChildScrollView(
            child: Column(
              children: [
                FeedPost(),
              ],
            ),
          )),
    );
  }
}
