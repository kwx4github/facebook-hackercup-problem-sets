import itertools
t=input()
for x in xrange(t):
	gp,gc,gf=map(int, raw_input().split(" "))
	n=input()
	food=[]
	for f in xrange(n):
		food.append(list(raw_input().split(" ")))
	found=False
	turn=1
	while turn<=n and not found:
		for sam in itertools.combinations(food,turn):
			sp=sc=sf=0
			for each in sam:
				sp=sp+int(each[0])
				sc=sc+int(each[1])
				sf=sf+int(each[2])
			if gp==sp and gc==sc and gf==sf:
				print "Case #"+str(x+1)+": yes"
				found=True
				break
		turn+=1
	if found==False:
		print "Case #"+str(x+1)+": no"