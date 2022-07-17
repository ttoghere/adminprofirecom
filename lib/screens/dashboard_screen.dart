import 'package:adminprofirecom/screens/add_product_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../consts/consts_shelf.dart';
import '../controllers/MenuController.dart';
import '../responsive.dart';
import '../services/services_shelf.dart';
import '../widgets/widgets_shelf.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).getScreenSize;
    Color color = Utils(context).color;
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            Header(
              fct: () {
                context.read<MenuController>().controlDashboarkMenu();
              },
              title: 'Dashboard',
            ),
            const SizedBox(
              height: 20,
            ),
            TextWidget(text: "Latest Products", color: color),
            const SizedBox(height: defaultPadding),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ButtonsWidget(
                    onPressed: () {},
                    text: "View All",
                    icon: Icons.store,
                    backgroundColor: Colors.red[900]!),
                ButtonsWidget(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => UploadProductForm()));
                    },
                    text: "Add Product",
                    icon: Icons.store,
                    backgroundColor: Colors.red[900]!),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Responsive(
                        mobile: ProductGridWidget(
                          crossAxisCount: size.width < 650 ? 2 : 4,
                          childAspectRatio:
                              size.width < 650 && size.width > 350 ? 1.1 : 0.8,
                        ),
                        desktop: ProductGridWidget(
                          childAspectRatio: size.width < 1400 ? 0.8 : 1.05,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
