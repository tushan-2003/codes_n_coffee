part of 'saved_recipe_bloc.dart';

@immutable
sealed class SavedRecipeEvent {}

class SavedRecipeInitialEvent extends SavedRecipeEvent {}

class RemoveSavedRecipe extends SavedRecipeEvent {
  final RecipeModel recipe;

  RemoveSavedRecipe({required this.recipe});
}

class NavigateToRecipePage extends SavedRecipeEvent {
  final int id;

  NavigateToRecipePage({required this.id});
}
