
-- Exercise 1: HITORI PUZZLE ---------------------------------------------------
-- author1: Jeronimo Pardo Rodriguez -  j.pardor@udc.es 
-- author2: Maria Martinez Sotelo    -  maria.martinezs@udc.es 


Para la ejecución de la práctica deben seguirse los siguientes pasos (tomando
como ejemplo el archivo hitori1.txt).

- Transformar el .txt en el conjunto de hechos correspondientes:
    python3 encode.py < hitori1.txt > hitori1.lp
    
- Ejecutar los archivos de clingo y generar la solución:
    clingo hitoriKB.lp hitori1.lp | python decode.py > solution1.txt