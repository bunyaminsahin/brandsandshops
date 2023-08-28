import 'package:brands_and_shops/inner_screens/product_details.dart';
import 'package:brands_and_shops/services/global_methods.dart';
import 'package:brands_and_shops/widgets/text_widget.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../services/dark_theme_prefs.dart';

class WishlistWidget extends StatelessWidget {
  const WishlistWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).color;
    Size size = Utils(context).getScreenSize;
    return Padding(
      padding: const EdgeInsets.fromLTRB(3, 3, 3, 3),
      child: GestureDetector(
        onTap: (){
          GlobalMethods.navigateTo(
              ctx: context, routeName: ProductDetails.routeName);
        },
          child: Container(
            height: size.height*0.2,
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor, //.withOpacity(0.5)
              border: Border.all(color: Colors.cyan, width: 1.5) ,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 4),
                  width: size.width*0.25,
                  height: size.width*0.25,
                  child: FancyShimmerImage(
                    imageUrl: "https://i.imgur.com/T3pbXjt.jpg",
                    boxFit: BoxFit.fill,
                  ),
                ),
                Flexible(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const SizedBox(height: 5),
                          Flexible(
                            child: IconButton(
                              onPressed: (){},
                              icon: const Icon(Icons.shopping_bag_outlined),
                              color: color,
                            ),
                          ),
                          Flexible(
                            child: IconButton(
                              onPressed: (){},
                              icon: const Icon(Icons.favorite_border_outlined),
                              color: color,
                            ),
                          ),
                        ],
                      ),
                      //const SizedBox(height: 5),
                      Flexible(
                        child: TextWidget(
                          text: "Ürün",
                          color: color,
                          textSize: 15,
                          isTitle: true,
                          maxLines: 2,
                        ),
                      ),
                      const SizedBox(height: 5),
                      TextWidget(
                        text: "200 \u{20BA}",
                        color: color,
                        textSize: 18,
                        isTitle: true,
                      ),
                      const SizedBox(height: 5),
                    ],
                  ),
                ),
              ],
            ),
          ),
      ),
    );
  }
}
