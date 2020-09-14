import 'package:f03_bottom/repo/course-model.dart';
import 'package:flutter/material.dart';

class CourseDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Course c = CourseModel.code(ModalRoute.of(context).settings.arguments);
    return Scaffold(
      appBar: AppBar(
        title: Text(c.title),
      ),
      body: Column(
        children: [
          _logo(c.code),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Modules",
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemCount: c.contents.length,
                itemBuilder: (context, index) {
                  Contents contents = c.contents[index];
                  return Card(
                      color: Colors.green[50],
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          leading: CircleAvatar(
                            child: Text(contents.logo),
                          ),
                          title: Text(contents.title),
                          subtitle: Text(contents.contents),
                        ),
                      ));
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  _logo(String image) => Container(
        padding: EdgeInsets.only(top: 24),
        alignment: Alignment.center,
        child: CircleAvatar(
          backgroundColor: Colors.green[100],
          child: Padding(
            padding: EdgeInsets.all(18),
            child: Image(
              image: AssetImage("images/$image.png"),
            ),
          ),
          maxRadius: 100,
          minRadius: 30,
        ),
      );
}
