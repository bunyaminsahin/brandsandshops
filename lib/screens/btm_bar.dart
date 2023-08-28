import 'package:brands_and_shops/screens/cart/cart_screen.dart';
import 'package:brands_and_shops/screens/categories.dart';
import 'package:brands_and_shops/screens/home_screen.dart';
import 'package:brands_and_shops/screens/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import '../provider/dark_theme_provider.dart';
import '../services/dark_theme_prefs.dart';
import 'package:badges/badges.dart' as badges;

class ButtomBarScreen extends StatefulWidget {
  static const routeName = "/ButtomBarScreen";
  const ButtomBarScreen({Key? key}) : super(key: key);

  @override
  State<ButtomBarScreen> createState() => _ButtomBarScreenState();
}

class _ButtomBarScreenState extends State<ButtomBarScreen> {
  int _selectedIndex = 0;
  final List<Map<String, dynamic>> _pages = [
  {"page" : const HomeScreen(), "title" : "Ana sayfa"},
  {"page" : CategoriesScreen(), "title" : "Kategoriler"},
  {"page" : const CartScreen(), "title" : "Sepetim"},
  {"page" : const UserScreen(), "title" : "Hesabım"},
  ];
  void _selectedPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
}
  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    bool isDark = themeState.getDarkTheme;
    final Color color = Utils(context).color;
    Size size = Utils(context).getScreenSize;
    return Scaffold(
      body: _pages[_selectedIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: isDark ? Theme.of(context).cardColor : Colors.white,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        currentIndex: _selectedIndex,
        unselectedItemColor: isDark ? Colors.white38 : Colors.black87,
        selectedItemColor: isDark ? Colors.cyan: Colors.black87,
        onTap: _selectedPage,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon:
            Icon(_selectedIndex == 0 ? IconlyBold.home : IconlyLight.home),
            label: "Ana sayfa",
          ),
          BottomNavigationBarItem(
            icon: Icon(_selectedIndex == 1 ? IconlyBold.category : IconlyLight.category),
            label: "Kategoriler",
          ),
          //BottomNavigationBarItem(icon: Icon(_selectedIndex == 2 ? IconlyBold.star : IconlyLight.star), label: "Keşfet",),
          BottomNavigationBarItem(
            icon: badges.Badge(
              showBadge: true,
              position: badges.BadgePosition.topEnd(top: -10, end: -12),
              onTap: (){},
              badgeContent: const FittedBox(child: Text("0")),
              badgeStyle: const badges.BadgeStyle(
                badgeColor: Colors.cyan
              ),
              child: Icon(
                    _selectedIndex == 2 ? IconlyBold.buy : IconlyLight.buy),
            ),
            label: "Sepetim",
          ),
          BottomNavigationBarItem(
            icon: Icon(_selectedIndex == 3 ? IconlyBold.profile : IconlyLight.profile),
            label: "Hesabım",
          ),
        ],
      ),
    );
  }
}
