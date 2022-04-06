
# -- Exercise 1: HITORI PUZZLE -------------------------------------------------
# -- author1: Jeronimo Pardo Rodriguez -  j.pardor@udc.es 
# -- author2: Maria Martinez Sotelo    -  maria.martinezs@udc.es 


import sys

row = 0
line = sys.stdin.readline()
line = line.strip()
size = len(line)


print(f'#const n={size-1}.')

while line:
    for col in range(size): print(f'cell({col},{row},{line[col]}). ', end='')
    print('')
    line = sys.stdin.readline()
    row+=1

