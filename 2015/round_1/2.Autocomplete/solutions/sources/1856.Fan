f = open("3.in", "r")
out = open("3.txt", "w")

def overlap(x, y):
	overlap = 0
	for i in xrange(min(len(x), len(y))):
		if x[i] == y[i]:
			overlap += 1
		else:
			break
	return overlap

t = int(f.readline()[:-1])
for count in xrange(t):
	n = int(f.readline()[:-1])
	root = ""
	total = 0
	for k in xrange(n):
		# print total

		word = f.readline()[:-1]
		node = root
		parent = None
		saved_key = ""

		if root == "":
			total += 1
			root = {word: ""}
			continue

		# import pdb; pdb.set_trace()

		while isinstance(node, dict) and (len(word) > 0):
			flag = False

			key = node.keys()
			for pre in key:
				lap = overlap(pre, word)
				if lap == 0: continue
				flag = True

				if lap == len(word):
					total += len(word)
					word = ""
				elif lap == len(pre):
					word = word[lap:]
					parent = node
					saved_key = pre
					node = node[pre]
					total += len(pre)
				else:
					temp = node.pop(pre)
					node[pre[:lap]] = {pre[lap:]:temp, word[lap:]:""}
					total += (lap + 1)
					word = ""
				break

			if (not flag):
				node[word] = ""
				total += 1
				break

		if isinstance(node, str) and (len(word) > 0):
			total += 1
			parent[saved_key] = {word: ""}

	# print root
	out.write("Case #" + str(count + 1) + ": " + str(total) + "\n")
