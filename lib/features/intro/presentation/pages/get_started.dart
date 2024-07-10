import 'package:flutter/material.dart';
import 'package:flutter_spotify_app/common/widgets/basic_app_button.dart';
import 'package:flutter_spotify_app/core/config/assets/app_images.dart';
import 'package:flutter_spotify_app/core/config/assets/app_vectors.dart';
import 'package:flutter_spotify_app/core/config/theme/app_colors.dart';
import 'package:flutter_spotify_app/features/intro/presentation/pages/choose_mode_page.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GetStartedPage extends StatelessWidget {
  static route() {
    return MaterialPageRoute(
      builder: (context) => const GetStartedPage(),
    );
  }

  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(AppImages.introBackground1),
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
                  child: SvgPicture.asset(
                    AppVectors.logo,
                    fit: BoxFit.fill,
                  ),
                ),
                const Spacer(),
                const Text(
                  'Enjoy listening to music',
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 15),
                const Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sagittis enim purus sed phasellus. Cursus ornare id scelerisque aliquam.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 17,
                    color: AppColors.gray,
                  ),
                ),
                const SizedBox(height: 30),
                BasicAppButton(
                  text: 'Get Started',
                  onPressed: () {
                    Navigator.push(context, ChooseModePage.route());
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
