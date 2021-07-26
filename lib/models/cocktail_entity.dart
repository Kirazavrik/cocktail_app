class CocktailEntity {
  String? id;
  String? name;
  String? instruction;
  List<Drinks>? drinkss;
  List<Drinks>? drinks;
  String? ingredient1;
  String? ingredient2;
  String? ingredient3;
  String? ingredient4;
  String? thumbnail;

  CocktailEntity(
      {this.id,
      this.name,
      this.instruction,
      this.ingredient1,
      this.ingredient2,
      this.ingredient3,
      this.ingredient4,
      this.thumbnail,
      this.drinks});

  CocktailEntity fromJson(Map<String, dynamic> json) {
    if (json['drinks'] != null) {
      drinkss = <Drinks>[];
      json['drinks'].forEach((v) {
        drinkss!.add(new Drinks.fromJson(v));
      });
    }
    return CocktailEntity(
        id: drinkss![0].idDrink,
        name: drinkss![0].strDrink,
        instruction: drinkss![0].strInstructions,
        ingredient1: drinkss![0].strIngredient1,
        ingredient2: drinkss![0].strIngredient2,
        ingredient3: drinkss![0].strIngredient3,
        ingredient4: drinkss![0].strIngredient4,
        thumbnail: drinkss![0].strDrinkThumb,
    drinks: drinkss);
  }


  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ instruction.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CocktailEntity &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          instruction == other.instruction;
}

class Drinks {
  late String idDrink;
  late String strDrink;
  late String strInstructions;
  String? strIngredient1;
  String? strIngredient2;
  String? strIngredient3;
  String? strIngredient4;
  late String strDrinkThumb;

  Drinks(
      {required this.idDrink,
      required this.strDrink,
      required this.strInstructions,
      this.strIngredient1,
      this.strIngredient2,
      this.strIngredient3,
      this.strIngredient4,
      required this.strDrinkThumb});

  Drinks.fromJson(Map<String, dynamic> json) {
    idDrink = json['idDrink'];
    strDrink = json['strDrink'];
    strInstructions = json['strInstructions'];
    strIngredient1 = json['strIngredient1'];
    strIngredient2 = json['strIngredient2'];
    strIngredient3 = json['strIngredient3'];
    strIngredient4 = json['strIngredient4'];
    strDrinkThumb = json['strDrinkThumb'];
  }
}
