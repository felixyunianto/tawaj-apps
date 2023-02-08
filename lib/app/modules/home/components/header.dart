import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key, required this.name});
  final String name;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration : BoxDecoration(
        color : Color(0xff0C3B2E),
      ),
      child: Text("FELIX"),
    );
  }
}