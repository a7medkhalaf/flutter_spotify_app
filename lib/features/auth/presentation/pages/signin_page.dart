import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spotify_app/common/utils/is_dark_mode.dart';
import 'package:flutter_spotify_app/common/utils/show_snackbar.dart';
import 'package:flutter_spotify_app/common/widgets/app_bar.dart';
import 'package:flutter_spotify_app/common/widgets/basic_app_button.dart';
import 'package:flutter_spotify_app/core/config/assets/app_vectors.dart';
import 'package:flutter_spotify_app/core/config/theme/app_colors.dart';
import 'package:flutter_spotify_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter_spotify_app/features/auth/presentation/pages/signup_page.dart';
import 'package:flutter_spotify_app/features/auth/presentation/widgets/auth_field.dart';
import 'package:flutter_spotify_app/features/root/presentation/pages/home_page.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SingInPage extends StatefulWidget {
  static route() {
    return MaterialPageRoute(builder: (context) => const SingInPage());
  }

  const SingInPage({super.key});

  @override
  State<SingInPage> createState() => _SingInPageState();
}

class _SingInPageState extends State<SingInPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: SvgPicture.asset(
          AppVectors.logo,
          width: 40,
          height: 40,
        ),
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthFailure) {
            showSnackBar(context, state.message);
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is AuthSuccess) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Navigator.of(context).pushAndRemoveUntil(
                HomePage.route(),
                (route) => false,
              );
            });
          }
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const Text(
                      'Sign In',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 30),
                    _emailField(),
                    _passwordField(),
                    const SizedBox(height: 30),
                    _signInButton(),
                    const SizedBox(height: 15),
                    _alreadyHaveAccount(context),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _alreadyHaveAccount(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushReplacement(
          SignUpPage.route(),
        );
      },
      child: RichText(
        text: TextSpan(
          text: 'Not a Member? ',
          style: TextStyle(
            fontSize: 12,
            color: context.isDarkMode ? Colors.white : Colors.black,
            fontWeight: FontWeight.w400,
          ),
          children: const [
            TextSpan(
              text: 'Register Now',
              style: TextStyle(
                color: AppColors.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  BasicAppButton _signInButton() {
    return BasicAppButton(
      text: 'Sign In',
      onPressed: () {
        context.read<AuthBloc>().add(
              AuthSignIn(
                email: emailController.text,
                password: passwordController.text,
              ),
            );
      },
    );
  }

  AuthFieldWidget _passwordField() {
    return AuthFieldWidget(
      hintText: 'Password',
      controller: passwordController,
      isObscureText: true,
    );
  }

  AuthFieldWidget _emailField() {
    return AuthFieldWidget(
      hintText: 'Enter Username Or Email',
      controller: emailController,
      isObscureText: false,
    );
  }
}