import 'package:airbnb/core/widgets/app_button.dart';
import 'package:airbnb/routes/app_routes.dart';
import 'package:airbnb/viewModel/favourite_list/favourite_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../viewModel/add_home/add_home_controller.dart';
import 'package:airbnb/View/card/home_card.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:airbnb/core/widgets/app_text.dart';
import 'package:airbnb/core/theme/app_colors.dart';

class favourite extends StatelessWidget {
  const favourite({super.key});

  @override
  Widget build(BuildContext context) {
    final FavouriteListController favouriteController =
        Get.find<FavouriteListController>();
    // Fetch all cards when the view is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      favouriteController.fetchAllCards();
    });
    final isWide = MediaQuery.of(context).size.width > 600;
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: AppText.heading(
          'Favourite List',
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
                    return favouriteController.cards.isEmpty
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
                          itemCount: favouriteController.cards.length,
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
                                card: favouriteController.cards[index],
                              ),
                            );
                          },
                        );
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
