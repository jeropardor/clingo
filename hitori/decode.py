
# -- Exercise 1: HITORI PUZZLE -------------------------------------------------
# -- author1: Jeronimo Pardo Rodriguez -  j.pardor@udc.es 
# -- author2: Maria Martinez Sotelo    -  maria.martinezs@udc.es 


import sys, re


# format:
#   cell(X,Y,D)
#   type(X,Y,B)

# search symbols
symbols = []
for line in sys.stdin:
    if line.startswith('cell') or line.startswith('type'): symbols = line.split(' ')

# no symbols found
if symbols == []:
    print('error: no solution found')
    exit()


#vars
mx = [] # matrix with all values
newRow = []

# construct matrix
for i in range(len(symbols)):
    sym = re.split('[(),\s]', symbols[i])

    if sym[0] == 'cell':
        if sym[1] == '0' and i != 0:
            mx.append(newRow)
            newRow = []
        newRow.append(sym[3])
        
    elif sym[0] == 'type':
        if i != 0 and symbols[i-1].startswith('cell'): mx.append(newRow)
        if sym[3] == 'black':
            mx[int(sym[2])][int(sym[1])] = '*'

    
# print matrix
for line in mx: print (''.join(map(str, line)))
