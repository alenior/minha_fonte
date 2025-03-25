import 'package:flutter/material.dart';
import 'package:minha_fonte/core/routes.dart';
import 'package:minha_fonte/core/theme.dart';
import 'package:minha_fonte/views/login_page.dart';
import 'package:minha_fonte/services/database_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Inicializa o serviço de banco de dados
  await DatabaseService.initialize();
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Minha Fonte',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      initialRoute: Routes.login,
      routes: Routes.getRoutes(),
      home: LoginPage(),
    );
  }
}