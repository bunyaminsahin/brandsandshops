import 'package:brands_and_shops/consts/theme_data.dart';
import 'package:brands_and_shops/inner_screens/on_sale_screen2.dart';
import 'package:brands_and_shops/provider/dark_theme_provider.dart';
import 'package:brands_and_shops/screens/auth/forget_pass.dart';
import 'package:brands_and_shops/screens/auth/login.dart';
import 'package:brands_and_shops/screens/auth/register.dart';
import 'package:brands_and_shops/screens/orders/orders_screen.dart';
import 'package:brands_and_shops/screens/viewed_recently/viewed_recently.dart';
import 'package:brands_and_shops/screens/wishlist/wishlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'inner_screens/product_details.dart';

void main() {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  void getCurrentTheme () async {
    themeChangeProvider.setDarkTheme =
    await themeChangeProvider.darkThemePrefs.getTheme();
  }

  @override
  void initState() {
    getCurrentTheme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_){
          return themeChangeProvider;
        })
      ],
      child: Consumer<DarkThemeProvider>(builder: (context, themeProvider, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Eko Elektronik',
            theme: Styles.themeData(themeProvider.getDarkTheme, context),
            home: const LoginScreen(),
            routes: {
              OnSaleScreen2.routeName : (ctx) => const OnSaleScreen2(),
              ProductDetails.routeName : (ctx) => const ProductDetails(),
              WishlistScreen.routeName : (ctx) => const WishlistScreen(),
              OrderScreen.routeName : (ctx) => const OrderScreen(),
              ViewedRecently.routeName: (ctx) => const ViewedRecently(),
              RegisterScreen.routeName: (ctx) => const RegisterScreen(),
              LoginScreen.routeName: (ctx) => const LoginScreen(),
              ForgetPasswordScreen.routeName: (ctx) => const ForgetPasswordScreen(),

            });
        }
      ),
    );
  }
}