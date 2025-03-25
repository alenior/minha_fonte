class Cliente {
  int? id;
  String nome;
  String logradouro;
  String bairro;
  String cidade;
  String telefone1;
  String? telefone2;
  String? observacoes;

  Cliente({
    this.id,
    required this.nome,
    required this.logradouro,
    required this.bairro,
    required this.cidade,
    required this.telefone1,
    this.telefone2,
    this.observacoes,
  });

  // Conversão para Map para inserção no banco de dados
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'logradouro': logradouro,
      'bairro': bairro,
      'cidade': cidade,
      'telefone1': telefone1,
      'telefone2': telefone2,
      'observacoes': observacoes,
    };
  }

  // Construtor de fábrica para criar um objeto Cliente a partir de um Map
  factory Cliente.fromMap(Map<String, dynamic> map) {
    return Cliente(
      id: map['id'],
      nome: map['nome'],
      logradouro: map['logradouro'],
      bairro: map['bairro'],
      cidade: map['cidade'],
      telefone1: map['telefone1'],
      telefone2: map['telefone2'],
      observacoes: map['observacoes'],
    );
  }
}