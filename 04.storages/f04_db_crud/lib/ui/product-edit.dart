import 'package:f04_db_crud/db/product.dart';
import 'package:f04_db_crud/ui/widget.dart';
import 'package:flutter/material.dart';

class ProductEdit extends StatefulWidget {
  @override
  _ProductEditState createState() => _ProductEditState();
}

class _ProductEditState extends State<ProductEdit> {
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  final _FormData _formData = _FormData();
  final ProductRepo _repo = ProductRepo();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Product"),
      ),
      body: Form(
        key: _formState,
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              FormFieldWithValidator(
                fieldName: "Name",
                controller: _formData.name,
              ),
              SizedBox(
                height: 8,
              ),
              FormFieldWithValidator(
                fieldName: "Category",
                controller: _formData.category,
              ),
              SizedBox(
                height: 8,
              ),
              FormFieldWithValidator(
                fieldName: "Price",
                controller: _formData.price,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _save,
        child: Icon(Icons.save),
      ),
    );
  }

  _save() async {
    if (_formState.currentState.validate()) {
      await _repo.create(Product(
          name: _formData.name.text,
          category: _formData.category.text,
          price: int.parse(_formData.price.text)));
      Navigator.pop(context);
    }
  }
}

class _FormData {
  final TextEditingController name = TextEditingController();
  final TextEditingController category = TextEditingController();
  final TextEditingController price = TextEditingController();
}
