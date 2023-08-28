import 'package:brands_and_shops/services/dark_theme_prefs.dart';
import 'package:brands_and_shops/widgets/on_sale_widget2.dart';
import 'package:brands_and_shops/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/dark_theme_provider.dart';
import '../widgets/categories_widget.dart';

class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({Key? key}) : super(key: key);
  
  List<Map<String, dynamic>> catInfo = [
    {
      "imgPath" : "assets/images/categoryImages/multimedya.jpg",  //1
      "catText" : "Görüntü Sistemleri",
    },
    {
      "imgPath" : "assets/images/categoryImages/sesSistemleri6.jpg", //2
      "catText" : "Ses Sistemleri",
    },
    {
      "imgPath" : "assets/images/categoryImages/inverterSistemleri.jpg", //3
      "catText" : "Inventör Sistemleri",
  },
    {
      "imgPath" : "assets/images/categoryImages/ozelDizaynlar.jpg", //4
      "catText" : "Özel Dizaynlar",
     },
    {
      "imgPath" : "assets/images/categoryImages/renkliFar2.png", //5
      "catText" : "Renkli Farlar",
      },
    {
      "imgPath" : "assets/images/categoryImages/sisFari3.jpg", //6
      "catText" : "Sis Farları",
     },
    {
      "imgPath" : "assets/images/categoryImages/farTemizligi8.jpg", //7
      "catText" : "Far Tamiri ve Temizliği",
     },
    {
      "imgPath" : "assets/images/categoryImages/toggjant.jpg", //8
      "catText" : "Jant Temizliği",
   },
    {
      "imgPath" : "assets/images/categoryImages/antenMontaji.jpg", //9
      "catText" : "Antenler",
    },
    {
      "imgPath" : "assets/images/categoryImages/anahtar7.png", //10
      "catText" : "Anahtar Yapımı",
    },
    {
      "imgPath" : "assets/images/categoryImages/tamir5.png", //10
      "catText" : "Elektronik Cihaz Tamiri",
    },
  ];

  @override
  Widget build(BuildContext context) {
    final utils = Utils(context);
    Color color = utils.color;
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
      title: TextWidget(
        text: "Kategoriler",
        color: color,
        textSize: 22,
        isTitle: true,),),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 2, 2, 0),
          child: GridView.count(
            crossAxisCount: 2,
            childAspectRatio: 240/250,
            crossAxisSpacing: 0, //Vertical spacing
            mainAxisSpacing: 0, //Horizantal spacing
            children: List.generate(11, (index) {
              return CategoriesWidget(
                catText: catInfo[index]["catText"],
                imgPath: catInfo[index]["imgPath"],
                color: const Color(0x00BCD4FF),
              );
            }),
          ),
        ),
      ),
    );
  }
}