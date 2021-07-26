import 'package:cocktail_app/models/cocktail_entity.dart';

abstract class CocktailsRepository {

  Future<CocktailEntity> loadRandomCocktail();

  Future<CocktailEntity> searchCocktailByName();
}