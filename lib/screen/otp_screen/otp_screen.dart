import 'package:flutter/material.dart';
import 'package:lms_project/helpers/app_colour.dart';
import 'package:lms_project/helpers/app_text_styles.dart';
import 'package:lms_project/screen/home_page/home_page.dart';

import 'package:pin_code_fields/pin_code_fields.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController otpController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 48),
              Text(
                'Enter OTP',
                style: AppTextStyles.urbanistbody.copyWith(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'We’ve sent a 6-digit code to your phone',
                style: AppTextStyles.urbanistbody.copyWith(
                  color: Colors.grey[600],
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),

              // OTP Field
              PinCodeTextField(
                appContext: context,
                length: 6,
                controller: otpController,
                keyboardType: TextInputType.number,
                animationType: AnimationType.fade,

                pinTheme: PinTheme(
                  borderWidth: 1,
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(8),
                  fieldHeight: 65,
                  fieldWidth: 50,
                  activeFillColor: AppColors.lightCream,
                  selectedFillColor: Colors.white,
                  inactiveFillColor: AppColors.lightCream,
                  activeColor: AppColors.blazingOrange,
                  selectedColor: AppColors.blazingOrange2,
                  inactiveColor: Colors.grey[400]!,
                  errorBorderColor: Colors.red,
                ),

                boxShadows: [
                  BoxShadow(
                    color: Colors.deepOrange,
                    blurRadius: 1,
                    spreadRadius: 1,
                  ),
                  BoxShadow(
                    color: Colors.white,
                    blurRadius: 0,
                    spreadRadius: 1,
                  ),
                ],
                animationDuration: const Duration(milliseconds: 300),
                enableActiveFill: true,
                onChanged: (value) {},
              ),

              const SizedBox(height: 32),

              // Verify Button
              ElevatedButton(
                onPressed: () {
                  final otp = otpController.text.trim();
                  if (otp.length == 6) {
                    // Handle OTP verify logic
                  } else {
                    // Show error
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Please enter valid OTP")),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.blazingOrange2,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 60,
                    vertical: 14,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  "Verify",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),

              const SizedBox(height: 16),

              // Resend Option
              TextButton(
                onPressed: () {
                  // Trigger resend OTP logic
                },
                child: Text(
                  "Resend Code",
                  style: TextStyle(
                    color: AppColors.blazingOrange,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            PageRouteBuilder(
              transitionDuration: Duration(milliseconds: 600),
              pageBuilder: (_, __, ___) => HomeScreen(),
              transitionsBuilder: (_, animation, __, child) {
                const begin = Offset(1.0, 0.0);
                const end = Offset.zero;
                const curve = Curves.easeInOut;

                final tween = Tween(
                  begin: begin,
                  end: end,
                ).chain(CurveTween(curve: curve));
                final offsetAnimation = animation.drive(tween);

                return SlideTransition(position: offsetAnimation, child: child);
              },
            ),
          );
        },
      ),
    );
  }
}
