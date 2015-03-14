test=int(raw_input(""))
i=1
while test>0:
    a=raw_input("")
    b=a[:]
    mini,maxi,ind,ind2=a[0],b[0],0,0
    for index, w in enumerate(a):
        if w!='0' and w<mini:
            mini=w
            ind=index
        if w!='0' and w>maxi:
            maxi=w
            ind2=index
    ans1,ans2=list(a),list(b)
    ans1[ind],ans1[0]=ans1[0],ans1[ind]
    ans2[ind2],ans2[0]=ans2[0],ans2[ind2]
    print "Case #"+str(i)+": "+"".join(ans1)+" "+"".join(ans2)
    i=i+1
    test=test-1

    
