import 'package:cocktail_app/models/cocktail_entity.dart';

class Cocktail {
  final String id;
  final String name;
  final String instruction;

  Cocktail({this.id, this.instruction, this.name});

  @override
  String toString() {
    return 'Cocktail{id: $id, name: $name, description: $instruction';
  }

  @override
  int get hashCode =>
      id.hashCode ^ name.hashCode ^ instruction.hashCode;

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
      instruction: entity.instruction
    );
  }

}