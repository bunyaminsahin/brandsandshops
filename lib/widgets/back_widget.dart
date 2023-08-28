import 'package:flutter/material.dart';
import '../services/dark_theme_prefs.dart';

class BackWidget extends StatelessWidget {
  const BackWidget({Key? key, required color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).color;
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      child: Icon(
        Icons.arrow_back_ios_sharp,
        color: color,
        ),
      onTap: (){
        Navigator.pop(context);
      },
    );
  }
}
