import 'package:flutter/material.dart';

class TopAppBar extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const TopAppBar({Key? key, required this.scaffoldKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.white10,
      floating: false,
      expandedHeight: 50,
      title: const Text(
        "Flyingwolf",
        style:
        TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
      ),
      centerTitle: true,
      leading: IconButton(
          onPressed: () {
            scaffoldKey.currentState?.openDrawer();
          },
          icon: const Icon(
            Icons.menu,
            color: Colors.black,
          )),
    );
  }


}