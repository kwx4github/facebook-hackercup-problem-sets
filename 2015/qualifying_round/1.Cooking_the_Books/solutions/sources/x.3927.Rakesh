t=input()
for x in xrange(t):
	n=input()
	if n==0:
		print "Case #"+str(x+1)+": 0 0"
		continue
	li=[]
	while n>=1:
		li.insert(0,n%10)
		n=n/10
	ma=0
	mi=0
	for i in xrange(len(li)):
		temp=li[i]
		if temp>li[ma]:
			ma=i
		else:
			if temp<li[mi] and temp!=0:
				mi=i
	li[0],li[ma]=li[ma],li[0]
	s1=""
	for i in li:
		s1+=str(i)
	li[ma],li[0]=li[0],li[ma]
	li[mi],li[0]=li[0],li[mi]
	s2=""
	for i in li:
		s2+=str(i)
	print "Case #"+str(x+1)+": "+s2+" "+s1