import 'package:cocktail_app/models/cocktail.dart';
import 'package:cocktail_app/models/cocktail_entity.dart';

abstract class CocktailsRepository {

  Future<List<CocktailEntity>> loadCocktails();
}