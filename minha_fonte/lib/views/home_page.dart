import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Minha Fonte'),
      ),
      body: Center(
        child: Text('Bem-vindo ao Sistema'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menu Principal',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text('Cadastros'),
              onTap: () {
                // Implementar navegação para tela de cadastros
              },
            ),
            ListTile(
              title: Text('Financeiro'),
              onTap: () {
                // Implementar navegação para tela financeira
              },
            ),
            ListTile(
              title: Text('Almoxarifado'),
              onTap: () {
                // Implementar navegação para tela de almoxarifado
              },
            ),
            ListTile(
              title: Text('Relatórios'),
              onTap: () {
                // Implementar navegação para tela de relatórios
              },
            ),
          ],
        ),
      ),
    );
  }
}