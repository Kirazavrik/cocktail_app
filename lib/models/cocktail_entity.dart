class CocktailEntity {
  String id;
  String name;
  String instruction;

  List<Drinks> drinks;

  CocktailEntity({this.id, this.name, this.instruction, this.drinks});

  CocktailEntity.fromJson(Map<String, dynamic> json) {
    if (json['drinks'] != null) {
      drinks = <Drinks>[];
      json['drinks'].forEach((v) {
        drinks.add(new Drinks.fromJson(v));
      });
    }
  }


  @override
  int get hashCode =>
      id.hashCode ^ name.hashCode ^ instruction.hashCode;

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
  String idDrink;
  String strDrink;
  String strInstructions;

  Drinks({this.idDrink, this.strDrink, this.strInstructions});

  Drinks.fromJson(Map<String, dynamic> json) {
    idDrink = json['idDrink'];
    strDrink = json['strDrink'];
    strInstructions = json['strInstructions'];
  }
}