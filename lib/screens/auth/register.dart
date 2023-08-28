import 'package:brands_and_shops/screens/auth/forget_pass.dart';
import 'package:brands_and_shops/screens/auth/login.dart';
import 'package:brands_and_shops/services/dark_theme_prefs.dart';
import 'package:brands_and_shops/widgets/auth_button.dart';
import 'package:brands_and_shops/widgets/text_widget.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

import '../../consts/contss.dart';

class RegisterScreen extends StatefulWidget {
  static const routeName = "/RegisterScreen";
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();

  final _nameTextController = TextEditingController();
  final _surnameTextController = TextEditingController();
  final _emailTextController = TextEditingController();
  final _passTextController = TextEditingController();
  final _addressTextController = TextEditingController();
  final _passFocusNode = FocusNode();
  final _emailFocusNode = FocusNode();
  final _addressFocusNode = FocusNode();
  var _obscureText = true;
  @override
  void dispose() {
    _nameTextController.dispose();
    _surnameTextController.dispose();
    _emailTextController.dispose();
    _passTextController.dispose();
    _addressTextController.dispose();
    _emailFocusNode.dispose();
    _passFocusNode.dispose();
    _addressFocusNode.dispose();
    super.dispose();
  }

  void _submitFormOnRegister() {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {
      _formKey.currentState!.save();
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Utils(context).getTheme;
    Color color = Utils(context).color;

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Swiper(
              duration: 1200,
              autoplayDelay: 3500,

              itemBuilder: (BuildContext context, int index) {
                return Expanded(
                  child: Image.asset(
                    Constss.authImagesPath[index],
                    fit: BoxFit.fill,
                  ),
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
                  children: <Widget>[
                    const SizedBox(
                      height: 35,),
                    InkWell(
                      //borderRadius: BorderRadius.circular(8),
                      onTap: (){
                        //Navigator.pop(context);
                        Navigator.canPop(context)? Navigator.pop(context) : null;
                      },
                      child: Icon(
                        Icons.arrow_back_ios_sharp,
                        color: theme==true? Colors.black : Colors.white,
                        size: 24,
                      ),
                    ),
                    const SizedBox(
                      height: 40,),
                      TextWidget(text: "Tekrar hoş geldiniz.",color: Colors.white,textSize: 15,),
                      const SizedBox(
                        height: 8,
                      ),
                      TextWidget(
                      text: "Kayıt için, aşağıdaki bilgileri yazın lütfen.",
                      color: Colors.white,
                      textSize: 15,
                      //isTitle: true,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              textInputAction: TextInputAction.next,
                              onEditingComplete: () => 
                              FocusScope.of(context).requestFocus(_emailFocusNode),
                              keyboardType: TextInputType.name,
                              controller: _nameTextController,
                              validator: (value){
                                if (value!.isEmpty) {
                                  return "Lütfen isminizi yazın.";
                                } else {
                                  return null;  
                                }
                              },
                              style: const TextStyle(color: Colors.white),
                              decoration: const InputDecoration(
                                hintText: "İsminiz",
                                hintStyle: TextStyle(color: Colors.white, fontSize: 13),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                //errorBorder: UnderlineInputBorder(),
                              ),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            TextFormField(
                              textInputAction: TextInputAction.next,
                              onEditingComplete: () => 
                              FocusScope.of(context).requestFocus(_emailFocusNode),
                              keyboardType: TextInputType.name,
                              controller: _surnameTextController,
                              validator: (value){
                                if (value!.isEmpty) {
                                  return "Lütfen soyisminizi yazın.";
                                } else {
                                  return null;
                                }
                              },
                              style: const TextStyle(color: Colors.white),
                              decoration: const InputDecoration(
                                hintText: "Soyisminiz",
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
                            TextFormField(
                              focusNode: _emailFocusNode,
                              textInputAction: TextInputAction.next,
                              onEditingComplete: () => FocusScope.of(context)
                              .requestFocus(_passFocusNode),
                              keyboardType: TextInputType.emailAddress,
                              controller: _emailTextController,
                              validator: (value){
                                if (value!.isEmpty || !value.contains("@")) {
                                  return "Lütfen email adresinizi yazın.";
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
                              focusNode: _passFocusNode,
                              obscureText: _obscureText,
                              keyboardType: TextInputType.visiblePassword,
                              controller: _passTextController,
                              validator: (value){
                                if (value!.isEmpty || value.length < 9) {
                                  return "Lütfen doğru şifreyi yazınız.";
                                } else {
                                  return null;
                                }
                              },
                              style: const TextStyle(color: Colors.white),
                              onEditingComplete: () => FocusScope.of(context)
                              .requestFocus(_addressFocusNode),
                              textInputAction: TextInputAction.next,
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
                            const SizedBox(
                              height: 4,
                            ),
                            TextFormField(
                              focusNode: _addressFocusNode,
                              textInputAction: TextInputAction.done,
                              onEditingComplete: () => _submitFormOnRegister(),
                              //keyboardType: TextInputType.name,
                              controller: _addressTextController,
                              validator: (value){
                                if (value!.isEmpty || value.length<10) {
                                  return "Lütfen kargo adresinizi yazın.";
                                } else {
                                  return null;
                                }
                              },
                              style: const TextStyle(color: Colors.white),
                              maxLines: 2,
                              textAlign: TextAlign.start,
                              decoration: const InputDecoration(
                                hintText: "Kargo adresiniz",
                                hintStyle: TextStyle(color: Colors.white, fontSize: 13),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: TextButton(onPressed: (){
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
                          buttonText: "Kayıt ol", 
                          fct: (){
                          //Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
                          //Navigator.pushReplacementNamed(context, LoginScreen.routeName);
                          _submitFormOnRegister();
                        },
                        
                  ),
                  AuthButton(
                    buttonText: "Üyeliğim var",
                    fct: (){
                          Navigator.pushReplacementNamed(context, LoginScreen.routeName);
                          //Navigator.push(context, MaterialPageRoute(builder: (context)=>const ForgetPasswordScreen()));
                        },
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
