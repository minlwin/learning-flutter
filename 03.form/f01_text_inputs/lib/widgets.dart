import 'package:flutter/material.dart';

class BasicInput extends StatelessWidget {
  final String label;
  final TextInputType inputType;
  final bool hidePass;

  const BasicInput(
      {Key key,
      @required this.label,
      this.inputType = TextInputType.name,
      this.hidePass = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(labelText: label),
      keyboardType: inputType,
      obscureText: hidePass,
    );
  }
}

class FilledBoxInput extends StatelessWidget {
  final String label;
  final TextInputType inputType;
  final bool hidePass;
  final Color filledColor;

  const FilledBoxInput({
    Key key,
    @required this.label,
    @required this.filledColor,
    this.inputType = TextInputType.name,
    this.hidePass = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: filledColor,
      ),
      keyboardType: inputType,
      obscureText: hidePass,
    );
  }
}

class OutlineBoxInput extends StatelessWidget {
  final String label;
  final TextInputType inputType;
  final bool hidePass;

  const OutlineBoxInput({
    Key key,
    @required this.label,
    this.inputType = TextInputType.name,
    this.hidePass = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
      ),
      keyboardType: inputType,
      obscureText: hidePass,
    );
  }
}
