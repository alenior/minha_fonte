class Atendimento {
  int? id;
  int clienteId;
  int quantidade;
  String? observacoes;
  String status;
  String dataCadastro;
  String horaCadastro;

  Atendimento({
    this.id,
    required this.clienteId,
    required this.quantidade,
    this.observacoes,
    this.status = 'Aguardando Atendimento',
    required this.dataCadastro,
    required this.horaCadastro,
  });

  // Conversão para Map para inserção no banco de dados
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'cliente_id': clienteId,
      'quantidade': quantidade,
      'observacoes': observacoes,
      'status': status,
      'data_cadastro': dataCadastro,
      'hora_cadastro': horaCadastro,
    };
  }

  // Construtor de fábrica para criar um objeto Atendimento a partir de um Map
  factory Atendimento.fromMap(Map<String, dynamic> map) {
    return Atendimento(
      id: map['id'],
      clienteId: map['cliente_id'],
      quantidade: map['quantidade'],
      observacoes: map['observacoes'],
      status: map['status'],
      dataCadastro: map['data_cadastro'],
      horaCadastro: map['hora_cadastro'],
    );
  }
}