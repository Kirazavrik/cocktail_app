import 'package:cocktail_app/models/cocktail_entity.dart';

class Cocktail {
  final String? id;
  final String? name;
  final String? instruction;
  final String ingredient1;
  final String ingredient2;
  final String ingredient3;
  final String ingredient4;
  final String? thumbnail;

  Cocktail(
      {required this.id,
      required this.instruction,
      required this.name,
      required this.ingredient1,
      required this.ingredient2,
      required this.ingredient3,
      required this.ingredient4,
      this.thumbnail});

  @override
  String toString() {
    return 'Cocktail{id: $id, name: $name, description: $instruction';
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ instruction.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Cocktail &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          instruction == other.instruction;

  static Cocktail fromEntity(CocktailEntity entity) {
    return Cocktail(
      id: entity.id,
      name: entity.name,
      instruction: entity.instruction,
      ingredient1: entity.ingredient1 ?? "",
      ingredient2: entity.ingredient2 ?? "",
      ingredient3: entity.ingredient3 ?? "",
      ingredient4: entity.ingredient4 ?? "",
      thumbnail: entity.thumbnail,
    );
  }
}
