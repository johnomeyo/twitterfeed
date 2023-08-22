import 'package:flutter/material.dart';
import 'package:twitter_api/api/models/post.dart';
import 'package:twitter_api/api/services/remote_services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Post>? posts;
  var isLoaded = false;
  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    posts = await RemoteService().getPosts();
    if (posts != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Api Homepage"),
      ),
      body: Visibility(
        visible: isLoaded,
        replacement: const CircularProgressIndicator(),
        child: ListView.builder(
            itemCount: posts?.length,
            itemBuilder: (context, index) => const Text("data")),
      ),
    );
  }
}
