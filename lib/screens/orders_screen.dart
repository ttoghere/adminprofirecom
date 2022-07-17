import 'package:adminprofirecom/services/utils.dart';
import 'package:adminprofirecom/widgets/orders_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/controllers_shelf.dart';
import '../responsive.dart';
import '../widgets/widgets_shelf.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).getScreenSize;
    return Scaffold(
      key: context.read<MenuController>().getgridscaffoldKey,
      drawer: const SideMenu(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (Responsive.isDesktop(context))
              const Expanded(
                child: SideMenu(),
              ),
            Expanded(
              flex: 5,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Header(fct: () {
                      context.read<MenuController>().controlOrderMenu();
                    }, title: 'Orders',),
                    OrdersList()
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
