class NotEmpty {
  final String fieldName;
  NotEmpty(this.fieldName);

  String validate(String value) {
    if (value.isEmpty) {
      return "Please enter $fieldName";
    }
    return null;
  }
}
