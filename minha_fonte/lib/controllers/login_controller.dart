import 'package:minha_fonte/services/database_service.dart';

class LoginController {
  Future<bool> login(String usuario, String senha) async {
    final db = DatabaseService.database;
    
    // Consulta para verificar usuário e senha
    final List<Map<String, dynamic>> result = await db.query(
      'usuarios',
      where: 'usuario = ? AND senha = ?',
      whereArgs: [usuario, senha],
    );
    
    // Retorna true se encontrou um usuário, false caso contrário
    return result.isNotEmpty;
  }
}