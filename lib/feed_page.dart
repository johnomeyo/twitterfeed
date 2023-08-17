// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FeedPage extends StatelessWidget {
  const FeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      home: Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.cancel_outlined)),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20)),
                    child: const Padding(
                      padding: EdgeInsets.all(10),
                      child: Text("Post"),
                    ),
                  )
                ],
              )
            ],
          )),
    );
  }
}
