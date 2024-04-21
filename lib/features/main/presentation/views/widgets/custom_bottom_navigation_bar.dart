import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/assets.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key, required this.updateIndex});

  final void Function(int) updateIndex;

  @override
  Widget build(BuildContext context) {
    return ConvexAppBar(
      items: [
        TabItem(
          icon: Image.asset(
            AssetsData.homeIcon,
            color: Colors.white,
          ),
          title: 'Home',
        ),
        TabItem(
          icon: Image.asset(
            AssetsData.quranIcon,
            color: Colors.white,
          ),
          title: 'Quran',
        ),
        TabItem(
          icon: Image.asset(
            AssetsData.audioIcon,
            color: Colors.white,
          ),
          title: 'Audio',
        ),
        TabItem(
          icon: Image.asset(
            AssetsData.mosqueIcon,
            color: Colors.white,
          ),
          title: 'Prayer',
        ),
      ],
      initialActiveIndex: 0,
      onTap: updateIndex,
      backgroundColor: Constants.kPrimary,
      activeColor: Constants.kPrimary,
    );
  }
}
