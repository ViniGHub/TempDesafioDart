import 'dart:io';

void main(List<String> args) {
  final pacientes = [
    'Rodrigo Rahman|35|Desenvolvedor|SP',
    'Manoel Silva|12|Estudante|AL',
    'Joaquim Rahman|18|Estudante|SP',
    'Fernando Verne|35|Estudante|PE',
    'Gustavo Silva|40|Desenvolvedor|CE',
    'Sandra Silva|40|Desenvolvedor|MG',
    'Regina Verne|35|Dentista|MG',
    'João Rahman|55|Jornalista|RJ'
  ];

  int escolha = -1;

  while (escolha != 3) {
    print("Escolha o numero da opção desejada:\n1-Ver dados dos pacientes\n2-Cadastrar paciente\n3-Sair");
    var escolha = int.parse(stdin.readLineSync()!);

    switch (escolha) {
        case 1:
            dadosLista(pacientes);
            break;
        case 2:
            var nome = stdin.readLineSync() ?? -1;
            var idade = stdin.readLineSync() ?? -1;
            var profissao = stdin.readLineSync() ?? -1;
            var UF = stdin.readLineSync() ?? -1;

            break;
        default:
            print("Insira um valor válido");
    }
  }
}

void dadosLista(List<String> pacientes) {
  List<String> maiores = [];
  Map<String, int> pacienteProfissao = {};
  Map<String, int> pacienteEstado = {};

  for (var paciente in pacientes) {
    // Separa os dados do paciente em um array
    var dadosPaciente = paciente.split('|');
    int idadePaciente = int.parse(dadosPaciente[1]);

    // Adiciona ao array maiores o nome dos pacientes que são maiores que 20 anos
    if (idadePaciente > 20) {
      maiores.add(dadosPaciente[0]);
    }

    // Faz a contagem de pacientes por profissão
    pacienteProfissao[dadosPaciente[2]] == null
        ? pacienteProfissao[dadosPaciente[2]] = 1
        : pacienteProfissao[dadosPaciente[2]] =
            (pacienteProfissao[dadosPaciente[2]]! + 1);

    pacienteEstado[dadosPaciente[3]] == null
        ? pacienteEstado[dadosPaciente[3]] = 1
        : pacienteEstado[dadosPaciente[3]] =
            (pacienteEstado[dadosPaciente[3]]! + 1);
  }

  print("Pacientes com mais de 20 anos: ${maiores.join(', ')}\n");
  print("Numero de pacientes por profissão: ${pacienteProfissao}\n");
  print("Numero de pacientes que moram em SP: ${pacienteEstado['SP']}\n");
}
