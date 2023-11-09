import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:movie_app/screen/about_screen/about_screen.dart';
import 'package:movie_app/screen/favorite_screen/favorite_screen.dart';
import 'package:movie_app/screen/movie_screen/movie_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../constants/color_constants.dart';

class NavigationScreen extends StatelessWidget {
  NavigationScreen({super.key});

  PersistentTabController navigationBarController =
      PersistentTabController(initialIndex: 0);

  final navigationScreens = [
    MovieScreen(),
    FavoriteScreen(),
    // FavoriteScreen(),
    AboutScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.app_name,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: ColorConstants.darkPurpleColor,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.settings,
                color: Colors.white,
              ))
        ],
      ),
      body: SafeArea(
        child: PersistentTabView(
          context,
          controller: navigationBarController,
          stateManagement: true,
          screens: navigationScreens,
          items: [
            PersistentBottomNavBarItem(
              contentPadding: 5,
              icon: Icon(Icons.movie),
              title: ("movie"),
              activeColorPrimary: ColorConstants.lightPurple,
              inactiveColorPrimary: CupertinoColors.systemGrey,
            ),
            PersistentBottomNavBarItem(
              contentPadding: 5,
              icon: const Icon(Icons.favorite),
              title: ("favorite"),
              activeColorPrimary: ColorConstants.lightPurple,
              inactiveColorPrimary: CupertinoColors.systemGrey,
            ),
            // PersistentBottomNavBarItem(
            //   contentPadding: 5,
            //   icon: Icon(Icons.favorite),
            //   title: ("favorite".tr),
            //   activeColorPrimary: ColorConstants.lightGreen,
            //   inactiveColorPrimary: CupertinoColors.systemGrey,
            // ),
            PersistentBottomNavBarItem(
              contentPadding: 5,
              icon: Icon(Icons.person),
              title: ("about"),
              activeColorPrimary: ColorConstants.lightPurple,
              inactiveColorPrimary: CupertinoColors.systemGrey,
            ),
          ],

          confineInSafeArea: true,
          onItemSelected: (int selectedItemIndex) {
            print('YOur item index is $selectedItemIndex');
            // Used to update value of navigation.
            // navigationController.changeScreen(selectedItemIndex);
            // update screen.
          },

          backgroundColor: Colors.white,
          // Default is Colors.white.
          handleAndroidBackButtonPress: true,
          // Default is true.
          resizeToAvoidBottomInset: true,
          // Default is true.
          hideNavigationBarWhenKeyboardShows: true,
          // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
          popAllScreensOnTapOfSelectedTab: false,
          popActionScreens: PopActionScreensType.all,
          itemAnimationProperties: ItemAnimationProperties(
            // Navigation Bar's items animation properties.
            duration: Duration(milliseconds: 200),
            curve: Curves.ease,
          ),
          screenTransitionAnimation: ScreenTransitionAnimation(
            // Screen transition animation on change of selected tab.
            animateTabTransition: true,
            curve: Curves.ease,
            duration: Duration(milliseconds: 200),
          ),

          navBarStyle: NavBarStyle
              .style13, // Choose the nav bar style with this property.
        ),
      ),
    );
  }
}
