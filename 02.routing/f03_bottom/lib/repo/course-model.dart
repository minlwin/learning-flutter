class Course {
  String code;
  String title;
  List<Contents> contents;

  Course(this.code, this.title, this.contents);
}

class Contents {
  String title;
  String contents;

  Contents(this.title, this.contents);

  String get logo => title.substring(0, 1).toUpperCase();
}

class CourseModel {
  static final List<Course> _courses = [
    Course("jse", "Java Basic", [
      Contents("Fundamentals", "Basic Concepts for Java Programming."),
      Contents("OOP",
          "Object Oriented Programming is the most fundamental Concept."),
      Contents(
          "API", "Essential Java AP that all Java Developer need to know."),
      Contents("Java FX",
          "Rich Client API for GUI application development in Java Desktop Application."),
      Contents("Database",
          "MySQL Database and JDBC API to use Relational Database in Java Environment."),
    ]),
    Course("mvc", "Spring MVC", []),
    Course("jee", "Jakarta EE", []),
    Course("ang", "Angular", []),
    Course("flu", "Flutter", []),
  ];

  static Course code(String code) =>
      _courses.firstWhere((element) => element.code == code);

  static List<Course> get courses => _courses.toList();
}
