import 'package:codes_n_coffee_assignment/blocs/saved_recipes/saved_recipe_bloc.dart';
import 'package:flutter/material.dart';

class SavedRecipeTile extends StatelessWidget {
  const SavedRecipeTile({
    super.key,
    required SavedRecipeBloc savedBloc,
    required this.state,
  }) : _savedBloc = savedBloc;

  final SavedRecipeBloc _savedBloc;
  final SavedRecipeLoaded state;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
      itemCount: state.saved.length,
      itemBuilder: (context, index) {
        return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            child: InkWell(
              onTap: () {
                _savedBloc.add(NavigateToRecipePage(id: state.saved[index].id));
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromARGB(255, 224, 232, 238),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 5),
                      child: SizedBox(
                        height: 100,
                        width: 100,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            state.saved[index].image,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Expanded(child: Text(state.saved[index].title)),
                    IconButton(
                        onPressed: () {
                          _savedBloc.add(
                              RemoveSavedRecipe(recipe: state.saved[index]));
                        },
                        icon: const Icon(Icons.minimize))
                  ],
                ),
              ),
            ));
      },
    ));
  }
}
