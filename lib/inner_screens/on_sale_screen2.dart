import 'package:brands_and_shops/widgets/back_widget.dart';
import 'package:brands_and_shops/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import '../services/dark_theme_prefs.dart';
import '../widgets/empty;_screen.dart';
import '../widgets/feed_items.dart';

class OnSaleScreen2 extends StatefulWidget { 
  static const routeName = "/OnSaleScreen";
  const OnSaleScreen2({Key? key}) : super(key: key);

  @override
  State<OnSaleScreen2> createState() => _OnSaleScreen2State();
}

class _OnSaleScreen2State extends State<OnSaleScreen2> {
  final TextEditingController _searchTextController = TextEditingController();
  final FocusNode _searchTextFocusNode = FocusNode();
  @override
  void dispose() {
    _searchTextController.dispose();
    _searchTextFocusNode.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final themeState = Utils(context).getTheme;
    final Color color = Utils(context).color;
    Size size = Utils(context).getScreenSize;
    bool isEmpty = false;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
          title: TextWidget(text: "Tüm Ürünler", color: color, textSize: 20, isTitle: true,),
          leading: BackWidget(color: color,),
        ),
        body: isEmpty ?
        EmptyScreen(
          imagePath: "https://i.ibb.co/X86L6NS/historyimage.png",
          title: "İlgili ürün en kısa zamanda eklenecek.",
          subtitle: "Güvenli ve garantili \n alışverişe başlayın.",
          buttonText: "Alışverişe Başla",
          imageSize: size.width*0.85,
        )
        : SingleChildScrollView(
          child: Column(children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(3, 1, 3, 1),
                child: SizedBox(
                  height: kBottomNavigationBarHeight,
                  child: TextField(
                    focusNode: _searchTextFocusNode,
                    controller: _searchTextController,
                    onChanged: (valuee){
                      setState(() {

                      });
                    },
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Colors.cyan, width: 1.5),),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Colors.cyan, width: 1.5),),
                      hintText: "Aradığınız ürün veya hizmet",
                      prefixIcon: const Icon(Icons.search),
                      suffix: IconButton(
                          onPressed: (){
                            _searchTextController.clear();
                            _searchTextFocusNode.unfocus();
                          },
                          icon: const Icon(Icons.close)),
                    ),
                  ),
                ),
              ),
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                //crossAxisSpacing: 10,
                childAspectRatio: size.width / (size.height*0.8),
                children: List.generate(10, (index) {
                  return const FeedsWidget();
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


