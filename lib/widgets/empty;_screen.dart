import 'package:brands_and_shops/inner_screens/on_sale_screen2.dart';
import 'package:brands_and_shops/services/global_methods.dart';
import 'package:brands_and_shops/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import '../services/dark_theme_prefs.dart';

class EmptyScreen extends StatelessWidget {
  const EmptyScreen({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.buttonText,
    required this.imageSize
  }) : super(key: key);
  final String imagePath, title, subtitle, buttonText;
  final double imageSize;

  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).color;
    Size size = Utils(context).getScreenSize;
    return SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: size.height*0.1,
                    ),
                   ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(8)),//width: imageSize,boxFit: BoxFit.fill,
                      child: Image(
                        image: const AssetImage("assets/images/otherImages/emptycart555.png"),
                        width: imageSize,
                        fit: BoxFit.fill,
                        )
                        //height: size.width*0.6,
                    //size.width*0.8,
                      
                    ),
                    SizedBox(
                      height: size.height*0.03,
                    ),
                    TextWidget(
                      text: title,
                      color: color,
                      textSize: 15,
                      isTitle: true,
                    ),
                    SizedBox(
                      height: size.height*0.03,
                    ),
                    TextWidget(
                      text: subtitle,
                      color: color,
                      textSize: 15,
                      isTitle: true,
                    ),
                    SizedBox(
                      height: size.height*0.015,
                    ),
                    Container(
                      height: size.height*0.05 ,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.cyan, width: 1.7,),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(8.0),
                        ),
                      ),
                      child: TextButton(
                        onPressed: (){
                          GlobalMethods.navigateTo(ctx: context,
                              routeName: OnSaleScreen2.routeName);
                        },
                        child: TextWidget(
                          text: buttonText,
                          color: color,
                          textSize: 15,
                          isTitle: true,),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
    );
  }
}
