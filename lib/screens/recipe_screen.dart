import 'package:flutter/material.dart';

class RecipePage extends StatefulWidget {
  final String image;
  const RecipePage({super.key, required this.image});

  @override
  State<RecipePage> createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {
  @override
  void initState() {
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Recipe'),
        ),
        body: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Image.network(
              widget.image,
              fit: BoxFit.fill,
            )));
  }
}
