import 'package:brands_and_shops/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class GoogleButton extends StatelessWidget {
  const GoogleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return  ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(4)),
      child: Material(
        color: Colors.white38,
        child: InkWell(
          onTap: (){},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset("assets/images/otherImages/googlev3.png",
              width: 38,
              ),
              const SizedBox(width: 25,),
              TextWidget(
                text: "Google hesabınızla giriş yapın.", 
                color: Colors.white, 
                textSize: 15,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
