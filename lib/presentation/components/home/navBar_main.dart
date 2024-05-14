import 'package:flutter/material.dart';
import 'package:r6_moovie_app/resources/app_colors.dart';
import 'package:r6_moovie_app/resources/app_strings.dart';
import 'package:r6_moovie_app/resources/app_values.dart';

class NavBarMain extends StatelessWidget {
  const NavBarMain({super.key});

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
                  fontWeight: FontWeight.bold),
            ),
            onTap: () {},
          ),
          ListTile(
            title: const Text(
              // 'My Profile',
              AppStrings.myProfile,
              style: TextStyle(
                  fontSize: AppSize.s30,
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.bold),
            ),
            onTap: () {},
          ),
          ListTile(
            title: const Text(
              AppStrings.downloads,
              style: TextStyle(
                  fontSize: AppSize.s30,
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.bold),
            ),
            onTap: () {},
          ),
          ListTile(
            title: const Text(
              AppStrings.popular,
              style: TextStyle(
                  fontSize: AppSize.s30,
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.bold),
            ),
            onTap: () {},
          ),
          ListTile(
            title: const Text(
              AppStrings.suggestions,
              style: TextStyle(
                  fontSize: AppSize.s30,
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.bold),
            ),
            onTap: () {},
          ),
          ListTile(
            title: const Text(
              AppStrings.options,
              style: TextStyle(
                  fontSize: AppSize.s30,
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.bold),
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
