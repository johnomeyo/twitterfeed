import 'dart:async';

import 'package:flutter/material.dart';
import 'package:twitter_api/components/beta.dart';

class FeedPost extends StatefulWidget {
  const FeedPost({super.key});

  @override
  State<FeedPost> createState() => _FeedPostState();
}

class _FeedPostState extends State<FeedPost> {
  // String currentTime = '';
  String currentDate = "";
  String formattedTime = '';
  time() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        var currentTime = DateTime.now();
        formattedTime = "${currentTime.hour}:${currentTime.minute}".toString();
      });
    });
    return formattedTime;
  }

  date() {
    var today = DateTime.now();
    String formatteDate = "${today.day} / ${today.month} / ${today.year}";
    return formatteDate;
  }

  @override
  Widget build(BuildContext context) {
    var now = time();
    var postDate = date();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 30,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      "https://images.unsplash.com/photo-1556997685-309989c1aa82?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=873&q=80",
                      fit: BoxFit.cover,
                    )),
              ),
              const SizedBox(
                width: 20,
              ),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "John Doe",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  Text(
                    "@johndoe",
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
              const Spacer(),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.more_horiz,
                    color: Colors.white,
                  ))
            ],
          ),
          const Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
            style: TextStyle(color: Colors.white),
          ),
          const Text(
            "#loremipsum",
            style: TextStyle(color: Colors.blue),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey,
                image: const DecorationImage(
                    image: NetworkImage(
                        "https://images.unsplash.com/photo-1533738363-b7f9aef128ce?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=435&q=80"),
                    fit: BoxFit.cover)),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "$now ",
                style: const TextStyle(color: Colors.white),
              ),
              Text(
                "  $postDate",
                style: const TextStyle(color: Colors.white),
              ),
              const PlatformDisplay()
            ],
          ),
          const Divider(
            color: Colors.grey,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                    text: const TextSpan(children: [
                  TextSpan(
                      text: '2345 ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white)),
                  TextSpan(
                      text: 'Retweets',
                      style: TextStyle(
                          fontWeight: FontWeight.normal, color: Colors.white)),
                ])),
                RichText(
                    text: const TextSpan(children: [
                  TextSpan(
                      text: '2345 ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white)),
                  TextSpan(
                      text: 'Quote tweets',
                      style: TextStyle(
                          fontWeight: FontWeight.normal, color: Colors.white)),
                ])),
                RichText(
                    text: const TextSpan(children: [
                  TextSpan(
                      text: '12.4k ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white)),
                  TextSpan(
                      text: 'Likes',
                      style: TextStyle(
                          fontWeight: FontWeight.normal, color: Colors.white)),
                ])),
              ],
            ),
          ),
          const Divider(
            color: Colors.grey,
          ),
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.comment,color: Colors.grey,),
                Icon(Icons.recycling,color: Colors.grey),
                Icon(Icons.favorite_border,color: Colors.grey),
                Icon(Icons.file_upload_outlined,color: Colors.grey),
                ],
            ),
          )
        ],
      ),
    );
  }
}
