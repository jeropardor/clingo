
-- Exercise 2: UNBLOCK PUZZLE --------------------------------------------------
-- author1: Jeronimo Pardo Rodriguez -  j.pardor@udc.es 
-- author2: Maria Martinez Sotelo    -  maria.martinezs@udc.es 


Para la ejecución de la práctica deben seguirse los mismos pasos que en la 
explicación del enunciado, tomandocomo ejemplo el archivo levelXX.txt:

1. Transformar el .txt en el conjunto de hechos correspondientes:
    python3 encode.py < levelXX.txt > levelXX.lp
    
2. Ejecutar los archivos de clingo y generar la solución:
    telingo --verbose=0 --warn none unblock.lp levelXX.lp > solXX.txt