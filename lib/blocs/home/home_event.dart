part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class HomeInitialEvent extends HomeEvent {
  final String query;

  HomeInitialEvent({required this.query});
}

class SaveRecipe extends HomeEvent {
  final RecipeModel recipe;

  SaveRecipe({required this.recipe});
}

class HomeLoadingEvent extends HomeEvent {}

class NavigateToRecipePage extends HomeEvent {
  final int id;

  NavigateToRecipePage({required this.id});
}

class NavigateToSavedPage extends HomeEvent {}
