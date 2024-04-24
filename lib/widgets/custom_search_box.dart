import 'package:codes_n_coffee_assignment/blocs/home/home_bloc.dart';
import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({
    super.key,
    required TextEditingController searchController,
    required HomeBloc homeBloc,
  })  : _searchController = searchController,
        _homeBloc = homeBloc;

  final TextEditingController _searchController;
  final HomeBloc _homeBloc;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 206, 205, 205), borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: TextField(
          controller: _searchController,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Search Recipes...',
            suffixIcon: IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                final String query = _searchController.text;
                _homeBloc.add(HomeInitialEvent(query: query));
              },
            ),
          ),
          onSubmitted: (value) {
            final String query = _searchController.text;
            _homeBloc.add(HomeInitialEvent(query: query));
          },
        ),
      ),
    );
  }
}
