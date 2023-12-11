import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:vk_copy/UI/newmovies/newhome_screen.dart';
import 'package:vk_copy/UI/screens/home_screen.dart';
import 'package:vk_copy/localization/localizations.dart';
import '../UI/news/news/news_home.dart';
import '../UI/qr_page/qr_page.dart';



class CustomBottomBar extends StatefulWidget {
  const CustomBottomBar({
    final Key? key,
  }) : super(key: key);

  static Page page() => const MaterialPage<void>(child: CustomBottomBar());

  @override
  _CustomBottomBarState createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
  final PersistentTabController _controller = PersistentTabController();
  final bool _hideNavBar = false;


  List<Widget> _buildScreens() => [
    const NewsScreen(),
    const QrPage(),
    const NewHomeScreen(),
    const HomeScreen(),
  ];

  List<PersistentBottomNavBarItem> _navBarsItems() => [
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.home),
      inactiveIcon: const Icon(Icons.home_outlined),
      title: MyLocalizations.news,
      activeColorPrimary: Colors.white,
      inactiveColorPrimary: Colors.white,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.qr_code),
      inactiveIcon: const Icon(Icons.qr_code_2),
      title: "QR",
      activeColorPrimary: Colors.white,
      inactiveColorPrimary: Colors.white,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.movie),
      inactiveIcon: const Icon(Icons.movie_creation_outlined),
      title: MyLocalizations.films,
      activeColorPrimary: Colors.white,
      inactiveColorPrimary: Colors.white,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.person),
      inactiveIcon: const Icon(Icons.person_2_outlined),
      title: MyLocalizations.profile,
      activeColorPrimary: Colors.white,
      inactiveColorPrimary: Colors.white,
    ),
  ];

  @override
  Widget build(final BuildContext context) => Scaffold(
    body: PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      resizeToAvoidBottomInset: true,
      navBarHeight: MediaQuery.of(context).viewInsets.bottom > 0
          ? 0.0
          : kBottomNavigationBarHeight,
      bottomScreenMargin: 0,

      backgroundColor: Theme.of(context).primaryColor,
      hideNavigationBar: _hideNavBar,
      decoration: const NavBarDecoration(colorBehindNavBar: Colors.indigo),
      itemAnimationProperties: const ItemAnimationProperties(
        duration: Duration(milliseconds: 400),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: true,
      ),
      navBarStyle:
      NavBarStyle.style1, // Choose the nav bar style with this property
    ),
  );
}