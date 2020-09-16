import 'package:f02_pos/model/dto/category.dart';
import 'package:f02_pos/template/widgets.dart';
import 'package:flutter/material.dart';

class ProductEdit extends StatefulWidget {
  static final String navigationId = "/product-edit";
  @override
  _ProductEditState createState() => _ProductEditState();
}

class _ProductEditState extends State<ProductEdit> {
  Category _category;
  var _formState = GlobalKey<FormState>();
  var _name = TextEditingController();
  var _price = TextEditingController();

  Future _future;

  @override
  Widget build(BuildContext context) {
    _category = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        appBar: AppBar(
          title: Text("Add to ${_category.name}"),
        ),
        body: (null == _future)
            ? Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 36, vertical: 90),
                child: EditForm(
                  _save,
                  icon: Icons.local_mall,
                  formName: "Product",
                  form: Form(
                      key: _formState,
                      child: Column(
                        children: [
                          EditFormTextField("Name", _name),
                          Container(
                            height: 24,
                          ),
                          EditFormTextField("Price", _price),
                        ],
                      )),
                ),
              )
            : FutureBuilder(
                future: _future,
                builder: (context, snapshot) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ));
  }

  _save() {
    if (_formState.currentState.validate()) {}
  }
}
