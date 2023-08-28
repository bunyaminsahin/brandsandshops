import 'package:brands_and_shops/widgets/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../services/dark_theme_prefs.dart';
import '../../services/global_methods.dart';
import '../../widgets/back_widget.dart';
import 'orders_widget.dart';


class OrderScreen extends StatelessWidget {
  static const routeName = "/OrderScreen";
  const OrderScreen({Key? key}) : super(key: key);

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
          title: TextWidget(
            text: "Siparişlerim",
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
                  title: " Tüm siparişleri sil.",
                  subtitle: "Tüm siparişleri silmek için emin misiniz?",
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
                child: ListView.separated(     //1:50 saniyesinde ***************
                  itemCount: 10,
                  itemBuilder: (ctx, index){
                    return const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 2, vertical: 6),
                      child: OrderWidget(),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index){
                    return const Divider(
                      color: Colors.cyan,
                      indent: 4,
                      endIndent: 4,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

