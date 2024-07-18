import 'package:flutter/material.dart';
import 'package:flutter_spotify_app/common/utils/is_dark_mode.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final List<Widget>? actions;
  final Color? backgroundColor;
  const CustomAppBar({
    super.key,
    this.title,
    this.actions,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title,
      centerTitle: true,
      actions: actions,
      backgroundColor: backgroundColor ?? Colors.transparent,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      leading: !Navigator.canPop(context)
          ? null
          : IconButton(
              style: ButtonStyle(
                minimumSize: const MaterialStatePropertyAll(
                  Size.fromRadius(24),
                ),
                backgroundColor: MaterialStatePropertyAll(
                  context.isDarkMode
                      ? Colors.white.withOpacity(0.05)
                      : Colors.black.withOpacity(0.05),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back_ios_new),
            ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
