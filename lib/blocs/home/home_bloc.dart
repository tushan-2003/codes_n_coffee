import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:codes_n_coffee_assignment/api/fetch_recipe_detail.dart';
import 'package:codes_n_coffee_assignment/api/fetch_recipes.dart';
import 'package:codes_n_coffee_assignment/data/saved_recipes.dart';
import 'package:codes_n_coffee_assignment/model/recipe_model.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(_onHomeInitialEvent);
    on<SaveRecipe>(_onSaveRecipe);
    on<NavigateToRecipePage>(_onNavigateToRecipePage);
    on<NavigateToSavedPage>(_onNavigateToSavedPage);
  }

  FutureOr<void> _onHomeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoading());
    await FetchRecipes()
        .fetchRecipe(event.query)
        .then((value) => emit(HomeLoaded(recipes: value)))
        .onError(
            (error, stackTrace) => emit(HomeError(error: error.toString())));
  }

  FutureOr<void> _onNavigateToRecipePage(
      NavigateToRecipePage event, Emitter<HomeState> emit) async {
    String image =
        await FetchRecipeDetails().fetchRecipeDetails(event.id.toString());
    emit(HomeToRecipePage(image: image));
  }

  FutureOr<void> _onNavigateToSavedPage(
      NavigateToSavedPage event, Emitter<HomeState> emit) {
    emit(HomeToSavedPage());
  }

  FutureOr<void> _onSaveRecipe(SaveRecipe event, Emitter<HomeState> emit) {
    savedRecipes.add(event.recipe);
    emit(RecipeSavedState());
  }
}
