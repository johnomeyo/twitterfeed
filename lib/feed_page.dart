// import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:twitter_api/utils/utils.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({super.key});

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  final tweet = TextEditingController();
  Uint8List? img;
  bool showPostButton = false;
  pickImage() async {
    Uint8List image = await selectImage(ImageSource.gallery);
    setState(() {
      img = image;
    });
  }

  @override
  void initState() {
    super.initState();
    tweet.addListener(_updatePostButtonVisibility);
  }

  void _updatePostButtonVisibility() {
    setState(() {
      showPostButton = tweet.text.isNotEmpty;
    });
  }

  void postTweet() async {
    try {
      await FirebaseFirestore.instance.collection('tweets').add({
        "tweet": tweet.text,
        "time": DateTime.now(),
      });
      debugPrint("Tweet posted succesfully ");
    } catch (e) {
      debugPrint("The error is $e");
    }
  }

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),
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
                    TextButton(
                        onPressed: postTweet,
                        child: const Text(
                          "post",
                          style: TextStyle(color: Colors.white),
                        )),
                    Visibility(
                      visible: showPostButton,
                      child: GestureDetector(
                        onTap: () => postTweet,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(20)),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: Text(
                              "Post",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900),
                            ),
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
                    img != null
                        ? CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Icon(
                              Icons.person,
                              color: Colors.grey.shade700,
                            ))
                        : CircleAvatar(
                            backgroundImage: MemoryImage(img!),
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
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
              ),
              IconButton(
                  onPressed: () {
                    pickImage();
                  },
                  icon: const Icon(
                    Icons.photo,
                    color: Colors.blue,
                  ))
            ],
          )),
    );
  }
}
