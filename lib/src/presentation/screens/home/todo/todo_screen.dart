import 'package:flutter/material.dart';
import 'package:task_manger/src/presentation/utils/images.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        AppBar(
          elevation: 0,
          actions: [
            IconButton(
              icon: Image.asset(
                Images.searchIcon,
                width: 20,
                height: 20,
              ),
              onPressed: () {},
            ),
          ],
          centerTitle: true,
          title: Text(
            "TO-DO",
            style: TextStyle(
                fontSize: 14, fontWeight: FontWeight.w800, letterSpacing: 4),
          ),
          leading: IconButton(
            icon: Image.asset(
              Images.menuIcon,
              width: 20,
              height: 20,
            ),
            onPressed: () {},
          ),
        )
      ],
    ));
  }
}
