import 'package:brands_and_shops/services/dark_theme_prefs.dart';
import 'package:brands_and_shops/widgets/price_widget.dart';
import 'package:brands_and_shops/widgets/text_widget.dart';
import 'package:brands_and_shops/widgets/feed_items.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OnSaleWidget extends StatefulWidget {
  const OnSaleWidget({Key? key}) : super(key: key);

  @override
  State<OnSaleWidget> createState() => _OnSaleWidgetState();
}

class _OnSaleWidgetState extends State<OnSaleWidget> {
  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).color;
    final theme = Utils(context).getTheme;
    Size size = Utils(context).getScreenSize;
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Material(
        color: Theme.of(context).cardColor.withOpacity(1),
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: (){
            print("on sale widgeta basıldı");
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(
                      "https://i.imgur.com/T3pbXjt.jpg",
                      height: size.width*0.2,
                      fit: BoxFit.fill,
                    ),
                    SizedBox(
                      height: size.width*0.2,
                      child: Column(
                        children: [
                          TextWidget(
                              text: "1 Pcs",
                              color: color,
                              textSize: 22,
                              isTitle: true
                          ),
                          const SizedBox(height: 5,),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: (){
                                  print("Sepete eklendi");
                                },
                                child: const Icon(
                                    Icons.shopping_bag_outlined,
                                  size: 22,
                                ),
                              ),
                              GestureDetector(
                                onTap: (){
                                  print("Beğeni listesine alındı");
                                },
                                child: Icon(
                                  Icons.favorite_border_outlined,
                                  size: 22,
                                  color: color,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const PriceWidget(
                  salePrice: 2.99,
                  price: 5.99,
                  textPrice: "_quantityTextController", // bu tamamiyle olmadı.
                  isOnSale: true,
                ),
                const SizedBox(height: 5),
                TextWidget(text: "Product Title", color: color, textSize: 15, isTitle: true,),
                const SizedBox(height: 5),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
