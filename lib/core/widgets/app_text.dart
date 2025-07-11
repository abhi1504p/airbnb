import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';

/// A reusable and simplified text widget that allows easy customization.
/// [AppText] reduces boilerplate by letting you set common [TextStyle] values
/// directly, and includes named constructors like `.heading(), `.body()`, and
/// `.caption()` for consistent app-wide typography usage.
class AppText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final bool? softWrap;
  final TextScaler? textScaleFactor;

  const AppText(
    this.text, {
    super.key,
    this.style,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.softWrap,
    this.textScaleFactor,
  });

  /// Heading style (based on titleLarge)
  factory AppText.heading(
    String text, {
    Key? key,
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
  }) {
    return AppText(
      text,
      key: key,
      style: GoogleFonts.poppins(
        color: color, // will be set in build
        fontSize: fontSize ?? 22,
        fontWeight: fontWeight ?? FontWeight.bold,
      ),
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }

  /// Body text style (based on bodyMedium)
  factory AppText.body(
    String text, {
    Key? key,
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
  }) {
    return AppText(
      text,
      key: key,
      style: GoogleFonts.poppins(
        color: color, // will be set in build
        fontSize: fontSize ?? 16,
        fontWeight: fontWeight ?? FontWeight.normal,
      ),
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }

  /// Caption style (for small, secondary text)
  factory AppText.caption(
    String text, {
    Key? key,
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
  }) {
    return AppText(
      text,
      key: key,
      style: GoogleFonts.poppins(
        color: color, // will be set in build
        fontSize: fontSize ?? 13,
        fontWeight: fontWeight ?? FontWeight.w400,
      ),
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }

  @override
  Widget build(BuildContext context) {
    Color? effectiveColor = style?.color;
    TextStyle effectiveStyle = style ?? const TextStyle();
    if (effectiveColor == null) {
      if (effectiveStyle.fontWeight == FontWeight.bold &&
          (effectiveStyle.fontSize ?? 0) >= 20) {
        effectiveColor = AppColors.headingColor(context);
      } else if ((effectiveStyle.fontSize ?? 0) <= 14) {
        effectiveColor = AppColors.captionColor(context);
      } else {
        effectiveColor = AppColors.bodyColor(context);
      }
      effectiveStyle = effectiveStyle.copyWith(color: effectiveColor);
    }
    return Text(
      text,
      style: effectiveStyle,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      softWrap: softWrap,
      textScaler: textScaleFactor,
    );
  }
}
