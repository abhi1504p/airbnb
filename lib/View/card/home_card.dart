// HomeCard widget for CardModel
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../data/models/card/card_Model.dart';
import 'package:airbnb/core/widgets/app_text.dart';
import 'package:airbnb/core/theme/app_colors.dart';

class HomeCard extends StatelessWidget {
  final CardModel card;

  const HomeCard({super.key, required this.card});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 1, end: 1),
      duration: const Duration(milliseconds: 200),
      builder:
          (context, value, child) =>
              Transform.scale(scale: value, child: child),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () {},
        splashColor: isDark ? Colors.white24 : Colors.black12,
        child: Card(
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
          clipBehavior: Clip.antiAlias,
          color: isDark ? const Color(0xFF23223A) : Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 180,
                    child: Image.network(

                      'https://example.com/chromevilla.jpg',

                      fit: BoxFit.cover,
                      errorBuilder:
                          (context, error, stackTrace) => Container(
                            color: Colors.grey[300],
                            child: const Center(
                              child: Icon(Icons.broken_image, size: 48),
                            ),
                          ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors:
                              isDark
                                  ? [
                                    const Color(0xCC23223A),
                                    const Color(0x00000000),
                                  ]
                                  : [
                                    const Color(0xCC22223B),
                                    const Color(0x00000000),
                                  ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 16,
                    bottom: 16,
                    child: Row(
                      children: [
                        const Icon(Icons.star, color: Colors.amber, size: 20),
                        const SizedBox(width: 4),
                        AppText.body(
                          card.rating.toStringAsFixed(1),
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                child: Row(
                  children: [
                    Expanded(
                      child: AppText.heading(
                        card.name,
                        fontSize: 20,
                        color:
                            isDark
                                ? AppColors.headingColor(context)
                                : AppColors.headingColor(context),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    AppText.body(
                      '\$${card.price.toStringAsFixed(0)} /mo',
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color:
                          isDark
                              ? AppColors.bodyColor(context)
                              : AppColors.bodyColor(context),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                child: Row(
                  children: [
                    const Icon(
                      Icons.location_on,
                      color: Color(0xFF9A8C98),
                      size: 18,
                    ),
                    const SizedBox(width: 6),
                    Expanded(
                      child: AppText.caption(
                        card.location,
                        fontSize: 15,
                        color:
                            isDark
                                ? AppColors.captionColor(context)
                                : AppColors.captionColor(context),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
