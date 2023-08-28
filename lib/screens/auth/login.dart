import 'package:brands_and_shops/screens/auth/forget_pass.dart';
import 'package:brands_and_shops/screens/btm_bar.dart';
import 'package:brands_and_shops/services/dark_theme_prefs.dart';
import 'package:brands_and_shops/widgets/auth_button.dart';
import 'package:brands_and_shops/widgets/google_button.dart';
import 'package:brands_and_shops/widgets/text_widget.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

import '../../consts/contss.dart';

class LoginScreen extends StatefulWidget {
   static const routeName = "/LoginScreen";
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailTextController = TextEditingController();
  final _passTextController = TextEditingController();
  final _passFocusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();
  var _obscureText = true;

  @override
  void dispose() {
    _emailTextController.dispose();
    _passTextController.dispose();
    _passFocusNode.dispose();
    super.dispose();
  }

  void _submitFormOnLogin() {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {
      print("The form is valid.");
    }
  }

  @override
  Widget build(BuildContext context) {

    final Color color = Utils(context).color;
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
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const SizedBox(
                      height: 90,),
                    TextWidget(
                      text: "Hoş Geldiniz", 
                      color: Colors.white, 
                      textSize: 18,
                      isTitle: true,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextWidget(
                      text: "Lütfen giriş yapınız.",
                      color: Colors.white, 
                      textSize: 15,
                      //isTitle: true,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              textInputAction: TextInputAction.next,
                              onEditingComplete: () => FocusScope.of(context)
                              .requestFocus(_passFocusNode),
                              controller: _emailTextController,
                              keyboardType: TextInputType.emailAddress,
                              validator: (value){
                                if (value!.isEmpty || !value.contains("@")) {
                                  return "Lütfen doğru email adresini yazınız.";
                                } else {
                                  return null;
                                }
                              },
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
                            const SizedBox(
                              height: 4,
                            ),
                            //password
                            TextFormField(
                              textInputAction: TextInputAction.done,
                              onEditingComplete: () {
                                _submitFormOnLogin();
                              },
                              controller: _passTextController,
                              focusNode: _passFocusNode,
                              obscureText: _obscureText,
                              keyboardType: TextInputType.visiblePassword,
                              validator: (value){
                                if (value!.isEmpty || value.length < 7) {
                                  return "Lütfen doğru şifreyi yazınız.";
                                } else {
                                  return null;
                                }
                              },
                              style: const TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                suffixIcon: GestureDetector(
                                  onTap: (){
                                    setState(() {
                                      _obscureText = !_obscureText;
                                    });
                                  },
                                  child: Icon(
                                    _obscureText
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                    color: Colors.white,
                                    size: 20,
                                    ),
                                    ),
                                hintText: "Şifre",
                                hintStyle: const TextStyle(color: Colors.white, fontSize: 13),
                                enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                focusedBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: TextButton(
                            onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>const ForgetPasswordScreen()));
                          },
                           child: const Text("Şifremi unuttum.",
                           style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            //decoration: TextDecoration.underline
                           ),
                           ),
                           ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        AuthButton(
                          fct: _submitFormOnLogin,
                        buttonText: "Üye Girişi", 
                  ),
                  const SizedBox(height: 6,),
                  const GoogleButton(),
                  const SizedBox(height: 9,),
                  Row(
                    children: [
                    const Expanded(child: Divider(
                        color: Colors.white, //thickness: 1,
                      ),
                    ),
                    const SizedBox(width: 7,),
                    TextWidget(text: "veya", color: Colors.white, textSize: 13),
                    const SizedBox(width: 7,),
                    const Expanded(child: Divider(
                        color: Colors.white, //thickness: 1,
                      ),
                    ),
                    ],
                  ),
                  const SizedBox(height: 5,),
                  AuthButton(fct: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const ButtomBarScreen()));
                  },
                        buttonText: "Misafir olarak devam et",
                  ),
                  //const SizedBox(height: 15),
                  AuthButton(fct: (){
                    //tekrar kontol et
                  },
                        buttonText: "Üye olmak için tıklayın",
                  ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}