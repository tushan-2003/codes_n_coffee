import 'package:codes_n_coffee_assignment/blocs/home/home_bloc.dart';
import 'package:flutter/material.dart';

class RecipeTile extends StatelessWidget {
  const RecipeTile({
    super.key,
    required this.success,
    required HomeBloc homeBloc,
  }) : _homeBloc = homeBloc;

  final HomeLoaded success;
  final HomeBloc _homeBloc;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
            itemCount: success.recipes.length,
            itemBuilder: (context, index) {
              return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  child: InkWell(
                    onTap: () {
                      _homeBloc.add(
                          NavigateToRecipePage(id: success.recipes[index].id));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 224, 232, 238),
                          borderRadius: BorderRadius.circular(10)),
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
                                  success.recipes[index].image,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Expanded(child: Text(success.recipes[index].title)),
                          IconButton(
                              onPressed: () {
                                _homeBloc.add(
                                    SaveRecipe(recipe: success.recipes[index]));
                              },
                              icon: const Icon(Icons.add))
                        ],
                      ),
                    ),
                  ));
            }));
  }
}
