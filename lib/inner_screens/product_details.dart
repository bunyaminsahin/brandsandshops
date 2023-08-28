import 'package:brands_and_shops/widgets/back_widget.dart';
import 'package:brands_and_shops/widgets/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../services/dark_theme_prefs.dart';

class ProductDetails extends StatefulWidget {
  static const routeName = "/ProductDetails";

  const ProductDetails({Key? key}) : super(key: key);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  final _quantityTextController = TextEditingController(text: "1");

  @override
  void dispose() {
    _quantityTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final Color color = Utils(context).color;
    Size size = Utils(context).getScreenSize;

    return Scaffold(
      appBar: AppBar(
        leading: BackWidget(color: color,),
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: Column(children: [
     Flexible(
        flex: 2,
          child: Image(
            //FancyShimmerImage(imageUrl: "https://i.imgur.com/T3pbXjt.jpg",boxFit: BoxFit.scaleDown,width: size.width,),
            image: const AssetImage("assets/images/otherImages/T3pbXjt.jpg"),
            width: size.width,
            fit: BoxFit.scaleDown,
            ),
      ),
        Flexible(
          flex: 3,
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                          child: TextWidget(
                              text: "Ürün",
                              color: color,
                              textSize: 18,
                              isTitle: true),
                      ),
                      IconButton(onPressed: (){},
                        icon: const Icon(Icons.favorite_border_outlined),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextWidget(
                          text: "400\u{20BA}",
                          color: color,
                          textSize: 18,
                      isTitle: true,),
                      const SizedBox(
                        width: 5,
                      ),
                      //TextWidget(text: "Bir tane", color: color, textSize: 12, isTitle: true,),
                      const SizedBox(
                        width: 5,
                      ),
                      Visibility(
                        visible: true,
                          child: Text("650TL",
                          style: TextStyle(
                            fontSize: 15,
                            color: color,
                            decoration: TextDecoration.lineThrough,
                          ),
                          ),
                      ),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 4, horizontal: 8,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.cyan,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: TextWidget(
                          text: "Kargo Ücretsiz",
                          color: color,
                          textSize: 15,
                          //isTitle: true,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    quantityController(
                        fct: (){
                          if(_quantityTextController.text == "1"){
                            return;
                          } else {
                            setState(() {
                              _quantityTextController.text = (
                                  int.parse(_quantityTextController.text) -1).toString();
                            });
                          }
                        },
                        icon: CupertinoIcons.minus_square,
                        color: Colors.cyan,
                    ),
                    Flexible(
                      flex: 1,
                        child: TextField(
                          controller: _quantityTextController,
                          key: const ValueKey("quantity"),
                          keyboardType: TextInputType.number,
                          maxLines: 1,
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(
                            ),
                          ),
                          textAlign: TextAlign.center,
                          cursorColor: Colors.green,
                          enabled: true,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp("[0-9]")),
                          ],
                          onChanged: (value){
                            setState(() {
                              if (value.isEmpty){
                                _quantityTextController.text= "1";
                              } else {
                              }
                            });
                          },
                        ),
                    ),
                    quantityController(
                        fct: (){
                          setState(() {
                            _quantityTextController.text = (
                                int.parse(_quantityTextController.text) +1).toString();
                          });
                        },
                        icon: CupertinoIcons.plus_square,
                        color: Colors.cyan
                    ),
                  ],
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Container(
                    width: double.infinity,//size.width,
                    padding: const EdgeInsets.symmetric(
                      vertical: 15, horizontal: 30
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.cyan, width: 1.7,),
                      color: Theme.of(context).colorScheme.secondary, //colorScheme.secondary,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextWidget(
                                  text: "Toplam",
                                  color: Colors.black,
                                  textSize: 18,
                                  isTitle: true,
                                ),
                                const SizedBox(
                                  height: 3,
                                ),
                                FittedBox(
                                  child: Row(
                                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    //crossAxisAlignment: CrossAxisAlignment.baseline,
                                    children: [
                                      TextWidget(
                                        text: "400\u{20BA}",
                                        color: Colors.black,
                                        textSize: 18,
                                        isTitle: true,
                                      ),
                                      TextWidget(
                                          text: ' / ${_quantityTextController.text} adet',
                                          color: color,
                                          textSize: 15,
                                      ),
                                      //const Spacer(),
                                      //const SizedBox(width: 20,),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        Flexible(
                          child: Material(
                            color: Colors.cyan,
                            borderRadius: BorderRadius.circular(8),
                            child: InkWell(
                              onTap: (){},
                              borderRadius: BorderRadius.circular(8),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextWidget(
                                  text: "Sepete Ekle",
                                  color: color,
                                  textSize: 18,
                                  isTitle: true,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],),
    );
  }
  Widget quantityController ({
    required Function fct,
    required IconData icon,
    required Color color,
})
  {
    return Flexible(
      flex:2,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Material(
          color: color,
          borderRadius: BorderRadius.circular(8),
          child: InkWell(
            borderRadius: BorderRadius.circular(8),
            onTap: (){fct();},
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child:  Icon(
                icon,
                color: Colors.white,
                size: 22,
              ),
            ),
          ),
        ),
      ), //CupertinoIcons.plus_square,
    );
  }
}


