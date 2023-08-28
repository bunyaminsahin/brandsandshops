import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GlobalMethods {
  static navigateTo({required BuildContext ctx, required String routeName}){
    Navigator.pushNamed(ctx, routeName);
  }

  static Future<void> warningDialog(
  {
    required Icon icon,
    required String title,
    required String subtitle,
    required Function fct,
    required BuildContext context,
}
      ) async {
    await showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            title: Row(
              children: [
                icon,
                //Image.asset("assets/images/log-out.png", height: 40, width: 40, fit: BoxFit.fill,),
                Text(title),
              ],
            ),
            content: Text(subtitle),
            actions: [
              TextButton(
                onPressed: (){fct();},
                child: const Text(
                  "Evet", style:
                TextStyle(fontSize: 15),
                ),
              ),
              TextButton(
                onPressed: (){
                  if(Navigator.canPop(context)){
                    Navigator.pop(context);
                  }
                },
                child: const Text(
                  "Hayır",
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ],
          );
        }
    );
  }
}
