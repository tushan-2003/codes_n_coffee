part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

abstract class HomeActionState extends HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeLoaded extends HomeState {
  final List<RecipeModel> recipes;

  HomeLoaded({required this.recipes});
}

final class HomeError extends HomeState {
  final String error;

  HomeError({required this.error});
}

final class HomeToRecipePage extends HomeActionState {
  final String image;

  HomeToRecipePage({required this.image});
}

final class HomeToSavedPage extends HomeActionState {}

final class RecipeSavedState extends HomeActionState {}
