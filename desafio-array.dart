import 'dart:io';

void main(List<String> args) {
  const int escolhaSair = 5;
  final pacientes = [
    'Rodrigo Rahman|35|Desenvolvedor|SP',
    'Manoel Silva|12|Estudante|AL',
    'Joaquim Rahman|18|Estudante|SP',
    'Fernando Verne|35|Estudante|PE',
    'Gustavo Silva|40|Desenvolvedor|CE',
    'Sandra Silva|40|Desenvolvedor|MG',
    'Regina Verne|35|Dentista|MG',
    'João Rahman|55|Jornalista|RJ',
    'Lucas Caetano|19|Estudante|SP',
    'Vinicius Rodrigues|20|Estudante|SP',
    "Kaua Vieira|21|Suporte|SP"
  ];

  int escolha = -1;

  while (escolha != escolhaSair) {
    print(
        "Escolha o numero da opção desejada:\n1-Ver dados dos pacientes\n2-Ver dados dos membros do grupo.\n3-Cadastrar paciente\n4-Excluir paciente\n${escolhaSair}-Sair");
    var input = stdin.readLineSync();
    if (input != null) {
      escolha = int.parse(input);
      switch (escolha) {
        case 1:
          dadosLista(pacientes);
          break;
        case 2:
          dadosGrupo(pacientes);
          break;
        case 3:
          cadastraPaciente(pacientes);
          break;
        case 4:
          excluiPaciente(pacientes);
          break;
        case escolhaSair:
          print("Saindo do sistema.");
          break;
        default:
          print("Insira um valor válido");
      }
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
  print("----------------------//-------------------");
  // print do numero de pacientes na lista de pacientes
  print("Numero de pacientes na lista: ${pacientes.length}\n");
  print("Pacientes com mais de 20 anos: ${maiores.join(', ')}\n");
  print("Numero de pacientes por profissão: ${pacienteProfissao}\n");
  print("Numero de pacientes que moram em SP: ${pacienteEstado['SP']}\n");
  print("----------------------//-------------------");
  print("PRESSIONE ENTER PARA VOLTAR AO MENU!");
  stdin.readLineSync();
}

void dadosGrupo(List<String> pacientes) {
  List<String> membrosGrupo = [
    "Lucas Caetano",
    "Vinicius Rodrigues",
    "Kaua Vieira"
  ];
  print("----------------------//-------------------");
  print("Membros do grupo:");
  for (String paciente in pacientes) {
    String nomePaciente = paciente.split("|")[0];
    if (membrosGrupo.contains(nomePaciente)) {
      print(paciente);
    }
  }

  print("----------------------//-------------------\n");
  print("PRESSIONE ENTER PARA VOLTAR AO MENU!");
  stdin.readLineSync();
}

List<String> cadastraPaciente(List<String> pacientes) {
  print("\nInforme o nome do paciente: ");
  var nome = stdin.readLineSync();
  nome = nome == "" ? "Sem Nome" : nome;

  print("\nInforme a idade do paciente: ");
  var idade = stdin.readLineSync();
  idade = idade == "" ? "0" : idade;

  print("\nInforme a profissão do paciente: ");
  var profissao = stdin.readLineSync();
  profissao = profissao == "" ? "Sem Profissão" : profissao;

  print("\nInforme a UF do paciente: ");
  var UF = stdin.readLineSync();
  UF = UF == "" ? "Sem UF" : UF;

  pacientes.add("${nome}|${idade}|${profissao}|${UF}");

  return pacientes;
}

// função para exclusão de paciente
List<String> excluiPaciente(List<String> pacientes) {
  print("Informe o nome do paciente que deseja excluir: ");
  var nome = stdin.readLineSync();
  nome = nome == "" ? "Sem Nome" : nome;

  pacientes.removeWhere(
      (paciente) => paciente.toLowerCase().contains(nome!.toLowerCase()));

  return pacientes;
}

// 