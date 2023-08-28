import 'package:brands_and_shops/inner_screens/product_details.dart';
import 'package:brands_and_shops/services/global_methods.dart';
import 'package:brands_and_shops/widgets/text_widget.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../services/dark_theme_prefs.dart';

class ViewedRecentlyWidget extends StatefulWidget {
  const ViewedRecentlyWidget({Key? key}) : super(key: key);

  @override
  State<ViewedRecentlyWidget> createState() => _ViewedRecentlyWidgetState();
}

class _ViewedRecentlyWidgetState extends State<ViewedRecentlyWidget> {
  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).color;
    final theme = Utils(context).getTheme;
    Size size = Utils(context).getScreenSize;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: (){
          GlobalMethods.navigateTo(
              ctx: context,
              routeName: ProductDetails.routeName);
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FancyShimmerImage(
              imageUrl: "https://i.imgur.com/T3pbXjt.jpg",
              boxFit: BoxFit.fill,
              height: size.width*0.2,
              width: size.width*0.2,
            ),
            const SizedBox(
              width: 12,
            ),
            Column(
              children: [
                TextWidget(
                  text: "Ürün",
                  color: color,
                  textSize: 15,
                  isTitle: true,
                ),
                const SizedBox(
                  width: 12,
                ),
                TextWidget(
                  text: "200\u{20BA}",
                  color: color,
                  textSize: 15,
                  isTitle: true,
                ),
              ],
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Material(
                color: Colors.cyan,
                borderRadius: BorderRadius.circular(8),
                child: InkWell(
                  borderRadius: BorderRadius.circular(8),
                  onTap: (){},
                  child: const Padding(
                    padding: EdgeInsets.all(3.0),
                    child:  Icon(
                      CupertinoIcons.plus_square,
                      color: Colors.white,
                      size: 22,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
