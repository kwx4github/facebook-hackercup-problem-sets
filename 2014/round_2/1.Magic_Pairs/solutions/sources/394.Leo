T = int(raw_input())
nn = [[0]*1000000 for i in xrange(2)]
for t in range(1,T+1):
    N = map(int, raw_input().split(" "))
    x = [0,0]
    a = [0,0]
    b = [0,0]
    c = [0,0]
    r = [0,0]
    for i in range(2):
        temp = map(int, raw_input().split(" "))
        x[i] = temp[0]
        a[i] = temp[1]
        b[i] = temp[2]
        c[i] = temp[3]
        r[i] = temp[4]
    nn[0][0] = x[0]
    nn[1][0] = x[1]
    s = [set() for i in xrange(2)]
    s[0].add(x[0])
    s[1].add(x[1])
    i = 1
    while i < N[0] or i < N[1]:
        if i < N[0]:
            nn[0][i] = ((a[0] * nn[0][(i-1)%N[0]]) + (b[0] * nn[1][(i-1)%N[1]]) + c[0]) % r[0]
            s[0].add(nn[0][i])
        if i < N[1]:
            nn[1][i] = ((a[1] * nn[0][(i-1)%N[0]]) + (b[1] * nn[1][(i-1)%N[1]]) + c[1]) % r[1]
            s[1].add(nn[1][i])
        i += 1
    
    ans = 0
    nss = set()
    ee = [set() for i in xrange(2)]
    ii = [0,0]
    oss = 0
    ppp = 0
    while True:
        sss = 1 - ppp
        if len(ee[ppp]) > 0:
            if ii[sss] >= N[sss]:
                break
            nnn = nn[sss][ii[sss]]
            ii[sss] = ii[sss] + 1
            if nnn in nss or nnn in ee[sss]:
                pass
            elif nnn in ee[ppp]:
                ee[ppp].remove(nnn)
                nss.add(nnn)
            else:
                ee[sss].add(nnn)
            if len(ee[ppp]) == 0:
                ns = 1
                while ii[sss] < N[sss]:
                    nnn = nn[sss][ii[sss]]
                    if nnn in nss or nnn in ee[sss]:
                        ii[sss] = ii[sss] + 1
                        ns = ns + 1
                    else:
                        break
                if len(ee[sss]) == 0:
                    ans = ans + oss * ns
                else:
                    oss = ns
                    ppp = 1 - ppp
        else:
            if ii[ppp] >= N[ppp]:
                break
            ee[ppp].add(nn[ppp][ii[ppp]])
            ii[ppp] = ii[ppp] + 1
            oss = 1;
            while ii[ppp] < N[ppp]:
                nnn = nn[ppp][ii[ppp]]
                if nnn in nss or nnn in ee[ppp]:
                    ii[ppp] = ii[ppp] + 1
                    oss = oss + 1
                else:
                    break
    print "Case #"+str(t)+": "+str(ans)
    
