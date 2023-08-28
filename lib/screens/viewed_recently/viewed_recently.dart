import 'package:brands_and_shops/screens/viewed_recently/viewed_widget.dart';
import 'package:brands_and_shops/widgets/empty;_screen.dart';
import 'package:brands_and_shops/widgets/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../services/dark_theme_prefs.dart';
import '../../services/global_methods.dart';
import '../../widgets/back_widget.dart';

class ViewedRecently extends StatefulWidget {
  static const routeName = "/ViewedRecently";
  const ViewedRecently({Key? key}) : super(key: key);

  @override
  State<ViewedRecently> createState() => _ViewedRecentlyState();
}

class _ViewedRecentlyState extends State<ViewedRecently> {
  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).color;
    final theme = Utils(context).getTheme;
    Size size = Utils(context).getScreenSize;
    bool isEmpty = true;
    return isEmpty
        ? EmptyScreen(
      imagePath: "https://i.ibb.co/X86L6NS/historyimage.png",
      title: "En son görüntülenen yok.",
      subtitle: "Güvenli ve garantili \n alışverişe başlayın.",
      buttonText: "Alışverişe Başla",
      imageSize: size.width*0.85,
    )
        : SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: BackWidget(color: color,),
          automaticallyImplyLeading: false,
          title: TextWidget(
            text: "Görüntülediklerim",
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
                  title: " En son \n görüntülenenleri sil.",
                  subtitle: "En son görüntülenenleri silmek için emin misiniz?",
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
        body: ListView.builder(
            itemCount: 10,
            itemBuilder: (ctx, index) {
              return const Padding(
                padding: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                child: ViewedRecentlyWidget(),
              );
            }
        ),
      ),
    );
  }
}
