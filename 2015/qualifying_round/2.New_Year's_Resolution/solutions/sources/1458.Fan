f = open("2.txt", "r")
out = open("2.out", "w")
k = int(f.readline())

def solve(food, desire):
	if (desire[0] == 0) and (desire[1] == 0) and (desire[2] == 0): return True
	for index, f in enumerate(food):
		if (f[0] <= desire[0]) and (f[1] <= desire[1]) and (f[2] <= desire[2]):
			newD = list(desire)
			for i in xrange(3):
				newD[i] = newD[i]-f[i]
			if solve(food[index+1:], newD):
				return True
	return False

for count in xrange(k):
	line = f.readline()[:-1]

	desire = line.split(' ')
	def trans(x): return int(x)
	desire = map(trans, desire)

	n = int(f.readline())

	food = []
	for i in xrange(n):
		line = f.readline()[:-1]
		line = line.split(' ')
		line = map(trans, line)
		if (line[0] <= desire[0]) and (line[1] <= desire[1]) and (line[2] <= desire[2]):
			food.append(line)

	line = "Case #" + str(count+1) + ": "
	if solve(food, desire):
		line = line + "yes"
	else:
		line = line + "no"

	out.write(line + '\n')