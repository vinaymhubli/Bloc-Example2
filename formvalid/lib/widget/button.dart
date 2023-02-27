import 'package:flutter/cupertino.dart';

class Buttons extends StatelessWidget {
  final VoidCallback onpressed;
  final Color color;
  final Text text;

  const Buttons(
      {super.key,
      required this.onpressed,
      required this.color,
      required this.text});
  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onpressed,
      color: color,
      child: text,
    );
  }
}
