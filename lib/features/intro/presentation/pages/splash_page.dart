import 'package:flutter/material.dart';
import 'package:flutter_spotify_app/core/config/assets/app_vectors.dart';
import 'package:flutter_spotify_app/features/intro/presentation/pages/get_started.dart';
import 'package:flutter_spotify_app/features/home/presentation/pages/home_page.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashPage extends StatefulWidget {
  final bool isLoggedIn;
  const SplashPage({
    super.key,
    required this.isLoggedIn,
  });

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    redirect();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SvgPicture.asset(AppVectors.logo),
      ),
    );
  }

  Future<void> redirect() async {
    await Future.delayed(const Duration(seconds: 2));
    if (mounted) {
      Navigator.of(context).pushAndRemoveUntil(
        widget.isLoggedIn ? HomePage.route() : GetStartedPage.route(),
        (route) => false,
      );
    }
  }
}
