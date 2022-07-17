import 'package:adminprofirecom/consts/consts_shelf.dart';
import 'package:adminprofirecom/screens/orders_screen.dart';
import 'package:adminprofirecom/widgets/widgets_shelf.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';
import '../providers/providers_shelf.dart';
import '../screens/screens_shelf.dart';
import '../services/services_shelf.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    final theme = Utils(context).getTheme;
    final themeState = Provider.of<DarkThemeProvider>(context);

    final color = Utils(context).color;
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Image.network(
              testpic2,
            ),
          ),
          DrawerListTile(
            title: "Main",
            press: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const MainScreen(),
                ),
              );
            },
            icon: Icons.home_filled,
          ),
          DrawerListTile(
            title: "View all product",
            press: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => AllProductsScreen()));
            },
            icon: Icons.store,
          ),
          DrawerListTile(
            title: "View all order",
            press: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => OrdersScreen()));
            },
            icon: IconlyBold.bag_2,
          ),
          SwitchListTile(
              title: const Text('Theme'),
              secondary: Icon(themeState.getDarkTheme
                  ? Icons.dark_mode_outlined
                  : Icons.light_mode_outlined),
              value: theme,
              onChanged: (value) {
                setState(() {
                  themeState.setDarkTheme = value;
                });
              })
        ],
      ),
    );
  }
}
