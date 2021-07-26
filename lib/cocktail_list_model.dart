
import 'package:cocktail_app/cocktails_repository.dart';
import 'package:cocktail_app/models/cocktail.dart';
import 'package:flutter/widgets.dart';

class CocktailListModel extends ChangeNotifier {
  final CocktailsRepository repository;

  List<Cocktail> _cocktails;
  List<Cocktail> get cocktails => _cocktails;
  List<Cocktail> _searchedCocktails = <Cocktail>[];
  List<Cocktail> get searchedCocktails => _searchedCocktails;


  bool _isLoading = false;
  bool get isLoading => _isLoading;


  CocktailListModel({
    required this.repository, List<Cocktail>? cocktails,
  }) : _cocktails = cocktails ?? [];

  Future loadCocktail() {
    return repository.loadRandomCocktail().then((loadedCocktails) {
      Cocktail randCocktail = Cocktail.fromEntity(loadedCocktails);
      _cocktails.add(randCocktail);
    }).catchError((onError) {
    });
  }

  Future loadSearchedCocktails(String query) async {
    _isLoading = true;

    return repository.searchCocktailByName(query).then((searchedCocktails) {
      _searchedCocktails = Cocktail.fromEntities(searchedCocktails);

      _isLoading = false;
      notifyListeners();
    });
  }

  loadCocktails() async{
    _isLoading = true;
    notifyListeners();
    for(var i = 0; i <= 10; i++) {
      await loadCocktail();
    }
    _isLoading = false;
    notifyListeners();
  }
}