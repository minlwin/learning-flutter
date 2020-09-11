import 'package:f07_products/product-list.dart';
import 'package:f07_products/product-model.dart';
import 'package:flutter/material.dart';

class ProductAddBtn extends StatelessWidget {
  final ProductConsumer saveListener;

  const ProductAddBtn({Key key, this.saveListener}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            builder: (context) =>
                ProductEditBottomSheet(listener: saveListener));
      },
      child: Icon(Icons.add),
    );
  }
}

class ProductEditBottomSheet extends StatefulWidget {
  final ProductConsumer listener;

  ProductEditBottomSheet({Key key, this.listener}) : super(key: key);

  @override
  _ProductEditBottomSheetState createState() => _ProductEditBottomSheetState();
}

class _ProductEditBottomSheetState extends State<ProductEditBottomSheet> {
  final formState = GlobalKey<FormState>();

  final name = TextEditingController();

  final price = TextEditingController();

  final category = FormFieldState();

  final product = Product();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 480,
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(100)),
          color: Colors.amber[50]),
      child: Column(
        children: [
          _title(),
          Expanded(
            child: _form(),
          )
        ],
      ),
    );
  }

  _title() => Container(
        child: Align(
          child: Text(
            "Add Product",
            style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                fontFamily: "Roboto"),
          ),
          alignment: Alignment.bottomLeft,
        ),
        padding: EdgeInsets.only(top: 24),
      );

  _form() => Form(
        key: formState,
        child: Column(
          children: [
            _categorySelect(),
            _input(name, "Product Name", false),
            _input(price, "Product Price", true),
            _saveBtn()
          ],
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        ),
      );

  _saveBtn() => SizedBox(
        height: 48,
        width: double.infinity,
        child: RaisedButton(
          onPressed: () {
            if (formState.currentState.validate()) {
              product.name = name.text;
              product.price = int.parse(price.text);
              Navigator.pop(context);
              widget.listener.call(product);
            }
          },
          color: Colors.blue[300],
          child: Text(
            "Save Product",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
      );

  _input(TextEditingController controller, String name, bool number) =>
      TextFormField(
          controller: controller,
          keyboardType: number ? TextInputType.number : TextInputType.name,
          autofocus: false,
          decoration: InputDecoration(
              labelText: name,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(15))));

  _categorySelect() => DropdownButtonFormField(
        items: Category.values
            .map((e) => DropdownMenuItem(
                  child: Text(e.name),
                  value: e,
                ))
            .toList(),
        onChanged: (Category value) {
          product.category = value;
        },
        decoration: InputDecoration(
            labelText: "Category",
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
      );
}
