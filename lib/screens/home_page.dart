import 'package:codes_n_coffee_assignment/blocs/home/home_bloc.dart';
import 'package:codes_n_coffee_assignment/screens/recipe_screen.dart';
import 'package:codes_n_coffee_assignment/screens/saved_recipes.dart';
import 'package:codes_n_coffee_assignment/widgets/custom_recipe_tile.dart';
import 'package:codes_n_coffee_assignment/widgets/custom_search_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();
  late HomeBloc _homeBloc;
  @override
  void initState() {
    super.initState();
    _homeBloc = BlocProvider.of<HomeBloc>(context);
    _homeBloc.add(HomeInitialEvent(query: ""));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      buildWhen: (previous, current) => current is! HomeActionState,
      listenWhen: (previous, current) => current is HomeActionState,
      listener: (BuildContext context, HomeState state) {
        if (state is HomeToRecipePage) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => RecipePage(image: state.image),
              ));
        }
        if (state is HomeToSavedPage) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const SavedRecipePage(),
              ));
        }
        if (state is RecipeSavedState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text("Recipe Saved")));
        }
      },
      builder: (context, state) {
        if (state is HomeLoading) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is HomeLoaded) {
          final success = state;

          return Scaffold(
              appBar: AppBar(
                title: const Text('Recipes'),
                actions: [
                  IconButton(
                      onPressed: () {
                        _homeBloc.add(NavigateToSavedPage());
                      },
                      icon: const Icon(Icons.bookmark)),
                ],
              ),
              body: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SearchBox(
                        searchController: _searchController,
                        homeBloc: _homeBloc),
                  ),
                  RecipeTile(success: success, homeBloc: _homeBloc)
                ],
              ));
        } else if (state is HomeError) {
          return Scaffold(
            body: Center(
              child: Text(state.error),
            ),
          );
        } else {
          return const Scaffold(
            body: Center(
              child: Text("Failed to Load"),
            ),
          );
        }
      },
    );
  }
}
