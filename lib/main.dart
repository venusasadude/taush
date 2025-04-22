import 'package:taush/controller/provier/address_provider.dart';
import 'package:taush/controller/provier/deal_of_the_day_provider/deal_of_the_provider.dart';
import 'package:taush/controller/provier/rating_provider/rating_provider.dart';
import 'package:taush/controller/provier/product_provider/product_provider.dart';
import 'package:taush/controller/provier/users_product_provider/users_product_provider.dart';
import 'package:taush/utils/theme.dart';
import 'package:taush/view/auth_screen/signInLogic.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'controller/provier/auth_provider/auth_provider.dart';
import 'controller/provier/product_by_category_provider/product_by_category_provider.dart';
import 'firebase_options.dart';
import 'theme_fallback.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const taush());
}

class taush extends StatelessWidget {
  const taush({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(create: (_) => AuthProvider()),
        ChangeNotifierProvider<AddressProvider>(
            create: (_) => AddressProvider()),
        ChangeNotifierProvider<SellerProductProvider>(
            create: (_) => SellerProductProvider()),
        ChangeNotifierProvider<UsersProductProvider>(
            create: (_) => UsersProductProvider()),
        ChangeNotifierProvider<DealOfTheDayProvider>(
            create: (_) => DealOfTheDayProvider()),
        ChangeNotifierProvider<ProductsBasedOnCategoryProvider>(
            create: (_) => ProductsBasedOnCategoryProvider()),
        ChangeNotifierProvider<RatingProvider>(create: (_) => RatingProvider()),
      ],
      child: MaterialApp(
        theme: theme,
        home: const SignInLogic(),
        // home: UserBottomNavBar(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
