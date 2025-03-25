import 'package:flutter/material.dart';
import 'package:minha_fonte/views/login_page.dart';
import 'package:minha_fonte/views/home_page.dart';

class Routes {
  // Constantes de rotas nomeadas
  static const String login = '/login';
  static const String home = '/home';

  // Método para obter todas as rotas
  static Map<String, WidgetBuilder> getRoutes() {
    return {
      login: (context) => LoginPage(),
      home: (context) => HomePage(),
    };
  }
}