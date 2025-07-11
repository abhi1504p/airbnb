import 'package:flutter/material.dart';
import 'package:airbnb/core/widgets/app_text.dart';
import 'package:airbnb/core/theme/app_colors.dart';

class AppLoader extends StatelessWidget {
  final String? message;

  const AppLoader({super.key, this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircularProgressIndicator(),
          if (message != null) ...[
            SizedBox(height: 12),
            AppText.body(message!, color: AppColors.bodyColor(context)),
          ],
        ],
      ),
    );
  }
}
