import 'package:f02_pos/model/api/category-api.dart';
import 'package:f02_pos/model/dto/category.dart';
import 'package:f02_pos/template/widgets.dart';
import 'package:f02_pos/views/settings/my-shop.dart';
import 'package:flutter/material.dart';

class CategoryEdit extends StatefulWidget {
  static final String navigationId = "/category-edit";

  @override
  _CategoryEditState createState() => _CategoryEditState();
}

class _CategoryEditState extends State<CategoryEdit> {
  final _formState = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _categoryApi = CategoryApi();

  Future<Category> _result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Category"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 36, vertical: 108),
        child: (_result == null)
            ? EditForm(
                _save,
                icon: Icons.local_offer,
                formName: "Category",
                form: Form(
                  key: _formState,
                  child: EditFormTextField("Category", _name),
                ),
              )
            : FutureBuilder(
                builder: (context, snapshot) {
                  return CircularProgressIndicator();
                },
              ),
      ),
    );
  }

  _save() {
    if (_formState.currentState.validate()) {
      setState(() {
        _result = _categoryApi.create(Category(name: _name.text)).whenComplete(
            () => Navigator.pushReplacementNamed(context, MyShop.navigationId));
      });
    }
  }
}
