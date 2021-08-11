library my_prj.globals;

import 'dart:convert';

List<String> criancas = ['', '', '', ''];
List<bool> criancasValue = [false, false, false, false];
int iterador = 0;
List diff = [
  criancasContagemDificuldade,
  criancasCorDificuldade,
  criancasFormaDificuldade,
  criancasDiaDificuldade
];
List<String> criancasContagemDificuldade = ['Easy', 'Easy', 'Easy', 'Easy'];
List<String> criancasCorDificuldade = ['Easy', 'Easy', 'Easy', 'Easy'];
List<String> criancasFormaDificuldade = ['Easy', 'Easy', 'Easy', 'Easy'];
List<String> criancasDiaDificuldade = ['Easy', 'Easy', 'Easy', 'Easy'];
Map<String, bool> listaEx1 = {
  'Contagem': true,
  'Cor': true,
  'Forma': true,
  'Dia': true
};
Map<String, bool> listaEx2 = {
  'Contagem': false,
  'Cor': false,
  'Forma': false,
  'Dia': false
};
Map<String, bool> listaEx3 = {
  'Contagem': false,
  'Cor': false,
  'Forma': false,
  'Dia': false
};
Map<String, bool> listaEx4 = {
  'Contagem': false,
  'Cor': false,
  'Forma': false,
  'Dia': false
};
List exs = [listaEx1, listaEx2, listaEx3, listaEx4];
List exsim = [simEx1, simEx2, simEx3, simEx4];
List jex = [jex1, jex2, jex3, jex4];
var jex1 = {"atividade": "contagem", "dificuldade": "easy"};
var jex2 = {"atividade": "cor", "dificuldade": "easy"};
var jex3 = {"atividade": "forma", "dificuldade": "easy"};
var jex4 = {"atividade": "dia", "dificuldade": "easy"};
List<History> historyList = [];

class History {
  String nome;
  String ex;
  String dificulty;
  double nota;
  DateTime dateTime;

  History({this.nome, this.ex, this.dificulty, this.nota, this.dateTime});
}

int iteradorex = 0;
Map<String, double> simEx1 = {'Contagem': 0, 'Cor': 0, 'Forma': 0, 'Dia': 0};
Map<String, double> simEx2 = {'Contagem': 0, 'Cor': 0, 'Forma': 0, 'Dia': 0};
Map<String, double> simEx3 = {'Contagem': 0, 'Cor': 0, 'Forma': 0, 'Dia': 0};
Map<String, double> simEx4 = {'Contagem': 0, 'Cor': 0, 'Forma': 0, 'Dia': 0};
