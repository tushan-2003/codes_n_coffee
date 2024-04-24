import 'package:codes_n_coffee_assignment/blocs/home/home_bloc.dart';
import 'package:codes_n_coffee_assignment/blocs/saved_recipes/saved_recipe_bloc.dart';
import 'package:codes_n_coffee_assignment/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider<HomeBloc>(
              create: (_) => HomeBloc()..add(HomeInitialEvent(query: ''))),
          BlocProvider<SavedRecipeBloc>(
              create: (_) => SavedRecipeBloc()..add(SavedRecipeInitialEvent())),
        ],
        child: const HomePage(),
      ),
    );
  }
}
