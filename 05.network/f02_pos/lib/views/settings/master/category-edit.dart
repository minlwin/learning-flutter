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
  Category _category;
  String _title = "Add Category";

  @override
  Widget build(BuildContext context) {
    _category = ModalRoute.of(context).settings.arguments;

    if (null != _category) {
      _name.text = _category.name;
      _title = "Edit Category";
    }

    return WillPopScope(
      onWillPop: _confirm,
      child: Scaffold(
        appBar: AppBar(
          title: Text(_title),
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
      Category c = _category ?? Category();
      c.name = _name.text;
      final Category result = await CategoryApi().save(c);
      Navigator.pop(context, result);
    }
  }

  Future<bool> _confirm() async =>
      showDialog(context: context, builder: (context) => Really()) ?? false;
}
