import 'package:f02_pos/model/api/category-api.dart';
import 'package:f02_pos/model/dto/category.dart';
import 'package:f02_pos/template/widgets.dart';
import 'package:flutter/material.dart';

class CategoryEdit extends StatefulWidget {
  @override
  _CategoryEditState createState() => _CategoryEditState();
}

class _CategoryEditState extends State<CategoryEdit> {
  final _formState = GlobalKey<FormState>();
  final _name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        print("Popback");
        return Future.delayed(Duration(microseconds: 1), () => true);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Add Category"),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 36, vertical: 108),
          child: EditForm(
            _save,
            icon: Icons.local_offer,
            formName: "Category",
            form: Form(
              key: _formState,
              child: EditFormTextField("Category", _name),
            ),
          ),
        ),
      ),
    );
  }

  _save() async {
    if (_formState.currentState.validate()) {
      final Category result = await CategoryApi().create(Category(
        name: _name.text,
      ));
      Navigator.pop(context, result);
    }
  }
}
