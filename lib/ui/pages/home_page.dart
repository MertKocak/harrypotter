import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:harrypotter/constants/colors.dart';
import 'package:harrypotter/ui/widgets/custom_appbar.dart';
import 'package:harrypotter/utils/AppException.dart';
import '../../providers/character_provider.dart';
import '../widgets/character_card.dart';

// anasayfa

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final charactersAsync = ref.watch(characterProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CustomAppBar(),
      body: charactersAsync.when(
        data: (characters) => ListView.builder(
          itemCount: characters.length,
          itemBuilder: (context, index) {
            final character = characters[index];
            return CharacterCard(character: character);
          },
        ),
        loading: () => const Center(
          child: CircularProgressIndicator(color: AppColors.primary),
        ),
        error: (err, _) {
          String errorMessage = 'Bilinmeyen bir hata oluştu';
          if (err is AppException) {
            errorMessage = err.message;
          } else {
            errorMessage = err.toString();
          }
          return Center(
            child: Text(
              errorMessage,
              style: GoogleFonts.cardo(
                color: AppColors.primary,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
          );
        },
      ),
    );
  }
}
