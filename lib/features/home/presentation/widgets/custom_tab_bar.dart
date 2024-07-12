import 'package:flutter/material.dart';
import 'package:flutter_spotify_app/common/utils/is_dark_mode.dart';
import 'package:flutter_spotify_app/core/config/theme/app_colors.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({
    super.key,
    required TabController tabController,
  }) : _tabController = tabController;

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: _tabController,
      indicatorColor: AppColors.primary,
      dividerColor: Colors.transparent,
      isScrollable: true,
      labelStyle: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      unselectedLabelStyle: const TextStyle(
        fontSize: 18,
      ),
      labelPadding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 32,
      ),
      labelColor: context.isDarkMode ? Colors.white : Colors.black,
      unselectedLabelColor:
          context.isDarkMode ? AppColors.gray : AppColors.dartGray,
      tabAlignment: TabAlignment.start,
      tabs: const [
        Text('News'),
        Text('Video'),
        Text('Artist'),
        Text('Podcast'),
      ],
    );
  }
}
