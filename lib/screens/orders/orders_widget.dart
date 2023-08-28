import 'package:brands_and_shops/inner_screens/product_details.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../services/dark_theme_prefs.dart';
import '../../services/global_methods.dart';
import '../../widgets/text_widget.dart';

class OrderWidget extends StatefulWidget {
  const OrderWidget({Key? key}) : super(key: key);

  @override
  State<OrderWidget> createState() => _OrderWidgetState();
}

class _OrderWidgetState extends State<OrderWidget> {
  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).color;
    final theme = Utils(context).getTheme;
    Size size = Utils(context).getScreenSize;
    return ListTile(
      subtitle: const Text("Ödenen: 200\u{20BA}"),
      onTap: (){
        GlobalMethods.navigateTo(
          ctx: context, routeName: ProductDetails.routeName);
      },
      leading: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
        ),
        child: FancyShimmerImage(
          width: size.width*0.2,
            imageUrl: "https://i.imgur.com/T3pbXjt.jpg",
          boxFit: BoxFit.fill,
        ),
      ),
      title: TextWidget(
          text: "Ürün x 4",
          color: color,
          textSize: 15,
        isTitle: true,
      ),
      trailing: TextWidget(
          text: "01/03/2023",
          color: color,
          textSize: 15,
      ),
    );
  }
}