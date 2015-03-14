f = open('new_years_resolution.txt', 'r')
s = open('new_years_resolution_output.txt', 'w')
T = f.readline()

for i in xrange(0,int(T)):
	

	PP, CC, FF = [],[],[]
	G = map(int, (f.readline().replace('\n','')).split())
	print 'test',i+1
	print 'G',G
	GG = []
	GP,GC,GF = G[0],G[1],G[2]
	N = int(f.readline())
	count = 0
	for j in xrange(0,N):
			
		GG.append(map(int, (f.readline().replace('\n','')).split()))
			
	res = 'no'				
	for k in xrange(0,len(GG)):
		print 'k, lenGG-1',k,len(GG)-1	
		P,C,F = 0,0,0
		P+=GG[k][0]
		C+=GG[k][1]
		F+=GG[k][2]
		A = []
		print 'P,C,F',P,C,F		
		if P == GP and C == GC and F == GF:
			res = 'yes'
			break
		if res == 'yes':
			break
		else:
			l = 0
			while l <len(GG) and res == 'no':	
				count+=1
				print A
				print 'l',l
				print P,C,F				
	
				if GG[l][0] <= GP-P and GG[l][1] <= GC-C and GG[l][2] <= GF-F:

					A.append(l)
					P+=GG[l][0]
					C+=GG[l][1]
					F+=GG[l][2]
					if P == GP and C == GC and F == GF:
						res = 'yes'
						break

				if l == (len(GG)-1):

					if k == (len(GG)-1):
					 	pass 
					else:
						if len(A) != 0:
							m = A[-1]
							l = m
							P-=GG[m][0]
							C-=GG[m][1]
							F-=GG[m][2]		
				
				l+=1
	
	print res,count			
	s.write('Case #'+str(i+1)+': '+res+'\n')