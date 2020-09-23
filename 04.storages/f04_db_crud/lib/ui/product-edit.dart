import 'package:f04_db_crud/db/product.dart';
import 'package:f04_db_crud/ui/widget.dart';
import 'package:flutter/material.dart';

class ProductEdit extends StatefulWidget {
  final Product product;

  const ProductEdit({Key key, this.product}) : super(key: key);
  @override
  _ProductEditState createState() => _ProductEditState();
}

class _ProductEditState extends State<ProductEdit> {
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  final _FormData _formData = _FormData();
  final ProductRepo _repo = ProductRepo();

  @override
  void initState() {
    super.initState();
    if (null != widget.product) {
      _formData.name.text = widget.product.name;
      _formData.category.text = widget.product.category;
      _formData.price.text = widget.product.price.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product == null ? "Add Product" : "Edit Product"),
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
      if (null == widget.product) {
        await _repo.create(Product(
            name: _formData.name.text,
            category: _formData.category.text,
            price: int.parse(_formData.price.text)));
      } else {
        widget.product.name = _formData.name.text;
        widget.product.category = _formData.category.text;
        widget.product.price = int.parse(_formData.price.text);
        await _repo.update(widget.product);
      }
      Navigator.pop(context);
    }
  }
}

class _FormData {
  final TextEditingController name = TextEditingController();
  final TextEditingController category = TextEditingController();
  final TextEditingController price = TextEditingController();
}
