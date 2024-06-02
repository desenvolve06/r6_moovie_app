import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:r6_moovie_app/resources/app_colors.dart';
import 'package:r6_moovie_app/resources/asset_path.dart';

class AppBarMain extends StatelessWidget implements PreferredSizeWidget {
  const AppBarMain({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(color: AppColors.primaryColorDark),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            AssetPath.logoKoruFlixSvg,
            semanticsLabel: 'KoruFlix Logo',
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.account_circle,
              color: AppColors.primaryColorDark),
          onPressed: () {},
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
