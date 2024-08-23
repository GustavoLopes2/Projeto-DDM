class DTOProfessor {
  late dynamic? id;
  late String nome;
  late String? descricao;
  late String cpf;
  late String status = 'A';

  DTOProfessor(
      {this.id,
      required this.nome,
      this.descricao,
      required this.cpf,
      required this.status});
}
