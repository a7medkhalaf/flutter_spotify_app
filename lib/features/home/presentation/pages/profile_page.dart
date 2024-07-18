import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spotify_app/common/cubit/user_cubit.dart';
import 'package:flutter_spotify_app/common/utils/is_dark_mode.dart';
import 'package:flutter_spotify_app/common/widgets/app_bar.dart';
import 'package:flutter_spotify_app/core/config/theme/app_colors.dart';
import 'package:flutter_spotify_app/core/constants/app_urls.dart';
import 'package:flutter_spotify_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter_spotify_app/features/home/presentation/widgets/playlist_list_view.dart';
import 'package:flutter_spotify_app/features/intro/presentation/pages/get_started.dart';

class ProfilePage extends StatelessWidget {
  static route() {
    return MaterialPageRoute(builder: (context) => const ProfilePage());
  }

  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = (context.read<UserCubit>().state as UserLoggedIn).user;
    return Scaffold(
      appBar: CustomAppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
            onPressed: () {
              context.read<AuthBloc>().add(AuthSingOut());
              Navigator.of(context).pushAndRemoveUntil(
                GetStartedPage.route(),
                (route) => false,
              );
            },
            icon: const Icon(Icons.logout),
          ),
        ],
        backgroundColor:
            context.isDarkMode ? AppColors.dartGray : AppColors.gray,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.3,
            decoration: BoxDecoration(
              color: context.isDarkMode ? AppColors.dartGray : AppColors.gray,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 60,
                  backgroundImage: NetworkImage(AppURLs.defaultProfileImage),
                ),
                const SizedBox(height: 16),
                Text(
                  user.email,
                ),
                Text(
                  user.name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Favorites',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          const Expanded(
            child: PlaylistWidget(isFavorites: true),
          ),
        ],
      ),
    );
  }
}
