import 'package:cocktail_app/cocktail_list_model.dart';
import 'package:cocktail_app/cocktails_repository.dart';
import 'package:cocktail_app/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CocktailApp extends StatelessWidget {
  final CocktailsRepository repository;

  CocktailApp({required this.repository});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => CocktailListModel(repository: repository)..loadCocktails(),
        child: MaterialApp(
          title: 'App',
          theme: ThemeData(
            primarySwatch: Colors.blue
          ),
          home: MainScreen(),
        ),
        );
  }
  
}