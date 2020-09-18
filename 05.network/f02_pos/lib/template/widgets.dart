import 'package:f02_pos/model/dto/category.dart';
import 'package:f02_pos/model/dto/product.dart';
import 'package:flutter/material.dart';

class Line extends StatelessWidget {
  final double height;
  final Color color;

  const Line({Key key, this.height, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: null == height ? 1 : height,
      color: null == color ? Colors.black : color,
    );
  }
}

class FormBtn extends StatelessWidget {
  final Function actionListener;
  final String name;

  const FormBtn({Key key, this.actionListener, this.name = "Save"})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80,
      padding: EdgeInsets.only(top: 32),
      child: RaisedButton(
        onPressed: actionListener,
        child: Text(name),
        color: Colors.green[200],
      ),
    );
  }
}

class EditForm extends StatelessWidget {
  final Form form;
  final IconData icon;
  final Function actionListener;
  final String formName;

  const EditForm(this.actionListener,
      {Key key, this.form, this.icon, this.formName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 160,
          height: 160,
          child: CircleAvatar(
            backgroundColor: Colors.green[300],
            foregroundColor: Colors.white,
            child: Icon(
              icon,
              size: 80,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 36),
          child: Text(
            "Add $formName",
            style: Theme.of(context).textTheme.headline4,
          ),
        ),
        form,
        FormBtn(
          actionListener: actionListener,
        )
      ],
    );
  }
}

class EditFormTextField extends StatelessWidget {
  final TextEditingController controller;
  final String name;

  const EditFormTextField(this.name, this.controller, {Key key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) {
        if (value.isEmpty) {
          return "Please enter $name";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: name,
        hintText: 'Enter $name',
        border: OutlineInputBorder(),
      ),
    );
  }
}

class Really extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Really?"),
      content: Text("You are in editing. Do you really want to back?"),
      actions: [
        RaisedButton(
          onPressed: () {
            Navigator.pop(context, true);
          },
          child: Text("Yes"),
        ),
        RaisedButton(
          onPressed: () {
            Navigator.pop(context, false);
          },
          child: Text("No"),
        )
      ],
    );
  }
}

class CategoryHolder extends InheritedWidget {
  final Category data;

  const CategoryHolder({Key key, @required this.data, @required Widget child})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(CategoryHolder oldWidget) => data != oldWidget.data;

  static CategoryHolder of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<CategoryHolder>();
}

class ProductHolder extends InheritedWidget {
  final Product data;

  const ProductHolder({Key key, @required this.data, @required Widget child})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(ProductHolder oldWidget) => data != oldWidget.data;

  static ProductHolder of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<ProductHolder>();
}
