import 'package:flutter/material.dart';

class SideBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _header(),
        _menu("Sale Operation", Icons.shopping_cart),
        _menu("Sale Reports", Icons.insert_chart),
        _menu("Cash Flow", Icons.transform),
        _menu("Master Data", Icons.store),
        _menu("Account", Icons.account_circle),
        _menu("Settings", Icons.settings),
      ],
    );
  }

  _menu(String name, IconData icon) => ListTile(
        title: Text(name),
        leading: Icon(icon),
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
              Colors.green[700],
              Colors.amber[400],
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomCenter,
          ),
        ),
      );
}
