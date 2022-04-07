

# -- Exercise 2: UNBLOCK PUZZLE ------------------------------------------------
# -- author1: Jeronimo Pardo Rodriguez -  j.pardor@udc.es 
# -- author2: Maria Martinez Sotelo    -  maria.martinezs@udc.es 


import sys


row = 0
blocks = dict()



# GET DATA ---------------------------------------------------------------------


line = sys.stdin.readline().strip()
line = line.strip()
size = len(line)


while line and row < size:

    # print(f'line:{line}, {size}')

    for col in range(len(line)):
        if line[col] == '.':
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
            if col+1 < size and line[col] == line[col+1]:
                blocks[line[col]]['orientation'] = 'hor'
                blocks[line[col]]['DirN'] = row
                blocks[line[col]]['N'] = col

    line = sys.stdin.readline().strip()
    row+=1


goal = line.split("=")
blockGoal = goal[0]
locGoal = goal[1]



# PRINTING ---------------------------------------------------------------------


# Constants
print('\n% Constants')
print(f'#const size={size}.')
# print(f'#const blockGoal={blockGoal}.')
# print(f'#const locGoal={locGoal}.')


# Blocks
print('\n% Blocks')
for block in blocks:
    print(f'block({block}).')


# Initial state
print('\n% Initial state')
print('#program initial.')
for block in blocks:
    s  = blocks[block]['size']
    o  = blocks[block]['orientation']
    dn = blocks[block]['DirN']
    n  = blocks[block]['N']
    print(f'h(bl({block},{s},{o},{dn}), {n}).')


# Goal
print('\n% Goal')
print('#program final.')
print(f'goal :- h(bl({blockGoal},_,_,_), {locGoal}).')
print(':- not goal.')

# Printing
# print('\n% Printing')
# print('#show move/2.')