extends Node

var catracaUmUsando: bool
var catracaDoisUsando: bool
var catracaTresUsando: bool
var catracaQuatroUsando: bool

# ATIVAR FILA
var ativarFilaEntrada: bool = false

###################CENA_TESTE############################
var tempoMaximoCenaUmRodadaUm: int = 10

# Pontos da cena de testes
var arrayCaminhosEntradaTelaTest = [Vector3(5.876, 1.186, 1.154), Vector3(-1.432, 1.186, -1.005), Vector3(-5.965, 1.186, -1.076)]

# Filas
var arrayocupaPosicoesFilaEntrada: Array[bool] = [false, false, false, false, false, false, false, false, false, false]

var posicaoFilaEntrada1: Vector3 = Vector3(-1.628, 1.186, -1.548)
var posicaoFilaEntrada2: Vector3 = Vector3(-1.628, 1.186, -1.548)
var posicaoFilaEntrada3: Vector3 = Vector3(-1.628, 1.186, -1.548)
var posicaoFilaEntrada4: Vector3 = Vector3(-1.628, 1.186, -1.548)
var posicaoFilaEntrada5: Vector3 = Vector3(-1.628, 1.186, -1.548)
