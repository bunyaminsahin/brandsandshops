import 'package:brands_and_shops/inner_screens/on_sale_screen2.dart';
import 'package:brands_and_shops/services/dark_theme_prefs.dart';
import 'package:brands_and_shops/services/global_methods.dart';
import 'package:brands_and_shops/widgets/feed_items.dart';
import 'package:brands_and_shops/widgets/on_sale_widget2.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import '../widgets/banner_widget.dart';
import '../widgets/text_widget.dart';
import '../consts/contss.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final themeState = Utils(context).getTheme;
    final utils = Utils(context);
    Color color = utils.color;
    Size size = Utils(context).getScreenSize;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  child: Banner(
                    message: 'Reklam',
                    location: BannerLocation.topEnd,
                    child: SizedBox(
                      height: size.height * 0.20,
                      child: Swiper(
                        itemBuilder: (BuildContext context, int index) {
                          return Image.asset(
                            Constss.offerImages[index],
                            fit: BoxFit.fill,
                          );
                        },
                        autoplay: true,
                        itemCount: Constss.offerImages.length,
                        pagination: const SwiperPagination(
                          alignment: Alignment.bottomCenter,
                          builder: DotSwiperPaginationBuilder(
                              color: Colors.white,
                              activeColor: Colors.cyan,
                              size: 6.5,
                              activeSize: 10),
                        ),
                        control: const SwiperControl(
                          color: Colors.cyan,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 4),
              const BannerWidget(
                //solRenk: Colors.deepPurple,
                sag1Renk: Colors.blue,
                sag2Renk: Colors.purpleAccent,
                yaziBoyutu: 18,
                yazi: "Kurulumu\nÜcretsiz\nÜrünler",
                resimYolu: "assets/images/otherImages/montaj2.png",
              ),
              const SizedBox(height: 2),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(width: 3),
                  TextWidget(
                      text: "Montajı Ücretsiz Ürünler:",
                      color: color,
                      textSize: 15,
                      isTitle: true),
                  const Spacer(),
                  Container(
                    height: size.height * 0.05,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.cyan,
                        width: 1.7,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(8.0),
                      ),
                    ),
                    child: TextButton(
                      onPressed: () {
                        GlobalMethods.navigateTo(
                            ctx: context, routeName: OnSaleScreen2.routeName);
                      },
                      child: TextWidget(
                        text: "Hepsini Göster",
                        color: color,
                        textSize: 15,
                        isTitle: true,
                      ),
                    ),
                  ),
                  const SizedBox(width: 4),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Flexible(
                    child: SizedBox(
                      height: size.height * 0.35,
                      child: ListView.builder(
                          itemCount: 9,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return const OnSaleWidget2();
                          }),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 2),
              const BannerWidget(
                  //solRenk: Colors.deepPurple,
                  sag1Renk: Colors.purpleAccent,
                  sag2Renk: Colors.blue,
                  yaziBoyutu: 20,
                  yazi: "Süper\nFiyatlar",
                  resimYolu: "assets/images/otherImages/super-Fiyat.png"),
              const BannerWidget(
                  //solRenk: Colors.deepPurple,
                  sag1Renk: Colors.cyan,
                  sag2Renk: Colors.purpleAccent,
                  yaziBoyutu: 18,
                  yazi:
                      "Tarafımızca Sağlanan Montaj ve Ürünlere\nGaranti Veriyoruz",
                  resimYolu: "assets/images/otherImages/garanti33.jpg"),
              Padding(
                padding: const EdgeInsets.fromLTRB(6, 3, 6, 3),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextWidget(
                        text: "Ürünler",
                        color: color,
                        textSize: 15,
                        isTitle: true),
                    //const Spacer(),
                    Container(
                      height: size.height * 0.05,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.cyan,
                          width: 1.7,
                        ),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(8.0),
                        ),
                      ),
                      child: TextButton(
                        onPressed: () {
                          GlobalMethods.navigateTo(
                            ctx: context, routeName: OnSaleScreen2.routeName);
                        },
                        child: TextWidget(
                          text: "Tümünü Göster",
                          color: color,
                          textSize: 15,
                          isTitle: true,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                //crossAxisSpacing: 10,
                childAspectRatio: size.width / (size.height * 0.8),
                children: List.generate(14, (index) {
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
