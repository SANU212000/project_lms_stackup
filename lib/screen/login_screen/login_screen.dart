import 'package:flutter/material.dart';
import 'package:lms_project/helpers/app_button_style.dart';
import 'package:lms_project/helpers/app_sizedboxes.dart';
import 'package:lms_project/helpers/app_text_styles.dart';
import 'package:lms_project/screen/otp_screen/otp_screen.dart';
import 'package:remixicon/remixicon.dart'; // Optional for icons

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBody: true,
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Positioned.fill(
                  child: Image.asset(
                    'assets/images/doddle.jpg', // or use NetworkImage
                    fit: BoxFit.cover,
                  ),
                ),
                Center(
                  child: Hero(
                    tag: 'brainHero',
                    child: Icon(
                      RemixIcons.brain_2_line,
                      size: 100,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 30.0,
                  horizontal: 20,
                ),
                child: Column(
                  children: [
                    Text(
                      'Welcome Back !',
                      style: AppTextStyles.heading1(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                    Text(
                      'Login to continue your learning journey',
                      style: AppTextStyles.heading2(fontSize: 16),
                    ),
                    AppSizedBoxes.sizedboxH10,
                    Text(
                      'Login to continue',
                      style: AppTextStyles.urbanistbody,
                    ),

                    AppSizedBoxes.sizedboxH20,

                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Enter your email',
                        prefixIcon: Icon(Icons.email_outlined),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    AppSizedBoxes.sizedboxH20,

                    ElevatedButton(
                      onPressed: () {},
                      style: AppButtonStyles.primary(),

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.email_outlined),
                          AppSizedBoxes.sizedboxW3,
                          Text('continue with email'),
                        ],
                      ),
                    ),
                    AppSizedBoxes.sizedboxH20,
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Row(
                        children: <Widget>[
                          const Expanded(
                            child: Divider(
                              thickness: 1,
                              color: Colors.grey,
                              endIndent: 7,
                            ),
                          ),
                          Text(
                            "or continue with ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          ),
                          const Expanded(
                            child: Divider(
                              thickness: 1,
                              color: Colors.grey,
                              indent: 10,
                            ),
                          ),
                        ],
                      ),
                    ),
                    AppSizedBoxes.sizedboxH20,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            // Google login logic
                          },

                          style: AppButtonStyles.secondary(),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(RemixIcons.google_fill, size: 22),
                              AppSizedBoxes.sizedboxW3,

                              Text('Google'),
                            ],
                          ),
                        ),
                        AppSizedBoxes.sizedboxW10,
                        ElevatedButton(
                          onPressed: () {},

                          style: AppButtonStyles.secondary(),

                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(RemixIcons.apple_fill, size: 22),
                              AppSizedBoxes.sizedboxW3,
                              Text('Apple'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            PageRouteBuilder(
              transitionDuration: Duration(milliseconds: 600),
              pageBuilder: (_, __, ___) => OtpScreen(),
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
