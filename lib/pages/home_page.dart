import 'package:flutter/material.dart';
import 'package:lesson2/model/post.dart';
import 'package:lesson2/pages/create_page.dart';
import 'package:lesson2/services/api_service.dart';
import 'package:lesson2/viewmodel/home_view_model.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomePageViewModel homePageViewModel = HomePageViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homePageViewModel.getApi();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: ((context) => homePageViewModel),
      child: Consumer<HomePageViewModel>(builder: (context, provider, child) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => CreatePage())));
            },
            child: const Icon(Icons.add),
          ),
          appBar: AppBar(),
          body: provider.isLoading
              ? const CircularProgressIndicator()
              : ListView.builder(
                  itemCount: provider.posts.length,
                  itemBuilder: ((context, index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              provider.posts[index].title!,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(provider.posts[index].body!),
                          ],
                        ),
                      )),
                ),
        );
      }),
    );
  }
}
