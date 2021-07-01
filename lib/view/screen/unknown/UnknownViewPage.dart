import 'package:flutter/material.dart';

class UnknownViewPage extends StatefulWidget {
  const UnknownViewPage({Key? key}) : super(key: key);

  @override
  _UnknownPageViewState createState() => _UnknownPageViewState();
}

class _UnknownPageViewState extends State<UnknownViewPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        '404!',
      ),
    );
  }
}
