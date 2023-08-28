import 'package:brands_and_shops/inner_screens/product_details.dart';
import 'package:brands_and_shops/services/dark_theme_prefs.dart';
import 'package:brands_and_shops/services/global_methods.dart';
import 'package:brands_and_shops/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class OnSaleWidget2 extends StatefulWidget {
  const OnSaleWidget2({Key? key}) : super(key: key);

  @override
  State<OnSaleWidget2> createState() => _OnSaleWidget2State();
}

class _OnSaleWidget2State extends State<OnSaleWidget2> {
  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).color;
    final theme = Utils(context).getTheme;
    Size size = Utils(context).getScreenSize;
    return Material(
      color: Theme.of(context).cardColor.withOpacity(0.1),
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: (){
          GlobalMethods.navigateTo(
                      ctx: context, 
                      routeName: ProductDetails.routeName);
          print("on sale widgeta basıldı");
        },
        child: Stack(
          children: [
            Positioned(
              child: Card(
                shape: const RoundedRectangleBorder(
                  side: BorderSide(color: Colors.cyan, width: 1),
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                child: SizedBox(
                  height: size.height*0.35,
                  width: size.width*0.4,
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: size.height*0.18,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: //FancyShimmerImage(imageUrl: "https://i.imgur.com/T3pbXjt.jpg",
                            //height: size.width*0.2,width: size.width*0.5,boxFit: BoxFit.fill,),
                          Image(image: const AssetImage("assets/images/otherImages/T3pbXjt.jpg"),
                          fit: BoxFit.fill,
                          width: size.width*0.5,
                          height: size.width*0.2,
                          )
                          ),
                        ),
                        //GestureDetector(onTap: (){print("Beğeni listesine alındı");}, child: Icon(Icons.favorite_border_outlined, size: 22, color: color,),),
                        TextWidget(text: "400 \u{20BA}", color: color, textSize: 20, isTitle: true,),
                        const SizedBox(height: 1),
                        TextWidget(text: " Eko Hoparlör", color: color, textSize: 15, isTitle: true,),
                        const SizedBox(height: 1),
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
                              print("Sepete eklendi");
                            },
                            child: TextWidget(
                              text: "Sepete Ekle",
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
            Positioned(
              top: 0,
              right: 0,
                child: IconButton(
                    onPressed: (){},
                    icon: const Icon(Icons.favorite_border_outlined),
                  color: Colors.cyan,
                ),
            ),
          ],
        ),
      ),
    );
  }
}


