import 'package:cocktail_app/cocktail_app.dart';
import 'package:cocktail_app/network_repository.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(CocktailApp(repository: NetworkRepository()));
}

