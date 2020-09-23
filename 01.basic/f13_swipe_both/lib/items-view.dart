import 'package:flutter/material.dart';

class ItemsView extends StatefulWidget {
  @override
  _ItemsViewState createState() => _ItemsViewState();
}

class _ItemsViewState extends State<ItemsView> {
  final List<String> _items =
      List.generate(10, (index) => "List Item ${index + 1}");

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: ListView.builder(
        itemBuilder: (context, index) => _item(_items[index], index),
        itemCount: _items.length,
      ),
    );
  }

  _item(String data, int index) => Dismissible(
      key: Key(data),
      direction: DismissDirection.horizontal,
      background: _deleteBack(),
      secondaryBackground: _editBack(),
      confirmDismiss: (direction) async {
        // swipe to left
        if (direction == DismissDirection.endToStart) {
          String value = await showDialog(
              context: context,
              builder: (context) => EditForm(
                    value: data,
                  ));

          if (null != value) {
            setState(() {
              _items[index] = value;
            });
          }

          return false;
        }
        return true;
      },
      onDismissed: (direction) {
        setState(() {
          _items.remove(data);
        });
      },
      child: Card(
        child: ListTile(
          leading: Icon(Icons.send),
          title: Text(data),
        ),
      ));

  _deleteBack() => Container(
        color: Colors.red,
        padding: EdgeInsets.only(left: 16),
        child: Row(
          children: [
            Icon(
              Icons.delete,
              color: Colors.white,
            ),
            SizedBox(width: 16),
            Text(
              "Delete",
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      );

  _editBack() => Container(
        color: Colors.green,
        padding: EdgeInsets.only(right: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "Edit",
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(width: 16),
            Icon(
              Icons.edit,
              color: Colors.white,
            ),
          ],
        ),
      );
}

class EditForm extends StatefulWidget {
  final String value;

  const EditForm({Key key, this.value}) : super(key: key);
  @override
  _EditFormState createState() => _EditFormState();
}

class _EditFormState extends State<EditForm> {
  final GlobalKey<FormState> _form = GlobalKey();
  final TextEditingController _item = TextEditingController();

  @override
  void initState() {
    super.initState();
    _item.text = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Edit Item"),
      content: Form(
        key: _form,
        child: TextFormField(
          controller: _item,
          decoration: InputDecoration(
            labelText: "Item Value",
            fillColor: Colors.blue[100],
            filled: true,
          ),
          validator: (value) {
            if (value.isEmpty) {
              return "Enter Item Value";
            }
            return null;
          },
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: FlatButton(
            color: Colors.green,
            onPressed: () {
              if (_form.currentState.validate()) {
                Navigator.pop(context, _item.text);
              }
            },
            child: Text("Save"),
          ),
        )
      ],
    );
  }
}
