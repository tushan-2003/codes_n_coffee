part of 'saved_recipe_bloc.dart';

@immutable
sealed class SavedRecipeState {}

abstract class SavedRecipeActionState extends SavedRecipeState {}

final class SavedRecipeInitial extends SavedRecipeState {}

final class SavedRecipeLoading extends SavedRecipeState {}

final class SavedRecipeLoaded extends SavedRecipeState {
  final List<RecipeModel> saved;

  SavedRecipeLoaded({required this.saved});
}

final class SavedRecipeError extends SavedRecipeState {}

final class SavedToRecipePage extends SavedRecipeActionState {
  final String image;

  SavedToRecipePage({required this.image});
}

final class RemoveSavedRecipeState extends SavedRecipeActionState {}
