import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_spotify_app/core/config/theme/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ModeWidget extends StatelessWidget {
  final String modeAsset;
  final String modeText;
  final bool isSelected;
  const ModeWidget({
    super.key,
    required this.modeAsset,
    required this.modeText,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipOval(
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 10,
              sigmaY: 10,
            ),
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: AppColors.dartGray.withOpacity(0.5),
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? Colors.green : Colors.transparent,
                  width: 3,
                ),
              ),
              child: SvgPicture.asset(
                modeAsset,
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
        ),
        const SizedBox(height: 15),
        Text(
          modeText,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 17,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
