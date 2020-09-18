# Form

ဒီနေရာမှာတော့ Moblie ပတ်ဝန်းကျင်မှာ အသုံးပြုနေတဲ့ Input Element တွေနဲ့ ပတ်သက်ပြီး လေ့လာသွားမှာ ဖြစ်ပါတယ်။ 

1. Text Input Field
2. Keyboard type
3. Validations
4. Date Picker
5. Time Picker
6. Select One Menu
7. Select menu Object
8. Auto Fill

## Text Input Field

User Input တွေကိုလက်ခံဖို့ အဓိက Widget တစ်ခုကတော့ TextFormField ဖြစ်ပါတယ်။ 

### Basic Input Field

![Basic Box](images/basic-input.png){width="50%"}

```
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
```

### Filled Box Input Field

![Filled Box](images/filled-input.png){width="50%"}

```
class FilledBoxInput extends StatelessWidget {
  final String label;
  final TextInputType inputType;
  final bool hidePass;
  final Color filledColor;
  final double borderRadius;

  const FilledBoxInput({
    Key key,
    @required this.label,
    @required this.filledColor,
    this.borderRadius = 8,
    this.inputType = TextInputType.name,
    this.hidePass = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: filledColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(borderRadius),
          topRight: Radius.circular(borderRadius),
        ),
      ),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: label,
          contentPadding: EdgeInsets.all(8),
        ),
        keyboardType: TextInputType.name,
        obscureText: hidePass,
      ),
    );
  }
}
```

### Outline Box Input Field

![Outline Box](images/outline-input.png){width="50%"}

```
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
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
        keyboardType: inputType,
        obscureText: hidePass,
      ),
    );
  }
}
```
