import 'package:flutter/material.dart';

class AnimatedIconDemo extends StatefulWidget {
  @override
  _AnimatedIconDemoState createState() => _AnimatedIconDemoState();
}

class _AnimatedIconDemoState extends State<AnimatedIconDemo>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  bool _status = false;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Text(
            "Animated Icons",
            style: Theme.of(context).textTheme.headline4,
          ),
          SizedBox(height: 8),
          Center(
            child: Table(
              children: [
                _row([
                  AnimatedIcons.add_event,
                  AnimatedIcons.arrow_menu,
                  AnimatedIcons.close_menu
                ]),
                _row([
                  AnimatedIcons.ellipsis_search,
                  AnimatedIcons.event_add,
                  AnimatedIcons.home_menu
                ]),
                _row([
                  AnimatedIcons.list_view,
                  AnimatedIcons.menu_arrow,
                  AnimatedIcons.menu_close
                ]),
                _row([
                  AnimatedIcons.menu_home,
                  AnimatedIcons.pause_play,
                  AnimatedIcons.play_pause
                ]),
                TableRow(children: [
                  _cell(AnimatedIcons.search_ellipsis),
                  _cell(AnimatedIcons.view_list),
                  _cellForWidget(GestureDetector(
                    onTap: () {
                      setState(() {
                        _status = !_status;

                        if (_status) {
                          _controller.forward();
                        } else {
                          _controller.reverse();
                        }
                      });
                    },
                    child: CircleAvatar(
                      child: Icon(Icons.face),
                      radius: 28,
                    ),
                  ))
                ]),
              ],
            ),
          )
        ],
      ),
    );
  }

  _row(List<AnimatedIconData> list) => TableRow(children: [
        _cell(list[0]),
        _cell(list[1]),
        _cell(list[2]),
      ]);

  _cell(AnimatedIconData data) => _cellForWidget(AnimatedIcon(
        icon: data,
        progress: _controller,
        size: 48,
      ));

  _cellForWidget(Widget widget) => Container(
        height: 150,
        alignment: Alignment.center,
        child: widget,
      );
}
