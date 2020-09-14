import 'package:flutter/material.dart';

class Courses extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 3,
          child: GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .pushNamed("/course/details", arguments: "jse");
            },
            child: Card(
                child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Image(
                    image: AssetImage("images/jse.png"),
                    width: 100,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Java Basic",
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    Text("Fundamental"),
                    Padding(
                      padding: EdgeInsets.only(top: 8),
                      child: Text(
                        "Everything is start from beginning!",
                        textAlign: TextAlign.left,
                        maxLines: 5,
                      ),
                    )
                  ],
                )
              ],
            )),
          ),
        ),
        Expanded(
          flex: 4,
          child: Row(
            children: [
              _card("Jakarta EE", "jee", context),
              _card("Spring MVC", "mvc", context),
            ],
          ),
        ),
        Expanded(
          flex: 4,
          child: Row(
            children: [
              _card("Angular", "ang", context),
              _card("Flutter", "flu", context),
            ],
          ),
        ),
      ],
    );
  }

  _card(String title, String image, BuildContext context) => Expanded(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context)
                .pushNamed("/course/details", arguments: image);
          },
          child: Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage("images/$image.png"),
                  width: 120,
                ),
                Text(
                  title,
                  style: Theme.of(context).textTheme.headline5,
                )
              ],
            ),
          ),
        ),
      );
}
