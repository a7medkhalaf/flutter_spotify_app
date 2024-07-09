import 'package:flutter/material.dart';
import 'package:flutter_spotify_app/common/widgets/basic_app_button.dart';
import 'package:flutter_spotify_app/core/config/assets/app_images.dart';
import 'package:flutter_spotify_app/core/config/assets/app_vectors.dart';
import 'package:flutter_spotify_app/presentation/auth/pages/signin_signup_page.dart';
import 'package:flutter_spotify_app/presentation/choose_mode/widgets/choose_mode_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChooseModePage extends StatelessWidget {
  static route() {
    return MaterialPageRoute(
      builder: (context) => const ChooseModePage(),
    );
  }

  const ChooseModePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(AppImages.introBackground2),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(32),
            color: Colors.black.withOpacity(0.15),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: SvgPicture.asset(AppVectors.logo),
                ),
                const Spacer(),
                const Text(
                  'Choose Mode',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 30),
                const ChooseModeWidget(),
                const SizedBox(height: 60),
                BasicAppButton(
                  text: 'Continue',
                  onPressed: () {
                    Navigator.of(context).push(SignUpOrSignInPage.route());
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
