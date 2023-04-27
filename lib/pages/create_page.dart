import 'package:flutter/material.dart';
import 'package:lesson2/model/post.dart';
import 'package:lesson2/services/api_service.dart';
import 'package:lesson2/viewmodel/create_page_view_model.dart';
import 'package:provider/provider.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({super.key});

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CreatePageViewModel(),
      child: Consumer(
        builder: (context, CreatePageViewModel object, child) => Scaffold(
          body: Center(
            child: object.isLoading
                ? const CircularProgressIndicator.adaptive()
                : Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextField(
                          controller: object.bodyC,
                          decoration: const InputDecoration(hintText: "body"),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextField(
                          controller: object.titleC,
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
                                  object.updatePost(context);
                                },
                                child: const Text("Update")),
                            const SizedBox(
                              width: 16,
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  object.createPost(context);
                                },
                                child: const Text("Post")),
                          ],
                        ),
                      ],
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
