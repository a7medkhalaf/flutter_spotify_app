import 'package:flutter/material.dart';
import 'package:flutter_spotify_app/common/utils/is_dark_mode.dart';
import 'package:flutter_spotify_app/common/widgets/app_bar.dart';
import 'package:flutter_spotify_app/common/widgets/basic_app_button.dart';
import 'package:flutter_spotify_app/core/config/assets/app_images.dart';
import 'package:flutter_spotify_app/core/config/assets/app_vectors.dart';
import 'package:flutter_spotify_app/core/config/theme/app_colors.dart';
import 'package:flutter_spotify_app/presentation/auth/pages/signin_page.dart';
import 'package:flutter_spotify_app/presentation/auth/pages/signup_page.dart';
import 'package:flutter_spotify_app/presentation/auth/widgets/sign_in_button.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignUpOrSignInPage extends StatelessWidget {
  static route() {
    return MaterialPageRoute(
      builder: (context) => const SignUpOrSignInPage(),
    );
  }

  const SignUpOrSignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const CustomAppBar(),
          Align(
            alignment: Alignment.topRight,
            child: SvgPicture.asset(AppVectors.authTopRight),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: SvgPicture.asset(AppVectors.authBottomRight),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Image.asset(AppImages.authBackground),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(AppVectors.logo),
                  const SizedBox(height: 60),
                  const Text(
                    'Enjoy listening to music',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    'Spotify is a proprietary Swedish audio streaming and media services provider',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: context.isDarkMode
                          ? AppColors.gray
                          : AppColors.dartGray,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    children: [
                      Expanded(
                        flex: 5,
                        child: BasicAppButton(
                          text: 'Register',
                          onPressed: () {
                            Navigator.of(context).push(SignUpPage.route());
                          },
                        ),
                      ),
                      const Spacer(
                        flex: 1,
                      ),
                      Expanded(
                        flex: 5,
                        child: SingInButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              SingInPage.route(),
                            );
                          },
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
