// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CharacterImpl _$$CharacterImplFromJson(Map<String, dynamic> json) =>
    _$CharacterImpl(
      name: json['name'] as String,
      image: json['image'] as String,
      species: json['species'] as String,
      gender: json['gender'] as String,
      house: json['house'] as String,
      ancestry: json['ancestry'] as String,
      eyeColour: json['eyeColour'] as String,
      hairColour: json['hairColour'] as String,
      actor: json['actor'] as String,
      alive: json['alive'] as bool,
    );

Map<String, dynamic> _$$CharacterImplToJson(_$CharacterImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'image': instance.image,
      'species': instance.species,
      'gender': instance.gender,
      'house': instance.house,
      'ancestry': instance.ancestry,
      'eyeColour': instance.eyeColour,
      'hairColour': instance.hairColour,
      'actor': instance.actor,
      'alive': instance.alive,
    };
