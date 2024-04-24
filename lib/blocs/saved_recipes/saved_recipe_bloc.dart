import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:codes_n_coffee_assignment/api/fetch_recipe_detail.dart';
import 'package:codes_n_coffee_assignment/data/saved_recipes.dart';
import 'package:codes_n_coffee_assignment/model/recipe_model.dart';
import 'package:meta/meta.dart';

part 'saved_recipe_event.dart';
part 'saved_recipe_state.dart';

class SavedRecipeBloc extends Bloc<SavedRecipeEvent, SavedRecipeState> {
  SavedRecipeBloc() : super(SavedRecipeInitial()) {
    on<SavedRecipeInitialEvent>(_onSavedRecipeInitialEvent);
    on<NavigateToRecipePage>(_onNavigateToRecipePage);
    on<RemoveSavedRecipe>(_onRemoveSavedRecipe);
  }

  FutureOr<void> _onSavedRecipeInitialEvent(
      SavedRecipeInitialEvent event, Emitter<SavedRecipeState> emit) {
    print(savedRecipes);
    emit(SavedRecipeLoaded(saved: savedRecipes));
  }

  FutureOr<void> _onRemoveSavedRecipe(
      RemoveSavedRecipe event, Emitter<SavedRecipeState> emit) {
    savedRecipes.remove(event.recipe);
    emit(RemoveSavedRecipeState());
    emit(SavedRecipeLoaded(saved: savedRecipes));
  }

  FutureOr<void> _onNavigateToRecipePage(
      NavigateToRecipePage event, Emitter<SavedRecipeState> emit) async {
    String image =
        await FetchRecipeDetails().fetchRecipeDetails(event.id.toString());
    emit(SavedToRecipePage(image: image));
  }
}
