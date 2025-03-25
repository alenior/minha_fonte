import 'dart:io' show Platform;
import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class DatabaseService {
  static Database? _database;
  
  static Future<void> initialize() async {
    if (_database != null) return;
    
    // Configuração multiplataforma para banco de dados
    if (kIsWeb) {
      // Configuração para web
      sqfliteFfiInit();
      databaseFactory = databaseFactoryFfi;
    } else if (!kIsWeb && (Platform.isWindows || Platform.isLinux || Platform.isMacOS)) {
      // Configuração para desktop
      sqfliteFfiInit();
      databaseFactory = databaseFactoryFfi;
    }
    
    // Caminho do banco de dados
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, 'minha_fonte.db');
    
    // Abre o banco de dados
    _database = await openDatabase(
      path,
      onCreate: _createTables,
      version: 1,
    );
  }
  
  static Future<void> _createTables(Database db, int version) async {
    // Cria tabelas
    await db.execute(
      'CREATE TABLE usuarios(id INTEGER PRIMARY KEY, usuario TEXT, senha TEXT)',
    );
    
    await db.execute(
      'CREATE TABLE clientes(id INTEGER PRIMARY KEY, nome TEXT, logradouro TEXT, bairro TEXT, cidade TEXT, telefone1 TEXT, telefone2 TEXT, observacoes TEXT)',
    );
    
    await db.execute(
      'CREATE TABLE atendimentos(id INTEGER PRIMARY KEY, cliente_id INTEGER, quantidade INTEGER, observacoes TEXT, status TEXT, data_cadastro TEXT, hora_cadastro TEXT, FOREIGN KEY(cliente_id) REFERENCES clientes(id))',
    );
    
    // Inserir usuário admin padrão
    await db.insert('usuarios', {
      'usuario': 'admin',
      'senha': 'admin'
    });
  }
  
  static Database get database {
    if (_database == null) {
      throw Exception('Banco de dados não inicializado');
    }
    return _database!;
  }
}