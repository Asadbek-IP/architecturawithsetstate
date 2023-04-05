import 'package:flutter/material.dart';
import 'package:lesson2/model/post.dart';
import 'package:lesson2/pages/create_page.dart';
import 'package:lesson2/services/api_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Post> posts = [];
  bool isLoading = false;

  _getApi() async {
    setState(() {
      isLoading = true;
    });

    ApiService.getAllPost().then((value) {
      setState(() {
        posts = value;
        isLoading = false;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _getApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: ((context) => CreatePage())));
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(),
      body: isLoading
          ? const CircularProgressIndicator()
          : ListView.builder(
              itemBuilder: ((context, index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          posts[index].title!,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(posts[index].body!),
                      ],
                    ),
                  )),
            ),
    );
  }
}
