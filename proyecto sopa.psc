Algoritmo Proyecto
    Definir contador, contadorpromax, cantidad, opc Como Entero
    contador <- 0
    contadorpromax <- 0
    cantidad <- 0
	Dimension letras[27]
    Definir abc Como Caracter
	abc <- "abcdefghijklmnñopqrstuvwxyz"
	alfabeto <- Longitud(abc)
	para i <- 1 Hasta alfabeto Con Paso 1 Hacer
		letras[i] = Subcadena(abc , i , i)
		
	FinPara

    Escribir "Ingrese cuántas palabras desea que tenga la sopa de letras:"
    Leer cantidad
    Borrar Pantalla
    
    Escribir "¿Cómo desea que se muestren las palabras en la sopa de letras? MAYUSCULAS (1) o minúsculas (2)"
    Leer opc 
    Borrar Pantalla
    
    Dimension palabras[cantidad, 100]  // Palabras de máximo 100 caracteres
    para i <- 1 Hasta cantidad Hacer
        para j <- 1 Hasta 100 Hacer
            palabras[i, j] <- " " // Inicializar la matriz de palabras
        FinPara
    FinPara
    
    palabraMasLarga <- "" // Variable para almacenar la palabra más larga
    
    para i <- 1 Hasta cantidad Hacer
        Escribir "Escriba la palabra ", i, ":"
        Leer palabra
        longitudi <- Longitud(palabra)
        
        para j <- 1 Hasta longitudi Hacer
            caracter <- Subcadena(palabra, j, j)
            si caracter <> " " Entonces
                contador <- contador + 1 // Contar caracteres no vacíos en la palabra
            FinSi
        FinPara
        
        si Longitud(palabra) > Longitud(palabraMasLarga) Entonces
            palabraMasLarga <- palabra
        FinSi
        
        contadorpromax <- 0 // Reiniciar contadorpromax para la palabra actual
        
        para k <- 1 Hasta longitudi Hacer
            si Subcadena(palabra, k, k) <> " " Entonces
                contadorpromax <- contadorpromax + 1 // Contar caracteres no vacíos en la palabra para contadorpromax
            FinSi
            palabras[i, k] <- Subcadena(palabra, k, k) // Almacenar la palabra letra por letra
        FinPara
        
        Borrar Pantalla
        contador <- 0 // Reiniciar contador para la siguiente palabra
    FinPara
    
    Dimension sopa[(contadorpromax*contadorpromax), (contadorpromax*contadorpromax)] // Dimensionar la sopa de letras
	
	
	
	para i<- 1 Hasta contadorpromax Hacer
		para j <- 1 Hasta contadorpromax Hacer
			sopa[i,j] <- "*"
		FinPara
	FinPara
	palabraactual <- 0
	contador <- 0
	Repetir
		espacioSuficiente <- Falso
		longitudPalabra <- 0 // Inicializar la longitud de la palabra
		// Calcular longitud de la palabra en la fila i de la matriz palabras
		para i<- 1 Hasta cantidad Hacer
			para  j <- 1 Hasta 100 Hacer
				si palabras[i, j] <> " " Entonces
					longitudPalabra <- longitudPalabra + 1 // Incrementar la longitud si la letra no es un espacio en blanco
				FinSi
			FinPara
		FinPara
		si palabraactual <= cantidad Entonces
			palabraactual <- palabraactual + 1
		SiNo
			palabraactual <- palabraactual - 1
		FinSi
		colocar <- 3
		//caso 3 fallo bucle inf, 
		segun colocar Hacer
			
			caso 1: //ordenamiento vertical
				
				para palabraActual <- 1 Hasta cantidad Hacer
					
					espacioSuficiente <- Verdadero
					columnaAleatoria = aleatorio(1, contadorpromax)
					
					repetir
						
						longitudo <- 0    
						para i <- 1 hasta 100 hacer
							si palabras[palabraActual,i] <> " "  
								longitudo <- longitudo + 1
							fin si
						fin para
						
						espacioArriba <- Verdadero
						para k <- columnaAleatoria-1 hasta 1
							si k >= 1 y sopa[k,palabraActual] <> "*"  
								espacioArriba <- Falso
							fin si 
						fin para
						
						espacioAbajo <- Verdadero
						para k <- columnaAleatoria+longitudo hasta contadorpromax 
							si k <= contadorpromax y sopa[k,palabraActual] <> "*"
								espacioAbajo <- Falso 
							fin si
						fin para
						
						si (espacioArriba = Verdadero y espacioAbajo = Verdadero) Entonces
							posicionActual <- columnaAleatoria 
							
							para j <- 1 hasta longitudo Hacer
								
								si posicionActual <= contadorpromax Entonces
									
									sopa[posicionActual,palabraActual] <- palabras[palabraActual,j]  
									posicionActual <- posicionActual + 1
									
								FinSi
								
							fin para
							
							si posicionActual < columnaAleatoria + longitudo Entonces
								
								para j <- posicionActual hasta columnaAleatoria+longitudo Hacer  
									sopa[j, palabraActual] <- " "  
								fin para 
								
							FinSi
							
							espacioSuficiente <- Verdadero
							
						Sino 
							//nueva columna aleatoria  
						FinSi
						
					hasta que espacioSuficiente == Verdadero
					
					columnaAleatoria = 0
					espacioArriba <- Falso
					espacioAbajo <- Falso
					longitudo <- 0
					si espacioSuficiente Entonces
						contador <- contador + 1 // Avanzar al siguiente intento
					FinSi
				FinPara
				
				
				
			caso 2: //ordenamiento horizontal
				
				
				para palabraActual <- 1 hasta cantidad Hacer
					
					filaAleatoria = aleatorio(1, contadorpromax)  
					espacioSuficiente <- Falso
					
					repetir
						
						longitudo <- 0
						para i <- 1 hasta 100 hacer  
							si palabras[palabraActual,i] <> " "  
								longitudo <- longitudo + 1 
							fin si
						fin para
						
						espacioIzquierda <- Verdadero
						para k <- filaAleatoria-1 hasta 1
							si k >= 1 y sopa[palabraActual,k] <> "*"
								espacioIzquierda <- Falso
							fin si  
						fin para
						
						espacioDerecha <- Verdadero 
						para k <- filaAleatoria+longitudo hasta contadorpromax
							si k <= contadorpromax y sopa[palabraActual,k] <> "*"
								espacioDerecha <- Falso
							fin si
						fin para
						
						si espacioIzquierda = Verdadero y espacioDerecha = Verdadero Entonces
							
							para j <- 1 hasta longitudo Hacer
								sopa[palabraActual,filaAleatoria+j-1] <- palabras[palabraActual,j] 
							fin para
							
							espacioSuficiente <- Verdadero
							
						Sino
							//nueva fila aleatoria
						FinSi 
						
					hasta que espacioSuficiente = Verdadero
					
					columnaAleatoria = 0
					espacioArriba <- Falso
					espacioAbajo <- Falso
					longitudo <- 0
					si espacioSuficiente Entonces
						contador <- contador + 1 // Avanzar al siguiente intento
					FinSi
					
				FinPara  
				
			caso 3: //ordenamiento diagonal
				
				
				para palabraActual <- 1 hasta cantidad Hacer 
					
					posicionInicial <- aleatorio(1, contadorpromax)
					espacioSuficiente <- Falso
					contIteraciones = 0 
					Escribir "Palabra actual: " , palabras[palabraActual,palabraActual]
					repetir
						longitudo <- 0
						para i <- 1 hasta 100 hacer
							si palabras[palabraActual,i] <> " " 
								longitudo <- longitudo + 1
							fin si
						fin para
						
						espacioDiag1 <- Verdadero 
						para k <- posicionInicial-1 hasta 1  
							si (k >= 1) y (sopa[k,k] <> "*")  
								espacioDiag1 <- Falso
							fin si
						fin para
						
						espacioDiag2 <- Verdadero
						para k <- posicionInicial+longitudo hasta contadorpromax 
							si (k <= contadorpromax) y (sopa[k,k] <> "*")
								espacioDiag2 <- Falso  
							fin si 
						fin para
						
						si espacioDiag1 y espacioDiag2 Entonces
							
							espacioSuficiente <- Verdadero 
							para j <- 1 hasta longitudo Hacer
								sopa[posicionInicial+j-1, posicionInicial+j-1] <- palabras[palabraActual,j]
							fin para
						FinSi
						contIteraciones = contIteraciones + 1  
						Escribir "Iteraciones:", contIteraciones
					hasta que espacioSuficiente == Verdadero
					
					columnaAleatoria = 0
					espacioArriba <- Falso
					espacioAbajo <- Falso
					longitudo <- 0
					si espacioSuficiente Entonces
						contador <- contador + 1 // Avanzar al siguiente intento
					FinSi
				FinPara
				
			caso 4: //ordenamiento vertical inverso
				
				para palabraActual <- 1 hasta cantidad Hacer
					
					columnaInicial <- aleatorio(1,contadorpromax)
					espacioSuficiente <- Falso 
					
					repetir
						longitudo <- 0
						para i <- 1 hasta 100 hacer
							si palabras[palabraActual,i] <> " " 
								longitudo <- longitudo + 1
							fin si
						fin para
						
						espacioArriba <- Verdadero
						para k <- columnaInicial-longitudo hasta 1
							si k >= 1 y sopa[k,palabraActual] <> "*"
								espacioArriba <- Falso
							fin si
						fin para
						
						espacioAbajo <- Verdadero  
						para k <- columnaInicial+1 hasta contadorpromax
							si k <= contadorpromax y sopa[k,palabraActual] <> "*"
								espacioAbajo <- Falso   
							fin si
						fin para
						
						si espacioArriba = Verdadero y espacioAbajo = Verdadero Entonces
							
							para j <- longitudo hasta 1 con paso -1 Hacer
								pos <- columnaInicial - j
								
								si pos >= 1 Entonces
									sopa[pos,palabraActual] <- palabras[palabraActual,j]  
								FinSi
							fin para
							
							espacioSuficiente <- Verdadero
							
						Sino
							// nueva columna inicial  
						FinSi  
						
					hasta que espacioSuficiente == Verdadero
					
					columnaAleatoria = 0
					espacioArriba <- Falso
					espacioAbajo <- Falso
					longitudo <- 0
					si espacioSuficiente Entonces
						contador <- contador + 1 // Avanzar al siguiente intento
					FinSi
					
				FinPara
				
			caso 5: //ordenamiento horizontal inverso
				
				para palabraActual <- 1 hasta cantidad Hacer
					
					filaInicial <- aleatorio(1,contadorpromax)
					espacioSuficiente <- Falso 
					
					repetir
						longitudo <- 0
						para i <- 1 hasta 100 hacer
							si palabras[palabraActual,i] <> " " 
								longitudo <- longitudo + 1
							fin si
						fin para
						
						espacioIzquierda <- Verdadero
						para k <- filaInicial-longitudo hasta 1  
							si k >= 1 y sopa[palabraActual,k] <> "*"
								espacioIzquierda <- Falso
							fin si  
						fin para
						
						espacioDerecha <- Verdadero
						para k <- filaInicial+1 hasta contadorpromax
							si k <= contadorpromax y sopa[palabraActual,k]  <> "*"
								espacioDerecha <- Falso  
							fin si
						fin para
						
						si espacioIzquierda = Verdadero y espacioDerecha = Verdadero Entonces
							
							para j <- longitudo hasta 1 con paso -1 Hacer
								pos = filaInicial - j
								
								si pos >= 1 Entonces
									
									sopa[palabraActual, pos] <- palabras[palabraActual, j] 
									
								FinSi
							fin para
							
							espacioSuficiente <- Verdadero 
							
						Sino  
							// nueva fila inicial
						FinSi     
						
					hasta que espacioSuficiente == Verdadero
					
					columnaAleatoria = 0
					espacioArriba <- Falso
					espacioAbajo <- Falso
					longitudo <- 0
					si espacioSuficiente Entonces
						contador <- contador + 1 // Avanzar al siguiente intento
					FinSi
					
				FinPara
				
			caso 6: //ordenamiento diagonal inverso
				
				
				para palabraActual <- 1 hasta cantidad Hacer
					
					posicionInicial <- aleatorio(1, contadorpromax)  
					espacioSuficiente <- Falso
					
					repetir 
						longitudo <- 0
						para i <- 1 hasta 100 hacer
							si palabras[palabraActual,i] <> " " 
								longitudo <- longitudo + 1
							fin si
						fin para
						
						espacioDiagInverso <- Verdadero   
						para k <- posicionInicial+longitudo hasta contadorpromax  
							si k <= contadorpromax y sopa[k,k] <> "*"  
								espacioDiagInverso <- Falso
							fin si
						fin para
						
						si espacioDiagInverso = Verdadero Entonces
							
							para j <- longitudo hasta 1 con paso -1 Hacer
								pos = posicionInicial + j
								
								si pos >= 1 y pos <= contadorpromax Entonces
									
									sopa[pos, pos] <- palabras[palabraActual, longitudo - j + 1]
									
								FinSi
							fin para
							
							espacioSuficiente <- Verdadero
							
						Sino
							// nueva posicion inicial  
						FinSi  
						
					hasta que espacioSuficiente = Verdadero
					
					columnaAleatoria = 0
					espacioArriba <- Falso
					espacioAbajo <- Falso
					longitudo <- 0
					si espacioSuficiente Entonces
						contador <- contador + 1 // Avanzar al siguiente intento
					FinSi
					
				FinPara
				
		FinSegun
	Hasta Que contador = cantidad 
	
	//para i <- 1 Hasta contadorpromax Hacer
	//	para j <- 1 Hasta contadorpromax Hacer
		//	si sopa[i,j] = "*" Entonces
			//	sopa[i,j] <- letras[Aleatorio(1,27)]
			//FinSi
		//FinPara
		
		
	//FinPara
	
	para i <- 1 Hasta contadorpromax Hacer
		para j <- 1 Hasta contadorpromax Hacer
			Escribir Sin Saltar sopa[i, j], " "
		FinPara
		Escribir ""
	FinPara
FinAlgoritmo