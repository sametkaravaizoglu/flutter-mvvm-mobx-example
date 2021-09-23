import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../view_model/home_view_model.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  HomeViewModel viewModel = HomeViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Observer(
          builder: (context) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    viewModel.post != null
                        ? viewModel.post!.title!
                        : "İstek gönderilmedi",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  Text(
                    viewModel.post != null ? viewModel.post!.body! : "",
                  ),
                ],
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          viewModel.getPost();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
