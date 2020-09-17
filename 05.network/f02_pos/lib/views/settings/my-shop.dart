import 'package:f02_pos/model/api/category-api.dart';
import 'package:f02_pos/model/api/product-api.dart';
import 'package:f02_pos/model/dto/category.dart';
import 'package:f02_pos/template/template.dart';
import 'package:f02_pos/views/settings/master/category-edit.dart';
import 'package:f02_pos/views/settings/master/products.dart';
import 'package:flutter/material.dart';

class MyShop extends StatefulWidget {
  static final String navigationId = "/my-shop";

  @override
  _MyShopState createState() => _MyShopState();
}

class _MyShopState extends State<MyShop> {
  Future<List<Category>> _fetchCategories;
  Future<int> _fetchCategorySize;
  Future<int> _fetchProductSize;

  CategoryApi _categoryApi = CategoryApi();
  ProductApi _productApi = ProductApi();

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  _loadData() {
    setState(() {
      _fetchCategorySize = _categoryApi.count();
      _fetchProductSize = _productApi.count();
      _fetchCategories = _categoryApi.getAll();
    });
  }

  _addNew() async {
    await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => CategoryEdit(),
        ));
    _loadData();
  }

  _showProducts(Category c) async {
    await Navigator.pushNamed(context, Products.navigationId, arguments: c);
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return TemplateWithDrawer(
      title: "My Shop",
      action: FloatingActionButton(
        onPressed: _addNew,
        child: Icon(Icons.add),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: _heading(),
          ),
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Expanded(
                    flex: 95,
                    child: FutureBuilder(
                      future: _fetchCategorySize,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return _subHeading(
                            color: Colors.green[500],
                            count: snapshot.data,
                            textColor: Colors.white,
                            title: "Category",
                          );
                        }

                        return Center(child: CircularProgressIndicator());
                      },
                    )),
                Expanded(
                    flex: 100,
                    child: FutureBuilder(
                      future: _fetchProductSize,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return _subHeading(
                            color: Colors.green[200],
                            count: snapshot.data,
                            textColor: Colors.black,
                            title: "Product",
                            right: 8,
                          );
                        }
                        return Center(child: CircularProgressIndicator());
                      },
                    )),
              ],
            ),
          ),
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: FutureBuilder(
                future: _fetchCategories,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<Category> list = snapshot.data;

                    if (list.length > 0) {
                      return ListView.builder(
                        itemBuilder: (context, index) => GestureDetector(
                          onTap: () {
                            _showProducts(list[index]);
                          },
                          child: Card(
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 8),
                              child: ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: Colors.green[100],
                                  child: Text(list[index]
                                      .name
                                      .substring(0, 1)
                                      .toUpperCase()),
                                ),
                                title: Text(list[index].name),
                                trailing: Icon(Icons.open_with),
                              ),
                            ),
                          ),
                        ),
                        itemCount: list.length,
                      );
                    } else {
                      return Center(child: Text("No Categories"));
                    }
                  }

                  return Container(
                    child: CircularProgressIndicator(),
                    alignment: Alignment.center,
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  _heading() => Container(
        width: double.infinity,
        color: Colors.green[700],
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.only(left: 16),
        child: Text(
          "Master Data",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
          ),
        ),
      );

  _subHeading(
          {int count,
          String title,
          Color color,
          Color textColor,
          double right = 0}) =>
      Container(
        margin: EdgeInsets.only(top: 8, left: 8, bottom: 8, right: right),
        color: color,
        height: double.infinity,
        padding: EdgeInsets.all(36),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              count.toString(),
              style: TextStyle(
                color: textColor,
                fontSize: 48,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              title,
              style: TextStyle(
                color: textColor,
                fontSize: 20,
              ),
            ),
          ],
        ),
      );
}
