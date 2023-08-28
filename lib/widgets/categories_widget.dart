import 'package:brands_and_shops/provider/dark_theme_provider.dart';
import 'package:brands_and_shops/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:brands_and_shops/services/dark_theme_prefs.dart';
import 'package:brands_and_shops/widgets/price_widget.dart';
import '../services/dark_theme_prefs.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget(
      {Key? key,
        required this.catText,
        required this.imgPath,
        required this.color}) :
        super(key: key);
  final String catText, imgPath;
  final Color color;
  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    double _screenWidth = MediaQuery.of(context).size.width;
    final Color color = themeState.getDarkTheme? Colors.white : Colors.black;
    Size size = Utils(context).getScreenSize;
    return InkWell(
      onTap: (){
        print("Multimedya seçildi");
      },
      child: Card(
        shape: const RoundedRectangleBorder(
          side: BorderSide(color: Colors.cyan, width: 1),
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: size.height*0.2,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5.0),
                  child: Image.asset(imgPath, fit: BoxFit.cover),
                ),
              ),
            ),
            const SizedBox(height: 6),
            TextWidget(
              text: catText,
              color: color,
              textSize: 15 ,
              isTitle: true,),
            const SizedBox(height: 6),
          ],
        ),
      ),
    );
  }
}





















