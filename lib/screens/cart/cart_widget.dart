import 'package:brands_and_shops/inner_screens/product_details.dart';
import 'package:brands_and_shops/services/global_methods.dart';
import 'package:brands_and_shops/widgets/text_widget.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../services/dark_theme_prefs.dart';

class CartWidget extends StatefulWidget {
  const CartWidget({Key? key}) : super(key: key);

  @override
  State<CartWidget> createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> {
  final _quantityTextController = TextEditingController();
  @override
  void initState() {
    _quantityTextController.text = "1";
    super.initState();
  }
  @override
  void dispose() {
    _quantityTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).color;
    final theme = Utils(context).getTheme;
    Size size = Utils(context).getScreenSize;
    return SafeArea(
      child: GestureDetector(
        onTap: (){
          GlobalMethods.navigateTo(
              ctx: context, routeName: ProductDetails.routeName);
        },
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        height: size.width*0.25,
                        width: size.width*0.25,
                        child: FancyShimmerImage(
                          imageUrl: "https://i.imgur.com/T3pbXjt.jpg",
                          boxFit: BoxFit.fill,
                        ),
                      ),
                      const Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextWidget(
                            text: "Ürün",
                            color: color,
                            textSize: 18,
                            isTitle: true,),
                          const SizedBox(height: 7,),
                          SizedBox(
                            width: size.width*0.3,
                            child: Row(
                              children: [
                                _quantityController(
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
                                  color: Colors.cyan,
                                  icon: CupertinoIcons.minus,
                                ),
                                Flexible(
                                  flex: 1,
                                  child: TextField(controller: _quantityTextController, keyboardType: TextInputType.number, maxLines: 1,
                                  decoration: const InputDecoration(
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide()
                                      )
                                  ),
                                    inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[0-9]"))],
                                    onChanged: (v){
                                      setState(() {
                                        if(v.isEmpty){
                                          _quantityTextController.text="1";
                                        } else {
                                          return;
                                        }
                                      });
                                    },
                                  ),
                                ),
                                  _quantityController(
                                    fct: (){
                                      setState(() {
                                        _quantityTextController.text = (
                                            int.parse(_quantityTextController.text) +1).toString();
                                      });
                                    },
                                    color: Colors.cyan,
                                    icon: CupertinoIcons.plus
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Column(
                          //crossAxisAlignment: CrossAxisAlignment.center,
                          //mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                          //mainAxisSize: MainAxisSize.min,
                          // crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: (){},
                            child: const Icon(CupertinoIcons.trash, size: 22,),
                          ),
                          IconButton(
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
                            onPressed: (){},
                              icon: const Icon(Icons.favorite_border_outlined,
                                  size: 22),
                          ),
                          TextWidget(
                            text: "200 \u{20BA}",
                            color: color,
                            textSize: 18,
                            maxLines: 1,
                            isTitle: true,),
                        ]
                      ),
                      const SizedBox(width: 5),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ));
  }

  Widget _quantityController ({
    required Function fct,
    required IconData icon,
    required Color color}) {
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
                size: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
