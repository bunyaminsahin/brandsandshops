import 'package:brands_and_shops/widgets/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../services/dark_theme_prefs.dart';
import '../../services/global_methods.dart';
import '../../widgets/back_widget.dart';
import 'cart_widget.dart';
import '../../widgets/empty;_screen.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).color;
    final theme = Utils(context).getTheme;
    Size size = Utils(context).getScreenSize;
    bool isEmpty = true;
    return isEmpty
        ? EmptyScreen(
      imagePath: "assets/images/otherImages/emptycart555.png",
      //imagePath: "https://i.ibb.co/zVChkwp/emptycart555.png",
      //imagePath: "https://i.ibb.co/GJTwVGF/empty-Cart.png",
      title: "Sepetiniz boş.",
      subtitle: "Güvenli ve garantili \n alışverişe başlayın.",
      buttonText: "Alışverişe Başla",
      imageSize: size.width*0.8,
    )
        : SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: BackWidget(color: color,),
          title: TextWidget(
            text: "Sepetim",
            color: color,
            textSize: 22,
            isTitle: true,
          ),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
          actions: [
            IconButton(
                onPressed: (){
                  GlobalMethods.warningDialog(
                    title: " Sepeti boşalt.",
                    subtitle: "Sepeti boşaltmak için emin misiniz?",
                    fct: (){},
                    context: context,
                    icon: const Icon(CupertinoIcons.trash),
                  );
                },
                icon: const Icon(CupertinoIcons.trash),
              color: color,
            ),
            const SizedBox(width: 11),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(3.0),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (ctx, index){
                      return const CartWidget();
                    },
                ),
              ),
              _checkout(ctx: context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _checkout ({required BuildContext ctx}){
    final Color color = Utils(ctx).color;
    final theme = Utils(ctx).getTheme;
    Size size = Utils(ctx).getScreenSize;
    return SizedBox(
      width: double.infinity,
      height: size.height * 0.08,
      child: Row(
        children: [
          TextWidget(
            text: "Ödenecek Tutar: 400 \u{20BA}",
            color: color,
            textSize: 18,
            isTitle: true,
          ),
          const Spacer(),
          Material(
            color: Colors.cyan,
            borderRadius: BorderRadius.circular(4),
            child: InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: (){},
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: FittedBox(
                  child: TextWidget(
                    isTitle: true,
                    text: "Ödeme Yap",
                    color: Colors.white,
                    textSize: 18,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

