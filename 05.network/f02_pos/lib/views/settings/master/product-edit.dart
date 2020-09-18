import 'package:f02_pos/model/api/product-api.dart';
import 'package:f02_pos/model/dto/product.dart';
import 'package:f02_pos/template/widgets.dart';
import 'package:flutter/material.dart';

class ProductEdit extends StatefulWidget {
  @override
  _ProductEditState createState() => _ProductEditState();
}

class _ProductEditState extends State<ProductEdit> {
  var _formState = GlobalKey<FormState>();
  var _name = TextEditingController();
  var _price = TextEditingController();
  var _title = "Add New Product";

  @override
  Widget build(BuildContext context) {
    Product product = ProductHolder.of(context)?.data;
    if (null != product) {
      _name.text = product.name;
      _price.text = product.price.toString();
      _title = "Edit Product";
    }
    return WillPopScope(
      onWillPop: _confirm,
      child: Scaffold(
          appBar: AppBar(
            title: Text(_title),
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
      Product p = ProductHolder.of(context)?.data ??
          Product(category: CategoryHolder.of(context).data);
      p.name = _name.text;
      p.price = int.parse(_price.text);

      final Product result = await ProductApi().save(p);
      Navigator.pop(context, result);
    }
  }

  Future<bool> _confirm() async =>
      showDialog(context: context, builder: (context) => Really()) ?? false;
}
