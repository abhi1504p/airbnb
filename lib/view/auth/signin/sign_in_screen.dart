import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:medocr_enduser/core/constants/appcolors.dart';
import 'package:medocr_enduser/core/widgets/app_input_field.dart';
import 'package:medocr_enduser/core/widgets/app_text.dart';
import 'package:medocr_enduser/core/widgets/custom_button.dart';

import 'sign_in_viewmodel.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double width = size.width;
    final double height = size.height;

    // Pre-fill phone number if provided via arguments
    String? prefillPhone;
    final args = Get.arguments;
    
    if (args is String) {
      // Direct string argument
      prefillPhone = args;
    } else if (args is Map && args.containsKey('phone')) {
      // Map argument with phone key
      prefillPhone = args['phone']?.toString();
    }
    
    if (prefillPhone != null && prefillPhone.isNotEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        final controller = Get.find<SignInViewModel>();
        if (controller.phoneController.text != prefillPhone) {
          controller.phoneController.text = prefillPhone;
        }
      });
    }

    return GetBuilder<SignInViewModel>(
      init: SignInViewModel(),
      builder: (controller) {
        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.06,
                  vertical: height * 0.04,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: height * 0.03),
                    Center(
                      child: Image.asset(
                        'assets/images/authentication.png',
                        height: height * 0.3,
                        width: width * 0.8,

                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(height: height * 0.05),
                    AppInputField(
                      hint: 'Phone Number',
                      labeltext: "Phone Number",
                      keyboardType: TextInputType.phone,
                      controller: controller.phoneController,
                      maxLength: 10,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(10),
                      ],
                      // <-- This makes the label always float
                    ),
                    SizedBox(height: height * 0.03),
                    Obx(
                      () => CustomButton(
                        text: 'Sign in',
                        isLoading: controller.isLoading.value,
                        onPressed: controller.signIn,
                      ),
                    ),
                    SizedBox(height: height * 0.025),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: width * 0.01,
                          ),
                          child: AppText.body(
                            'Or',
                            color: AppColors.subText,
                            fontSize: width * 0.045,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: height * 0.01),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: controller.signInWithGoogle,
                          borderRadius: BorderRadius.circular(width * 0.12),
                          child: Container(
                            padding: EdgeInsets.all(width * 0.03),
                            child: Image.asset(
                              'assets/images/google.png',
                              height: width * 0.11,
                              width: width * 0.11,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),

                        InkWell(
                          onTap: controller.signInWithApple,
                          borderRadius: BorderRadius.circular(width * 0.12),
                          child: Container(
                            padding: EdgeInsets.all(width * 0.03),
                            child: Image.asset(
                              'assets/images/apple.png',
                              height: width * 0.11,
                              width: width * 0.11,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: height * 0.04),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: AppText.body(
                            "Don't have an account? ",
                            color: AppColors.textSecondary,
                            fontSize: width * 0.042,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed('/signup');
                          },
                          child: AppText.body(
                            'Sign up',
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w600,
                            fontSize: width * 0.045,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}