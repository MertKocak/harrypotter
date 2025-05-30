import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/character.dart';
import '../services/character_service.dart';

// Provider

final characterProvider = FutureProvider<List<Character>>((ref) async {
  return CharacterService().fetchCharacters();
});
