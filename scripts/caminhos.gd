extends Node

var arrayCatracasFuncionais: Array[bool] = [false, false, false, false, false, false]
var arrayPassandoCatracas: Array[bool] = [false, false, false, false, false, false]

# PASSANDO NA CATRACA E CRIANDO FILA
var passandoCatraca: bool = false
var ativarFilaEntrada: bool = false

###################CENA_TESTE############################
var tempoMaximoCenaUmRodadaUm: int = 10

# Pontos da cena de testes
var arrayCaminhosEntradaTelaTest = [Vector3(5.876, 1.186, 1.154), Vector3(-2.419, 0.395, -0.564), Vector3(-5.965, 1.186, -1.076)]

# Filas
var arrayOcupaPosicoesFilaEntrada: Array[bool] = [false, false, false, false, false, false, false, false, false, false]
var arrayPosicaoFilaEntradaTelaTeste = [Vector3(-0.783, 0.425, -1.628), Vector3(-0.325, 0.425, -1.628), Vector3(0.098, 0.425, -1.628),
	Vector3(0.485, 0.425, -1.628), Vector3(0.945, 0.425, -1.628), Vector3(1.395, 0.425, -1.628), Vector3(1.816, 0.425, -1.628),
	Vector3(2.214, 0.425, -1.628), Vector3(2.635, 0.425, -1.628), Vector3(3.092, 0.425, -1.628)]
