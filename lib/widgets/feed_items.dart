import 'package:brands_and_shops/inner_screens/product_details.dart';
import 'package:brands_and_shops/services/dark_theme_prefs.dart';
import 'package:brands_and_shops/services/global_methods.dart';
import 'package:brands_and_shops/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class FeedsWidget extends StatefulWidget {
  const FeedsWidget({Key? key}) : super(key: key);

  @override
  State<FeedsWidget> createState() => _FeedsWidgetState();
}

class _FeedsWidgetState extends State<FeedsWidget> {
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
    return Material(
      color: Theme.of(context).cardColor.withOpacity(0.1),
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: (){
          GlobalMethods.navigateTo(
              ctx: context, routeName: ProductDetails.routeName);
        },
        child: Stack(
          children: [
            Positioned(
              child: Card(
                shape: const RoundedRectangleBorder(
                  side: BorderSide(color: Colors.cyan, width: 1),
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                child: SizedBox(
                  height: size.height*0.5,
                  width: size.width*0.5,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(3, 3, 3, 2),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: size.height*0.27,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(6.0),
                            child: const Image(
            //FancyShimmerImage(imageUrl: "https://i.imgur.com/T3pbXjt.jpg",boxFit: BoxFit.fill),
            image: AssetImage("assets/images/otherImages/T3pbXjt.jpg"),
            //width: size.width,
            fit: BoxFit.fill,
            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            //const Spacer(),
                            TextWidget(text: "400 \u{20BA}", color: color, textSize: 18, isTitle: true,),
                            //const Spacer(),
                            //Flexible(child: TextFormField(controller: _quantityTextController, key: const ValueKey("10"), style: TextStyle(color: color,fontSize: 18), keyboardType: TextInputType.number, maxLines: 1, enabled: true, inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[0-9.]"))],)),
                            //const Spacer(),
                          ],
                        ),
                        //const SizedBox(height: 1),
                        TextWidget(text: "Eko Hoparlör", color: color, textSize: 15, isTitle: true,),
                        //const SizedBox(height: 1),
                        Container(
                          height: size.height*0.05 ,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.cyan, width: 1.7,),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                          ),
                          child: TextButton(
                            onPressed: (){
                              print("Sepete eklendi");
                            },
                            child: TextWidget(
                              text: "Sepete Ekle",
                              color: color,
                              textSize: 15,
                              isTitle: true,
                              maxLines: 1,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 10,
              right: 8,
              child: Container(
                alignment: Alignment.center,
                height: 30,
                width: 30,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle
                ),
                child: IconButton(
                    onPressed: (){},
                    icon: const Icon(
                        Icons.favorite_border_outlined, color: Colors.cyan,)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// GridView.count(
// shrinkWrap: true,
// physics: const NeverScrollableScrollPhysics(),
// crossAxisCount: 2,
// //crossAxisSpacing: 10,
// //childAspectRatio: size.width / (size.height*0.50),
// children: List.generate(2, (index) {
// return const FeedsWidget();
// }),
// ),
