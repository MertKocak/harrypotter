import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:harrypotter/constants/colors.dart';
import 'package:harrypotter/ui/widgets/custom_appbar.dart';
import '../../models/character.dart';

// Karakter detay sayfası

class DetailPage extends StatelessWidget {
  final Character character;
  const DetailPage({super.key, required this.character});

  // House'a göre asset yolu dönen fonksiyon
  String getHouseImage(String house) {
    final houseLower = house.toLowerCase();
    const houseImages = {
      'gryffindor': 'assets/images/gryffindor.png',
      'slytherin': 'assets/images/slytherin.png',
      'hufflepuff': 'assets/images/hufflepuff.png',
      'ravenclaw': 'assets/images/ravenclaw.png',
    };
    return houseImages[houseLower] ?? 'assets/images/unknown.png';
  }

  // House'a göre color dönen fonksiyon
  Color getHouseColor(String house) {
    final houseLower = house.toLowerCase();
    switch (houseLower) {
      case 'gryffindor':
        return Colors.deepOrange;
      case 'slytherin':
        return const Color.fromARGB(255, 89, 180, 166);
      case 'hufflepuff':
        return Colors.yellow.shade700;
      case 'ravenclaw':
        return const Color.fromARGB(255, 41, 112, 170);
      default:
        return Colors.grey;
    }
  }

  String capitalize(String text) => text.isNotEmpty
      ? '${text[0].toUpperCase()}${text.substring(1)}'
      : 'Unknown';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Karakter resmi
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image.network(
                    character.image,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                    errorBuilder: (_, __, ___) => Image.asset(
                      'assets/images/image_not_found.png',
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // İsim ve oyuncu
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildTitleText(character.name),
                        _buildSubtitleText(character.actor),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: _buildSubtitleText(
                      character.alive ? "Alive" : "Dead",
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              // House bilgisi
              Row(
                children: [
                  Image.asset(
                    getHouseImage(character.house),
                    width: 28,
                    height: 28,
                  ),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      character.house.trim().isEmpty
                          ? 'Unknown House'
                          : character.house,
                      style: GoogleFonts.medievalSharp(
                        color: getHouseColor(character.house),
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              // Species | Gender | Ancestry
              _buildInfoBox([
                capitalize(character.species),
                capitalize(character.gender),
                capitalize(character.ancestry),
              ]),

              const SizedBox(height: 16),

              // Hair | Eye
              _buildInfoBox([
                "Hair Color: ${capitalize(character.hairColour)}",
                "Eye Color: ${capitalize(character.eyeColour)}",
              ]),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTitleText(String text) => Text(
    text,
    style: GoogleFonts.poppins(
      color: AppColors.primary,
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),
  );

  Widget _buildSubtitleText(String text) => Text(
    text,
    style: GoogleFonts.poppins(
      color: AppColors.textPrimary,
      fontSize: 14,
      fontWeight: FontWeight.normal,
    ),
  );

  Widget _buildInfoBox(List<String> items) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.secondary,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children:
            items
                .expand(
                  (item) => [Text(item, style: _infoTextStyle()), _separator()],
                )
                .toList()
              ..removeLast(), // Son | işaretini sil
      ),
    );
  }

  TextStyle _infoTextStyle() => GoogleFonts.poppins(
    color: AppColors.textSecondary,
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );

  Widget _separator() => Text(
    "|",
    style: _infoTextStyle().copyWith(color: AppColors.textSecondary),
  );
}
