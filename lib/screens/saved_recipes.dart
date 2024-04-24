import 'package:codes_n_coffee_assignment/blocs/saved_recipes/saved_recipe_bloc.dart';
import 'package:codes_n_coffee_assignment/screens/recipe_screen.dart';
import 'package:codes_n_coffee_assignment/widgets/custome_saved_recipe_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SavedRecipePage extends StatefulWidget {
  const SavedRecipePage({super.key});

  @override
  State<SavedRecipePage> createState() => _SavedRecipePageState();
}

class _SavedRecipePageState extends State<SavedRecipePage> {
  @override
  void initState() {
    super.initState();
    _savedBloc.add(SavedRecipeInitialEvent());
  }

  final SavedRecipeBloc _savedBloc = SavedRecipeBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SavedRecipeBloc, SavedRecipeState>(
      bloc: _savedBloc,
      listenWhen: (previous, current) => current is SavedRecipeActionState,
      buildWhen: (previous, current) => current is! SavedRecipeActionState,
      listener: (context, state) {
        if (state is SavedToRecipePage) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => RecipePage(image: state.image),
              ));
        }
        if (state is RemoveSavedRecipeState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text("Recipe unsaved")));
        }
      },
      builder: (context, state) {
        if (state is SavedRecipeLoading) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is SavedRecipeLoaded) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Saved Recipes"),
            ),
            body: Column(
              children: [
                SavedRecipeTile(
                  savedBloc: _savedBloc,
                  state: state,
                ),
              ],
            ),
          );
        } else {
          return const Scaffold(
            body: Center(
              child: Text("Error"),
            ),
          );
        }
      },
    );
  }
}
