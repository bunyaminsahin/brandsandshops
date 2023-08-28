import 'package:brands_and_shops/services/dark_theme_prefs.dart';
import 'package:brands_and_shops/widgets/auth_button.dart';
import 'package:brands_and_shops/widgets/text_widget.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import '../../consts/contss.dart';
class ForgetPasswordScreen extends StatefulWidget {
  static const routeName = "/ForgetPasswordScreen";
  const ForgetPasswordScreen({Key? key}) : super(key: key);
  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}
class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final _emailTextController = TextEditingController();
  @override
  void dispose() {
    _emailTextController.dispose();
    super.dispose();
  }
  void _forgetPassFCT() async {}
  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).getScreenSize;

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Swiper(
              duration: 1200,
              autoplayDelay: 3500,
              itemBuilder: (BuildContext context, int index) {
                return Image.asset(
                  Constss.authImagesPath[index],
                  fit: BoxFit.fill,
                );
              },
              autoplay: true,
              itemCount: Constss.authImagesPath.length,
              //pagination: const SwiperPagination(alignment: Alignment.bottomCenter,builder: DotSwiperPaginationBuilder(color: Colors.white,activeColor: Colors.cyan,size: 6.5,activeSize: 10),),
              //control: const SwiperControl(color: Colors.cyan,),
            ),
            Container(
              color: Colors.black.withOpacity(0.7),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  const SizedBox(
                      height: 35,),
                    InkWell(
                      //borderRadius: BorderRadius.circular(8),
                      onTap: (){
                        //Navigator.pop(context);
                        Navigator.canPop(context)? Navigator.pop(context) : null;
                      },
                      child: const Icon(
                        Icons.arrow_back_ios_sharp,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                  const SizedBox(
                      height: 40,
                    ),
                    TextWidget(
                    text: "Mevcut şifrenizi güncellenmek için, email adresinizi yazın.",
                    color: Colors.white, 
                    textSize: 15,
                    //isTitle: true,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextField(
                      controller: _emailTextController,
                            style: const TextStyle(color: Colors.white),
                            decoration: const InputDecoration(
                              hintText: "Email",
                              hintStyle: TextStyle(color: Colors.white, fontSize: 13),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                            ),
                    ),
                const SizedBox(height: 6,),
                AuthButton(fct: (){
                  _forgetPassFCT();
                },
                buttonText: "Şifre yenile",
                ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}