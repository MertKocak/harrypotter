import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:harrypotter/constants/colors.dart';
import '../../models/character.dart';
import '../pages/detail_page.dart';

//kart yapısı

class CharacterCard extends StatelessWidget {
  final Character character;

  const CharacterCard({super.key, required this.character});

  String getHouseImage(String house) {
    final houseImages = {
      'gryffindor': 'assets/images/gryffindor.png',
      'slytherin': 'assets/images/slytherin.png',
      'hufflepuff': 'assets/images/hufflepuff.png',
      'ravenclaw': 'assets/images/ravenclaw.png',
    };
    return houseImages[house.toLowerCase()] ?? 'assets/images/unknown.png';
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => DetailPage(character: character)),
      ),
      child: Card(
        color: AppColors.secondary,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Row(
          children: [
            _buildCharacterImage(),
            const SizedBox(width: 12),
            _buildCharacterInfo(),
            const Padding(
              padding: EdgeInsets.only(right: 16),
              child: Icon(
                Icons.chevron_right,
                color: AppColors.primary,
                size: 28,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCharacterImage() {
    final imageUrl = character.image.trim();
    final imageWidget = imageUrl.isEmpty
        ? Image.asset(
            'assets/images/image_not_found.png',
            width: 80,
            height: 80,
            fit: BoxFit.cover,
          )
        : Image.network(
            imageUrl,
            width: 80,
            height: 80,
            fit: BoxFit.cover,
            alignment: Alignment.topCenter,
            errorBuilder: (context, error, stackTrace) => const Icon(
              Icons.image_not_supported,
              size: 48,
              color: AppColors.textSecondary,
            ),
          );

    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(8),
        bottomLeft: Radius.circular(8),
      ),
      child: imageWidget,
    );
  }

  Widget _buildCharacterInfo() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            character.name,
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            character.actor.trim().isEmpty ? 'Unknown Actor' : character.actor,
            style: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.normal,
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
