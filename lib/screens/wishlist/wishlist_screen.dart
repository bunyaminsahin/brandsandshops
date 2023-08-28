import 'package:brands_and_shops/screens/wishlist/wishlist_widget.dart';
import 'package:brands_and_shops/widgets/back_widget.dart';
import 'package:brands_and_shops/widgets/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../services/dark_theme_prefs.dart';
import '../../services/global_methods.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class WishlistScreen extends StatelessWidget {
  static const routeName = "/WishlistScreen";
  const WishlistScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).color;
    final theme = Utils(context).getTheme;
    Size size = Utils(context).getScreenSize;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: BackWidget(color: color,),
          automaticallyImplyLeading: false,
          title: TextWidget(
            text: "Favorilerim",
            color: color, textSize: 22,
            isTitle: true,
          ),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
          actions: [
            IconButton(
              onPressed: (){
                GlobalMethods.warningDialog(
                  title: " Favorileri sil.",
                  subtitle: "Favorileri silmek için emin misiniz?",
                  fct: (){},
                  context: context,
                  icon: const Icon(CupertinoIcons.trash),
                );
              },
              icon: const Icon(CupertinoIcons.trash),
              color: color,
              //iconSize: 26,
            ),
            const SizedBox(width: 11),
          ],
        ),
        body: MasonryGridView.count(
          crossAxisCount: 2,
          //mainAxisSpacing: 6,
          //crossAxisSpacing: 0,
          itemBuilder: (context, index) {
            return const WishlistWidget();
          },
        ),
      ),
    );
  }
}