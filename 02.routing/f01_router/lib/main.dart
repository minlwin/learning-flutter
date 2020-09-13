import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ItemGrid(),
    );
  }
}

class ItemGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello Navigation"),
      ),
      body: Container(
        child: GridView.count(
          crossAxisCount: 2,
          children: _items
              .map((e) => GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => ItemDetails(
                                  item: e,
                                )));
                  },
                  child: _listItem(e)))
              .toList(),
        ),
      ),
    );
  }

  Widget _listItem(Item item) => Card(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(children: [
            Expanded(
                child: Image(image: AssetImage("images/${item.image}.png"))),
            Text(
              item.name,
              style: TextStyle(fontSize: 20),
            )
          ]),
        ),
      );

  final List<Item> _items = [
    Item("Raider 1", 4500, "raider"),
    Item("Samurai 1", 4500, "samurai"),
    Item("Spring 1", 4500, "spring"),
    Item("Raider 2", 6500, "raider"),
    Item("Samurai 2", 6500, "samurai"),
    Item("Spring 2", 6500, "spring"),
    Item("Raider 3", 7500, "raider"),
    Item("Samurai 3", 7500, "samurai"),
    Item("Spring 3", 7500, "spring"),
    Item("Raider 4", 8500, "raider"),
    Item("Samurai 4", 8500, "samurai"),
    Item("Spring 4", 8500, "spring"),
  ];
}

class ItemDetails extends StatelessWidget {
  final Item item;

  const ItemDetails({Key key, this.item}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          color: Colors.white,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Image(image: AssetImage("images/${item.image}.png")),
            Text(
              item.name,
              style: Theme.of(context).textTheme.headline4,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: item.size
                  .map((e) => Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 4, vertical: 16),
                        child: CircleAvatar(
                          child: Text(e),
                        ),
                      ))
                  .toList(),
            ),
            Text(
              _format(item.price),
              style: Theme.of(context).textTheme.headline5,
            )
          ]),
        ),
      ),
    );
  }

  _format(int price) {
    NumberFormat fmt = NumberFormat("#,##0 MMK");
    return fmt.format(price);
  }
}

class Item {
  String name;
  int price;
  String image;
  List<String> size = ["S", "M", "L", "XL"];

  Item(this.name, this.price, this.image);
}
