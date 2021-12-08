import 'package:flutter/material.dart';

import "recipe.dart";

void main() {
  runApp(const RecipeApp());
}

class RecipeApp extends StatelessWidget {
  const RecipeApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // 2
    final ThemeData theme = ThemeData();

    return MaterialApp(
      title: 'Recipe Calculator',
      theme: theme.copyWith(
          colorScheme: theme.colorScheme.copyWith(
            primary: Colors.grey,
            secondary: Colors.black,
          )),
      home: const MyHomePage(title: 'Recipe Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        // child: Container(),
          child: ListView.builder(
            itemCount: Recipe.samples.length,
            itemBuilder: (BuildContext context, int index) {
              // return Text(Recipe.samples[index].label);

              // i guess we define this as a type of Widget
              Widget buildRecipeCard(Recipe recipe) {
                return Card(
                  child: Column(
                    //i guess here we specify that this is a list of widgets
                    children: <Widget>[
                      Image(image: AssetImage(recipe.imageUrl)),
                      Text(recipe.label),
                    ],
                  ),
                );
              }

              // and then we instantiate it
              return buildRecipeCard(Recipe.samples[index]);
            },
          )),
    );
  }
}
