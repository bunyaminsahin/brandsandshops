import 'package:brands_and_shops/screens/viewed_recently/viewed_recently.dart';
import 'package:brands_and_shops/screens/wishlist/wishlist_screen.dart';
import 'package:brands_and_shops/services/global_methods.dart';
import 'package:brands_and_shops/widgets/text_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import '../provider/dark_theme_provider.dart';
import 'orders/orders_screen.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final TextEditingController _addressTextController = TextEditingController(text: "");
  @override
  void dispose() {
    _addressTextController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    final Color color = themeState.getDarkTheme ? Colors.white : Colors.black;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 30),
                RichText(
                  text: TextSpan(
                    text: "Hesap Bilgileriniz, ",
                    style: TextStyle(
                    color: color,
                    fontSize: 22,
                    fontWeight: FontWeight.normal),
                  children: <TextSpan>[
                    TextSpan(
                      text: "Ekrem",
                      style: TextStyle(
                          color: color,
                          fontSize: 22,
                          fontWeight: FontWeight.w500),
                      recognizer: TapGestureRecognizer()..onTap = (){},
                    ),
                  ],
                ),
                ),
                TextWidget(
                    text: "mail@mail.com",
                    color: color, textSize: 15,
                ),
                const Divider(
                  thickness: 1,
                ),
                const SizedBox(height: 8),
                _listTiles(
                    title: "Adres bilgilerim",
                    subtitle: "Kargo ve faturaya ait adres bilgileri",
                    icon: Icons.location_on,
                    onPressed: () async {
                      await _showAdressDialog();
                    },
                    color: color),
                _listTiles(
                    title: "Ödeme bilgilerim",
                    subtitle: "Kart ve hesap bilgileri",
                    icon: Icons.credit_card,
                    onPressed: (){},
                    color: color),
                _listTiles(
                    title: "Şifremi unuttum",
                    subtitle: "Şifre yenileme",
                    icon: Icons.lock_rounded,
                    onPressed: (){},
                    color: color),
                _listTiles(
                    title: "Siparişlerim",
                    subtitle: "Sipariş listesi",
                    icon: Icons.check_box,
                    onPressed: (){
                      GlobalMethods.navigateTo(
                          ctx: context, routeName: OrderScreen.routeName);
                    },
                    color: color),
                _listTiles(
                    title: "Favorilerim",
                    subtitle: "Favori ve beğeniler",
                    icon: Icons.favorite,
                    onPressed: (){
                      GlobalMethods.navigateTo(
                          ctx: context, routeName: WishlistScreen.routeName);
                    },
                    color: color),
                _listTiles(
                    title: "Görüntülediklerim",
                    subtitle: "En son görüntülenenler",
                    icon: Icons.remove_red_eye,
                    onPressed: (){
                      GlobalMethods.navigateTo(
                          ctx: context, routeName: ViewedRecently.routeName);
                    },
                    color: color),
                _listTiles(title: "Çıkış yap", icon: Icons.logout, onPressed: () async {
                  GlobalMethods.warningDialog(
                    title: " Çıkış yap.",
                    subtitle: "Hesabınızı silmek için emin misiniz?",
                    fct: (){},
                    context: context,
                    icon: const Icon(Icons.logout),
                  );
                }, color: color),
                SwitchListTile(
                  activeColor: Colors.cyan,
                  title: TextWidget(text: themeState.getDarkTheme? "Beyaz Mod" : "Kapalı Mod", color: color, textSize: 18),
                  subtitle: const Text("Mod değişimi"),
                  secondary: Icon(themeState.getDarkTheme
                      ? Icons.dark_mode_outlined
                      :  Icons.light_mode_rounded),
                  onChanged: (bool value){
                    setState(() {
                      themeState.setDarkTheme = value;
                    });
                  },
                  value: themeState.getDarkTheme,)
              ],
            ),
          ),
        ),
      )
    );
  }

  Future<void> _showAdressDialog() async {
    await showDialog(
        context: context,
        builder: (context){
      return AlertDialog(
        title: const Text("Adres bilgisini yazın."),
        content: TextField(
          onChanged: (value){
            print("_addressTextController.text ${_addressTextController.text}");
          },
          controller: _addressTextController,
          maxLines: 2,
          decoration: const InputDecoration(
              hintText: "Adres bilgisini yazın lütfen."
          ),
        ),
        actions: [
          TextButton(
              onPressed: (){},
              child: const Text("Güncelle", style: TextStyle(fontSize: 15),)),
          TextButton(
              onPressed: (){if(Navigator.canPop(context)){
            Navigator.pop(context);
          }},
              child: const Text("İptal", style: TextStyle(fontSize: 15),)),
        ],
      );
    });
  }

  Widget _listTiles ({
    required String title,
    String? subtitle,
    required IconData icon,
    required Function onPressed,
    required Color color,
  }){
    return ListTile(
      title: TextWidget(
        text: title,
        color: color,
        textSize: 18,
        //isTitle: true,
      ),
      subtitle: TextWidget(
          text: subtitle == null ? "" : subtitle, //text: subtitle ?? "",
          color: color,
          textSize: 15), //subtitle==null ? "" : subtitle
      leading: Icon(icon),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: (){
        onPressed();
      },
    );
  }
}
