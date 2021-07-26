import 'dart:convert';

import 'package:cocktail_app/cocktails_repository.dart';
import 'package:cocktail_app/models/cocktail_entity.dart';
import 'package:http/http.dart' as http;


class NetworkRepository extends CocktailsRepository {

  CocktailEntity entity = CocktailEntity();

  @override
  Future<CocktailEntity> loadRandomCocktail() async {
    final response =
        await http.get(Uri.parse("https://www.thecocktaildb.com/api/json/v1/1/random.php"));
    if (response.statusCode == 200) {
      return entity.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed');
    }
  }

  @override
  Future<CocktailEntity> searchCocktailByName(String query) async {
    final response =
    await http.get(Uri.parse("https://www.thecocktaildb.com/api/json/v1/1/search.php?s=$query"));
    if (response.statusCode == 200) {
      return entity.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed');
    }
  }

}