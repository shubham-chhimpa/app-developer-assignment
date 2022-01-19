import 'package:flutter/material.dart';

class SomeThingWentWrongPage extends StatelessWidget {
  const SomeThingWentWrongPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Some Thing Went Wrong!"),
      ),
    );
  }
}