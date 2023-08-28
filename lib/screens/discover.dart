import 'package:flutter/material.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text("Ekrem Abi ve Eren'den, fırsatlara ait", style: TextStyle(fontSize: 18),),
            Text("bilgiler alınıp, eklenecek.", style: TextStyle(fontSize: 18),),
            Text("Keşfet ile fırsatlar sayfası olacak.", style: TextStyle(fontSize: 18),),
          ],
        )
      ),
    );
  }
}