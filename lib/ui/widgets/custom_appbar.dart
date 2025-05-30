import 'package:flutter/material.dart';
import 'package:harrypotter/constants/colors.dart';

// AppBar yapısı

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;

  const CustomAppBar({super.key, this.height = kToolbarHeight});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.background,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(color: AppColors.primary),
      title: Image.asset(
        'assets/images/logo.png',
        height: height * 0.6
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
