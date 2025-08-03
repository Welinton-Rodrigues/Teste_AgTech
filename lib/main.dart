import 'package:teste_vaga_agtech/home_screen.dart';

import 'user_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
 import 'package:flutter/material.dart';
 
 Future<void> main() async {

// força a iniciação do flutter
WidgetsFlutterBinding.ensureInitialized();

await Hive.initFlutter();


Hive.registerAdapter(UserAdapter());


await Hive.openBox('userBox');

runApp(const MyApp());

 }
 
 class MyApp extends StatelessWidget {
   const MyApp({super.key});
 
   @override
   Widget build(BuildContext context) {
     return MaterialApp(
      title: 'CRUD vaga AgTech com HIVE BD',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
      useMaterial3: false),
      home: HomeScreen()// const removido
     );

     
   }
 }