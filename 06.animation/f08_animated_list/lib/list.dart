import 'package:flutter/material.dart';

class MyList extends StatefulWidget {
  @override
  _MyListState createState() => _MyListState();
}

class _MyListState extends State<MyList> with SingleTickerProviderStateMixin {
  AnimationController _btnIconController;
  bool _show = false;
  List<Widget> _items = [];
  GlobalKey<AnimatedListState> _listState = GlobalKey();

  @override
  void initState() {
    _btnIconController = AnimationController(
        vsync: this,
        duration: Duration(seconds: 1),
        reverseDuration: Duration(seconds: 1));
    super.initState();
  }

  @override
  void dispose() {
    _btnIconController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _button(),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: AnimatedList(
          key: _listState,
          initialItemCount: _items.length,
          itemBuilder: (_, index, animation) => _buildItem(index, animation),
        ),
      ),
    );
  }

  _buildItem(int index, Animation<double> animation) => SlideTransition(
        position: _animation(animation),
        child: _items[index],
      );

  _animation(Animation<double> animation) => Tween(
        begin: Offset(1, 0),
        end: Offset(0, 0),
      ).animate(
        CurvedAnimation(
          parent: animation,
          curve: Curves.easeInOutCubic,
        ),
      );

  _button() => FloatingActionButton(
        onPressed: () {
          setState(() {
            _show = !_show;
            _show ? _btnIconController.forward() : _btnIconController.reverse();
            _show ? _load() : _clear();
          });
        },
        child: AnimatedIcon(
          icon: AnimatedIcons.menu_close,
          progress: _btnIconController,
          textDirection: TextDirection.rtl,
        ),
      );

  _load() {
    var future = Future(() {});
    for (var i = 0; i < 10; i++) {
      future = future.then(
        (_) => Future.delayed(
          Duration(milliseconds: 500),
          () {
            _items.add(_item(i));
            _listState.currentState.insertItem(i);
          },
        ),
      );
    }
  }

  _clear() {
    var future = Future(() {});
    for (var i = _items.length - 1; i >= 0; i--) {
      future = future.then(
        (_) => Future.delayed(Duration(milliseconds: 500), () {
          final item = _items.removeAt(i);
          _listState.currentState.removeItem(
            i,
            (_, animation) => SlideTransition(
              position: _animation(animation),
              child: item,
            ),
          );
        }),
      );
    }
  }

  _item(int index) => Card(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Text(
            "Item ${index + 1}",
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
      );
}
