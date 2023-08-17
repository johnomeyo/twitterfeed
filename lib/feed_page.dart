// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({super.key});

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  final tweet = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      home: Scaffold(
          backgroundColor: Colors.black,
          // appBar: AppBar(
          //   backgroundColor: Colors.black,
          // ),
          body: Column(
            children: [
              SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        )),
                    Visibility(
                      visible: tweet.text.isNotEmpty? true: false,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(20)),
                        child: const Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          child: Text(
                            "Post",
                            style: TextStyle(
                                color: Colors.white, fontWeight: FontWeight.w900),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.person,
                        color: Colors.grey.shade700,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.black,
                          border: Border.all(width: 1, color: Colors.blue),
                          borderRadius: BorderRadius.circular(20)),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: Text(
                          "Public",
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  style: const TextStyle(color: Colors.white),
                  controller: tweet,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "What's happening",
                      hintStyle: TextStyle(color: Colors.grey),
                      counterStyle: TextStyle(color: Colors.red)),
                ),
              )
            ],
          )),
    );
  }
}
