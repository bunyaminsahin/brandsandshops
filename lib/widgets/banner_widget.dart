import 'package:flutter/material.dart';

import '../services/dark_theme_prefs.dart';

class BannerWidget extends StatefulWidget {
  const BannerWidget({
    Key? key,
    this.solRenk,
    required this.sag1Renk,
    required this.sag2Renk,
    required this.yaziBoyutu,
    required this.yazi,
    required this.resimYolu}) : super(key: key);

  final Color? solRenk;
  final Color sag1Renk;
  final Color sag2Renk;
  final double yaziBoyutu;
  final String yazi;
  final String resimYolu;

  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).color;
    final theme = Utils(context).getTheme;
    Size size = Utils(context).getScreenSize;
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            child: Column(
              children: [
                Row(
                  children: [
                    Flexible(
                      flex: 2,
                      child: Stack(
                        alignment: AlignmentDirectional.center,
                        children: [
                          Container(
                            height: size.height*0.20,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(widget.resimYolu)),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(10),

                                //,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Container(
                        height: size.height*0.20,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                          ),
                        ),
                        child: SizedBox(
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [widget.sag1Renk, widget.sag2Renk]),
                            ),
                            child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(widget.yazi, textAlign: TextAlign.center, style: TextStyle(fontSize: widget.yaziBoyutu, color: Colors.white, fontWeight: FontWeight.bold),),
                                  //\n olursa alt satıra atar
                                  ],
                                )
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            )
        ),
      ),
    );
  }
}
