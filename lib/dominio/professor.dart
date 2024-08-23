import 'package:flutter_application_1/dominio/cpf.dart';
import 'package:flutter_application_1/dominio/dto/dto_professor.dart';
import 'package:flutter_application_1/dominio/interface/i_dao_professor.dart';

class Professor {
  late dynamic? id;
  late String nome;
  late String? descricao;
  late String cpf;
  late String _status;
  String get status => _status;
  set status(String status) {
    if (status != 'A' || status != 'I')
      throw Exception('Status deve ser "A" ou "I".');
    _status = status;
  }

  //Inversão de dependencia, não usamos Interface que apenas funcione no sql ou em qualquer outra biblioteca, usamos apenas os dados que precisamos.
  late IDAOProfessor dao;

  //Para manipulação de dados facilitada, criamos um dto com os campos do Professor, onde podemos carregar os dados do professor nele.
  late DTOProfessor dto;

  Professor({required this.dto, required this.dao}) {
    id = dto.id;
    nome = dto.nome;
    descricao = dto.descricao;
    cpf = dto.cpf;
    _status = dto.status;
    CPF(cpf);
  }

  DTOProfessor salvar(DTOProfessor dto) {
    eNomeNaoVazio();
    return dao.salvar(dto);
  }

  eNomeNaoVazio() {
    if (nome.isEmpty) throw Exception('Nome não pode ser vazio');
  }
}
