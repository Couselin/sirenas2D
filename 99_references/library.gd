extends Node2D

const id_noreste:int = 0
const id_este:int = 1
const id_sudeste:int = 2
const id_suroeste:int = 3
const id_oeste:int = 4
const id_noroeste:int = 5

const id_direcciones = [id_noreste, id_este, id_sudeste, id_suroeste, id_oeste, id_noroeste]

const dir_noreste:Vector3 = Vector3(-1,1,0)
const dir_este:Vector3 = Vector3(0,1,-1)
const dir_sudeste:Vector3 = Vector3(1,0,-1)
const dir_suroeste:Vector3 = Vector3(1,-1,0)
const dir_oeste:Vector3 = Vector3(0,-1,1)
const dir_noroeste:Vector3 = Vector3(-1,0,1)

const dir_direcciones = [dir_noreste, dir_este, dir_sudeste, dir_suroeste, dir_oeste, dir_noroeste]

const id_diagonal_norte:int = 0
const id_diagonal_noreste:int = 1
const id_diagonal_sudeste:int = 2
const id_diagonal_sur:int = 3
const id_diagonal_suroeste:int = 4
const id_diagonal_noroeste:int = 5

const id_diagonal_direcciones = [id_diagonal_norte, id_diagonal_noreste, id_diagonal_sudeste, id_diagonal_sur, id_diagonal_suroeste, id_diagonal_noroeste]

const dir_diagonal_norte:Vector3 = Vector3(-2,1,1)
const dir_diagonal_noreste:Vector3 = Vector3(-1,2,-1)
const dir_diagonal_sudeste:Vector3 = Vector3(1,1,-2)
const dir_diagonal_sur:Vector3 = Vector3(2,-1,-1)
const dir_diagonal_suroeste:Vector3 = Vector3(1,-2,1)
const dir_diagonal_noroeste:Vector3 = Vector3(-1,-1,2)

const dir_diagonal_direcciones = [dir_diagonal_norte, dir_diagonal_noreste, dir_diagonal_sudeste, dir_diagonal_sur, dir_diagonal_suroeste, dir_diagonal_noroeste]

func check_vector(vector:Vector3):
	if(vector.x + vector.y + vector.z == 0):
		return true
	else:
		return false

func casillas_contiguas(casilla:Vector3):
	var casillas: Array[Vector3]
	casillas.resize(id_direcciones.size())
	for i in range(casillas.size()):
		casillas[i] = casilla + dir_direcciones[i]
	return casillas

func casillas_diagonales(casilla:Vector3):
	var casillas: Array[Vector3]
	casillas.resize(id_diagonal_direcciones.size())
	for i in range(casillas.size()):
		casillas[i] = casilla + dir_diagonal_direcciones[i]
	return casillas

func casillas_alternas(casilla:Vector3, id_1:int):
	#id1 debe ser 0 o 1
	var casillas = casillas_contiguas(casilla)
	return [casillas[id_1], casillas[id_1+2], casillas[id_1+4]]

func casillas_opuestas(casilla:Vector3, id_1:int):
	#id1 debe ser 0, 1 o 2
	var casillas = casillas_contiguas(casilla)
	return [casillas[id_1], casillas[id_1+3]]

func casillas_3contiguas(casilla:Vector3, id_1:int):
	var casillas = casillas_contiguas(casilla)
	return [casillas[id_1-1], casillas[id_1], casillas[id_1+1]]

func redondear_casilla(casilla:Vector3):
	var casilla_redondeada = round(casilla)
	var diferencia = abs(casilla - casilla_redondeada)
	if diferencia.x > diferencia.y and diferencia.x > diferencia.z:
		casilla_redondeada.x = - casilla_redondeada.y - casilla_redondeada.z
	elif diferencia.y > diferencia.z:
		casilla_redondeada.y = - casilla_redondeada.x - casilla_redondeada.z
	else:
		casilla_redondeada.z = - casilla_redondeada.x - casilla_redondeada.y
	return casilla_redondeada

func distancia_entre_casillas(casilla1:Vector3, casilla2:Vector3):
	var diferencia = abs(Vector3(casilla2.x-casilla1.x, casilla2.y-casilla1.y, casilla2.z-casilla1.z))
	var distancia = max(diferencia.x, diferencia.y, diferencia.z)
	return diferencia

func linea_recta_entre_casillas(casilla1:Vector3, casilla2:Vector3):
	var distancia = distancia_entre_casillas(casilla1, casilla2)
	var casillas: Array[Vector3]
	casillas.resize(distancia-1)
	for i in range(1, distancia):
		#revisar porque quiza es casillas[i-1] !!!!!!
		casillas[i] = casilla1 + redondear_casilla((casilla2 - casilla1) * 1/distancia * i)
	return casillas

func rayo_desde_casilla(casilla:Vector3, direccion:Vector3, rango:int):
	# si rango es >0 devuelve casillas hasta ese número, pero si es 0 continua hasta el final del tablero
	var casillas: Array[Vector3]
	if rango > 0:
		for i in range(1, rango):
			#revisar que exista y que no se acabe el tablero
			casillas.append(casilla + direccion * i)
	else:
		var i = 1
		while(true):	#cambiar por comprobación de obstáculo/fin de tablero
			casillas.append(casilla + direccion * i)
			i += 1
	return casillas

func linea_ininterrumpida_entre_casillas(casilla1:Vector3, casilla2:Vector3):
	#hacer la funcion xd
	pass

func encontrar_casilla_en_lista(casilla:Vector3, tablero:Array):
	#WIP hay que reworkear para que funcione con la lógica de la clase Casilla
	if casilla in tablero:
		return tablero.find(casilla)
	else:
		return false

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass
