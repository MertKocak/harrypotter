import 'package:freezed_annotation/freezed_annotation.dart';

part 'character.freezed.dart';
part 'character.g.dart';

// API'den çekilecek veriler

@freezed
class Character with _$Character {
  const factory Character({
    required String name,
    required String image,
    required String species,
    required String gender,
    required String house,
    required String ancestry,
    required String eyeColour,
    required String hairColour,
    required String actor,
    required bool alive,

  }) = _Character;

  factory Character.fromJson(Map<String, dynamic> json) =>
      _$CharacterFromJson(json);
}
