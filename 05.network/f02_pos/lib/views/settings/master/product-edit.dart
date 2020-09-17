import 'package:f02_pos/model/api/product-api.dart';
import 'package:f02_pos/model/dto/category.dart';
import 'package:f02_pos/model/dto/product.dart';
import 'package:f02_pos/template/widgets.dart';
import 'package:flutter/material.dart';

class ProductEdit extends StatefulWidget {
  final Category category;
  const ProductEdit({Key key, this.category}) : super(key: key);
  @override
  _ProductEditState createState() => _ProductEditState();
}

class _ProductEditState extends State<ProductEdit> {
  var _formState = GlobalKey<FormState>();
  var _name = TextEditingController();
  var _price = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _confirm,
      child: Scaffold(
          appBar: AppBar(
            title: Text("Add to ${widget.category.name}"),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 36),
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
          )),
    );
  }

  _save() async {
    if (_formState.currentState.validate()) {
      final Product result = await ProductApi().create(Product(
          category: widget.category,
          name: _name.text,
          price: int.parse(_price.text)));
      Navigator.pop(context, result);
    }
  }

  Future<bool> _confirm() async =>
      showDialog(context: context, builder: (context) => Really()) ?? false;
}
