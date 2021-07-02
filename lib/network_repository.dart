import 'dart:convert';

import 'package:cocktail_app/cocktails_repository.dart';
import 'package:cocktail_app/models/cocktail_entity.dart';
import 'package:http/http.dart' as http;


class NetworkRepository extends CocktailsRepository {

  CocktailEntity entity;
  Future<List<CocktailEntity>> list;

  @override
  Future<List<CocktailEntity>> loadCocktails() async {
    final response =
        await http.get(Uri.parse("https://www.thecocktaildb.com/api/json/v1/1/random.php"));
    if (response.statusCode == 200)
      entity = CocktailEntity.fromJson(jsonDecode(response.body));
    }
  }

}