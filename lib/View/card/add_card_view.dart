import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../viewModel/card/card_controller.dart';
import 'package:airbnb/core/widgets/app_text.dart';
import 'package:airbnb/core/theme/app_colors.dart';
import 'package:airbnb/core/widgets/app_button.dart';

class AddCardPage extends StatelessWidget {
  AddCardPage({super.key});

  @override
  Widget build(BuildContext context) {
    CardController cardVM = Get.find<CardController>();
    final width = MediaQuery.of(context).size.width;
    final isWide = width > 600;
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor:
          isDark ? const Color(0xFF23223A) : const Color(0xFFF2E9E4),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Add New Home',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            color: isDark ? Colors.white : const Color(0xFF22223B),
          ),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(
          color: isDark ? Colors.white : const Color(0xFF22223B),
        ),
        actions: [
          IconButton(
            icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
            onPressed: () {
              Get.changeThemeMode(isDark ? ThemeMode.light : ThemeMode.dark);
            },
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: isWide ? width * 0.25 : 16,
            vertical: 32,
          ),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
            decoration: BoxDecoration(
              gradient:
                  isDark
                      ? const LinearGradient(
                        colors: [Color(0xFF23223A), Color(0xFF4A4E69)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      )
                      : const LinearGradient(
                        colors: [
                          Color(0xFFF2E9E4),
                          Color(0xFF9A8C98),
                          Color(0xFF4A4E69),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
              borderRadius: BorderRadius.circular(28),
              boxShadow: [
                BoxShadow(
                  color:
                      isDark ? Colors.black54 : Colors.black.withOpacity(0.07),
                  blurRadius: 32,
                  offset: const Offset(0, 12),
                ),
              ],
            ),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TweenAnimationBuilder<double>(
                  tween: Tween(begin: 0, end: 1),
                  duration: const Duration(milliseconds: 700),
                  builder:
                      (context, value, child) => Opacity(
                        opacity: value,
                        child: Transform.translate(
                          offset: Offset(0, (1 - value) * 40),
                          child: child,
                        ),
                      ),
                  child: AppText.heading(
                    'Enter Home Details',
                    fontSize: 24,
                    color:
                        isDark
                            ? AppColors.headingColor(context)
                            : AppColors.headingColor(context),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 24),
                _buildModernTextField(
                  context,
                  'Name',
                  cardVM.name,
                  icon: Icons.home_outlined,
                  isDark: isDark,
                ),
                const SizedBox(height: 16),
                _buildModernTextField(
                  context,
                  'Location',
                  cardVM.location,
                  icon: Icons.location_on_outlined,
                  isDark: isDark,
                ),
                const SizedBox(height: 16),
                _buildModernTextField(
                  context,
                  'Price',
                  cardVM.price,
                  icon: Icons.attach_money,
                  inputType: TextInputType.number,
                  isDark: isDark,
                ),
                const SizedBox(height: 16),
                _buildModernTextField(
                  context,
                  'Rating',
                  cardVM.rating,
                  icon: Icons.star_border,
                  inputType: TextInputType.number,
                  isDark: isDark,
                ),
                const SizedBox(height: 16),
                _buildModernTextField(
                  context,
                  'Image URL',
                  cardVM.imageUrl,
                  icon: Icons.image_outlined,
                  isDark: isDark,
                ),
                const SizedBox(height: 32),
                Obx(
                  () => AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child:
                        cardVM.isLoading.value
                            ? const Center(child: CircularProgressIndicator())
                            : AppButton(
                              type: ButtonType.filled,
                              onPressed: cardVM.submitCard,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(
                                    Icons.add_home,
                                    color: Colors.white,
                                    size: 24,
                                  ),
                                  const SizedBox(width: 8),
                                  AppText.heading(
                                    'Submit',
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ],
                              ),
                            ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildModernTextField(
    BuildContext context,
    String label,
    RxString controller, {
    IconData? icon,
    TextInputType? inputType,
    bool isDark = false,
  }) {
    return TextField(
      keyboardType: inputType ?? TextInputType.text,
      onChanged: (val) => controller.value = val,
      style: TextStyle(
        fontSize: 16,
        color:
            isDark
                ? AppColors.bodyColor(context)
                : AppColors.bodyColor(context),
      ),
      decoration: InputDecoration(
        prefixIcon:
            icon != null
                ? Icon(
                  icon,
                  color:
                      isDark
                          ? AppColors.captionColor(context)
                          : AppColors.captionColor(context),
                )
                : null,
        labelText: label,
        labelStyle: TextStyle(
          color:
              isDark
                  ? AppColors.captionColor(context)
                  : AppColors.captionColor(context),
        ),
        filled: true,
        fillColor:
            isDark
                ? AppColors.background(context)
                : AppColors.background(context),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 18,
          horizontal: 16,
        ),
      ),
    );
  }
}
