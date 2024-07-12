import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spotify_app/common/widgets/app_bar.dart';
import 'package:flutter_spotify_app/core/config/assets/app_images.dart';
import 'package:flutter_spotify_app/core/config/assets/app_vectors.dart';
import 'package:flutter_spotify_app/features/home/presentation/cubit/song_cubit.dart';
import 'package:flutter_spotify_app/features/home/presentation/widgets/custom_tab_bar.dart';
import 'package:flutter_spotify_app/features/home/presentation/widgets/news_list_view.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  static route() {
    return MaterialPageRoute(
      builder: (context) => const HomePage(),
    );
  }

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    context.read<SongCubit>().getNewsSongs();
    _tabController = TabController(
      length: 4,
      vsync: this,
    );
    super.initState();
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _homeCard(),
              CustomTabBar(tabController: _tabController),
              SizedBox(
                height: 250,
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    const NewsWidget(),
                    Container(),
                    Container(),
                    Container(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox _homeCard() {
    return SizedBox(
      height: 140,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: SvgPicture.asset(AppVectors.homePageCard),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 64.0),
              child: Image.asset(
                AppImages.homePageCardImage,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
