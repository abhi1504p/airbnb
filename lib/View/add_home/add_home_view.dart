import 'package:airbnb/core/widgets/app_button.dart';
import 'package:airbnb/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../viewModel/add_home/add_home_controller.dart';
import 'package:airbnb/View/card/home_card.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:airbnb/core/widgets/app_text.dart';
import 'package:airbnb/core/theme/app_colors.dart';

class AddHomeView extends StatelessWidget {
  const AddHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final AddHomeController addHomeController = Get.find<AddHomeController>();
    final isWide = MediaQuery.of(context).size.width > 600;
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: AppText.heading(
          'Add Home',
          color:
              isDark
                  ? AppColors.headingColor(context)
                  : AppColors.headingColor(context),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
            onPressed: () {
              Get.changeThemeMode(isDark ? ThemeMode.light : ThemeMode.dark);
            },
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors:
                isDark
                    ? [const Color(0xFF23223A), const Color(0xFF4A4E69)]
                    : [
                      const Color(0xFFF2E9E4),
                      const Color(0xFF9A8C98),
                      const Color(0xFF4A4E69),
                    ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isWide ? 80 : 16,
              vertical: 8,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 16),
                Expanded(
                  child: Obx(() {
                    return addHomeController.cards.isEmpty
                        ? Center(
                          child: AppText.body(
                            'No homes added yet.',
                            color:
                                isDark
                                    ? AppColors.bodyColor(
                                      context,
                                    ).withOpacity(0.7)
                                    : AppColors.bodyColor(
                                      context,
                                    ).withOpacity(0.7),
                            fontSize: 18,
                          ),
                        )
                        : ListView.builder(
                          itemCount: addHomeController.cards.length,
                          itemBuilder: (context, index) {
                            return TweenAnimationBuilder<double>(
                              tween: Tween(begin: 0, end: 1),
                              duration: Duration(
                                milliseconds: 400 + index * 100,
                              ),
                              builder:
                                  (context, value, child) => Opacity(
                                    opacity: value,
                                    child: Transform.translate(
                                      offset: Offset(0, (1 - value) * 40),
                                      child: child,
                                    ),
                                  ),
                              child: HomeCard(
                                card: addHomeController.cards[index],
                              ),
                            );
                          },
                        );
                  }),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16, bottom: 32),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppButton(
                        type: ButtonType.filled,
                        text: "Cancel",
                        onPressed: () => Get.offAllNamed(AppRoutes.home),
                        color:
                            isDark
                                ? const Color(0xFF9A8C98)
                                : const Color(0xFF9A8C98),
                        textColor: Colors.white,
                        borderRadius: 16,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 16,
                        ),
                      ),
                      const SizedBox(width: 30),
                      AppButton(
                        type: ButtonType.filled,
                        text: "Add",
                        onPressed: () => Get.toNamed(AppRoutes.addCard),
                        color:
                            isDark
                                ? const Color(0xFF4A4E69)
                                : const Color(0xFF4A4E69),
                        textColor: Colors.white,
                        borderRadius: 16,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
