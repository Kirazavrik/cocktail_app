import 'dart:collection';

import 'package:cocktail_app/cocktails_repository.dart';
import 'package:cocktail_app/models/cocktail.dart';
import 'package:flutter/widgets.dart';

class CocktailListModel extends ChangeNotifier {
  final CocktailsRepository repository;

  List<Cocktail> _cocktails;
  List<Cocktail> get cocktails => _cocktails;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  CocktailListModel({
    @required this.repository, List<Cocktail> cocktails
  }) : _cocktails = cocktails ?? [];

  Future loadCocktails() {
    _isLoading = true;
    notifyListeners();

    return repository.loadCocktails().then((loadedCocktails) {
      _cocktails.addAll(loadedCocktails.map(Cocktail.fromEntity));
      _isLoading = false;
      notifyListeners();
    }).catchError((onError) {
      _isLoading = false;
      notifyListeners();
    });
  }
}