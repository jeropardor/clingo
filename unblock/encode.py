

# -- Exercise 2: UNBLOCK PUZZLE ------------------------------------------------
# -- author1: Jeronimo Pardo Rodriguez -  j.pardor@udc.es 
# -- author2: Maria Martinez Sotelo    -  maria.martinezs@udc.es 


import sys


row = 0
line = sys.stdin.readline()
line = line.strip()
size = len(line)
blocks = {}

""" print(f'#const size={size-1}.') # n: 0..n

while line:

    for col in range(size):
        if line[col] == '-':
            continue
            
        if line[col] in blocks:
            blocks[line[col]]['size'] += 1

        else:
            blocks[line[col]] = {
                'size':0,
                'orientation':'ver',
                'DirN':col,
                'N':row
            }
            if line[col] == line[col+1]:
                blocks[line[col]]['orientation'] = 'hor'
                blocks[line[col]]['DirN'] = row
                blocks[line[col]]['N'] = col



    line = sys.stdin.readline()
    row+=1
 """


while line:
    print('line:' + row)
    line = sys.stdin.readline()
    row+=1

