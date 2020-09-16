import 'package:f02_pos/template/widgets.dart';
import 'package:f02_pos/views/home.dart';
import 'package:f02_pos/views/sales/cash-flow.dart';
import 'package:f02_pos/views/sales/sale-report.dart';
import 'package:f02_pos/views/sales/scan-to-sell.dart';
import 'package:f02_pos/views/settings/my-shop.dart';
import 'package:f02_pos/views/settings/profile.dart';
import 'package:f02_pos/views/settings/settings.dart';
import 'package:flutter/material.dart';

class SideBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _header(),
        _menu(context, "Pos Home", Icons.home, Home.navigationId),
        _menu(context, "Scan to Sell", Icons.camera, ScanToSell.navigationId),
        _menu(context, "Cash Flow", Icons.transform, CashFlow.navigationId),
        _menu(
            context, "Sale Reports", Icons.pie_chart, SaleReport.navigationId),
        Line(
          color: Colors.red,
        ),
        _menu(context, "My Shop", Icons.store, MyShop.navigationId),
        _menu(context, "About Me", Icons.account_circle, AboutMe.navigationId),
        _menu(context, "Settings", Icons.settings, Settings.navigationId),
      ],
    );
  }

  _menu(BuildContext context, String name, IconData icon,
          String navigationId) =>
      GestureDetector(
        onTap: () {
          Navigator.of(context).pushReplacementNamed(navigationId);
        },
        child: ListTile(
          title: Text(name),
          leading: Icon(icon),
        ),
      );

  _header() => UserAccountsDrawerHeader(
        accountName: Text("Mini POS"),
        accountEmail: Text("Powered by JDC"),
        currentAccountPicture: CircleAvatar(
          backgroundColor: Colors.amber[100],
          child: Icon(
            Icons.phone_iphone,
            size: 36,
          ),
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.green[900],
              Colors.green[400],
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomCenter,
          ),
        ),
      );
}
