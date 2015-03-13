f = open("2.in", "r")
n = int(f.readline()[:-1])
out = open("2.out", "w")

record = {}

def free(i, j):
	if j == 0: return 1
	if j == 1: return i-1
	if i <= j: return 0
	if (i,j) in record:
		return 1
	temp = free(i,j-1) + free(i-1,j)
	record[(i,j)] = temp
	return temp

for t in xrange(n):
	line = f.readline()[:-1]
	args = line.split('-')
	x = int(args[0])
	y = int(args[1])

	num1 = 0
	if y == 0:
		num1 = 1
	else:
		free = [[0] * (y+1) for i in xrange(x+1)]
		for i in xrange(2, x+1):
			free[i][0] = 1
			free[i][1] = i-1
		free[1][0] = 1

		for i in xrange(2, x+1):
			for j in xrange(2, min(i-1, y)+1):
				free[i][j] = (free[i-1][j] + free[i][j-1]) % 1000000007

		num1 = free[x][y]

	stress = [[0] * (y+1) for i in xrange(y+1)]

	for j in xrange(0, y+1):
		stress[0][j]=1

	for i in xrange(1, y+1):
		for j in xrange(i, y+1):
			stress[i][j] = (stress[i][j-1]+stress[i-1][j]) % 1000000007

	# print "Case #" + str(t+1) + ": " + str(num1) + " " + str(stress[y][y])
	out.write("Case #" + str(t+1) + ": " + str(num1) + " " + str(stress[y][y]) + "\n")
