import 'package:ecommerceapp/core/helper/constants.dart';
import 'package:ecommerceapp/core/networking/cache.dart';
import 'package:ecommerceapp/core/routing/app_router.dart';
import 'package:ecommerceapp/features/home/data/models/categories_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'features/home/data/models/banners_model.dart';
import 'store.dart';

void main() async{
   await Hive.initFlutter();
   WidgetsFlutterBinding.ensureInitialized();
   await CacheNetwork.cacheInitialization();
  token= await CacheNetwork.getCacheData(key: 'token');
   debugPrint('token is :$token');
// await Hive.openBox(kBox) ;
 Hive.registerAdapter(BannersModelAdapter());
 Hive.registerAdapter(CategoriesModelAdapter());

  runApp(Store(
    appRouter: AppRouter(),
  ));
}
