import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'cocktail_list_model.dart';

class CustomSearchDelegate extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.done),
          onPressed: () {})
    ];
    }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      child: Consumer<CocktailListModel>(
        builder: (context, model, child) {
          model.loadSearchedCocktails(query);
          return Text(model.searchedCocktails[0].name!);
        },
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }

}