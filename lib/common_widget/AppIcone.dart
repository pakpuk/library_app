import 'package:flutter/material.dart';

class AppIcon extends StatelessWidget {
  final Color backgroundcolor;
  final Color Iconecolor;
  final double size;
  final IconData icon;
  final double iconsize = 16;

  const AppIcon(
      {super.key,
      this.backgroundcolor = const Color(0xFFfcf4e4),
      this.Iconecolor = const Color(0xFF756d54),
      this.size = 40,
      required this.icon});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size / 2),
        color: backgroundcolor,
      ),
      child: Icon(
        icon,
        color: Iconecolor,
        size: iconsize,
      ),
    );
  }
}
