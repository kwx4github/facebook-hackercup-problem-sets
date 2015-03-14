def solve(num):
	max = int(num)
	min = int(num)

	for i in xrange(len(num)):
		for j in xrange(i+1,len(num)):
			if i != j:
				if ((i == 0) and (num[j] == '0')): continue
				try:
					new = num[:i] + num[j] + num[i+1:j] + num[i] + num[j+1:]
				except Exception, e:
					new = num[:i] + num[j] + num[i+1:j] + num[i]

				if int(new) > max: max = int(new)
				if int(new) < min: min = int(new)
	return (min, max)

f = open("1.txt", "r")
n = int(f.readline())
count = 1
for i in xrange(n):
	s = f.readline()
	line = "Case #" + str(count) + ": "
	pair = solve(s[:-1])
	line = line + str(pair[0]) + " " + str(pair[1])
	count+=1
	print line
