import 'package:flutter/material.dart';
import 'package:lesson2/model/post.dart';
import 'package:lesson2/services/api_service.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({super.key});

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  final TextEditingController _bodyC = TextEditingController();
  final TextEditingController _titleC = TextEditingController();
  bool isLoading = false;

  _createPost() async {
    setState(() {
      isLoading = true;
    });
    Post post =
        Post(userId: 11, id: 11, title: _bodyC.text, body: _titleC.text);
    ApiService.createPost(post).then((value) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(value.title!)));
      setState(() {
        isLoading = false;
      });
      Navigator.pop(context);
    });
  }

  _updatePost() async {
    setState(() {
      isLoading = true;
    });
    Post post =
        Post(userId: 11, id: 11, title: _bodyC.text, body: _titleC.text);
    ApiService.putPost(post).then((value) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Yangilandi ${value.title!}")));
      setState(() {
        isLoading = false;
      });
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: isLoading
            ? const CircularProgressIndicator.adaptive()
            : Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(
                      controller: _bodyC,
                      decoration: const InputDecoration(hintText: "body"),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: _titleC,
                      decoration: const InputDecoration(hintText: "title"),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              _updatePost();
                            },
                            child: const Text("Update")),
                        const SizedBox(
                          width: 16,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              _createPost();
                            },
                            child: const Text("Post")),
                      ],
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
