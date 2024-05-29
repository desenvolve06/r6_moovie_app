import 'package:flutter/material.dart';
import 'package:r6_moovie_app/presenter/pages/series/favorites_series_screen.dart';
import 'package:r6_moovie_app/resources/app_colors.dart';
import 'package:r6_moovie_app/resources/app_strings.dart';
import 'package:r6_moovie_app/resources/app_values.dart';

import '../../pages/favorites_screen.dart';

class NavBarMain extends StatelessWidget {
  const NavBarMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.secondaryBackgroundColor,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const SizedBox(height: 60),
          ListTile(
            title: const Text(
              'Home',
              style: TextStyle(
                fontSize: AppSize.s30,
                color: AppColors.primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {},
          ),
          ListTile(
            title: const Text(
              AppStrings.myProfile,
              style: TextStyle(
                fontSize: AppSize.s30,
                color: AppColors.primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {},
          ),
          ListTile(
            title: const Text(
              AppStrings.downloads,
              style: TextStyle(
                fontSize: AppSize.s30,
                color: AppColors.primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FavoritesScreen()),
              );
            },
          ),
          ListTile(
            title: const Text(
              AppStrings.popular,
              style: TextStyle(
                fontSize: AppSize.s30,
                color: AppColors.primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {},
          ),
          ListTile(
            title: const Text(
              AppStrings.suggestions,
              style: TextStyle(
                fontSize: AppSize.s30,
                color: AppColors.primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  FavoritesScreen()),
              );
            },
          ),
          ListTile(
            title: const Text(
              AppStrings.options,
              style: TextStyle(
                fontSize: AppSize.s30,
                color: AppColors.primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  FavoritesSeriesScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}
