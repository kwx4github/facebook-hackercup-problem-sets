for t in xrange(1, int(raw_input())+1):
    # if t > 1:
    #     continue

    # gp, gc, gf
    g = tuple(map(int, raw_input().split()))
    # print 'Goal: {0}'.format(g)

    d = {}
    d[1] = []
    n = int(raw_input())
    for i in xrange(n):
        p, c, f = map(int, raw_input().split())
        d[1].append(((p, c, f), [i]))

    h = False

    if n == 1 and g == d[1][0][0]:
        h = True

    for s in xrange(2, n+1):
        d[s] = []
        for x in d[1]:
            for y in d[s-1]:
                if x[1][0] in y[1]:
                    continue
                z = (x[0][0] + y[0][0], x[0][1] + y[0][1], x[0][2] + y[0][2])
                if z == g:
                    h = True
                    break

                if all([z[i] < g[i] for i in xrange(3)]):
                    w = [i for i in y[1]]
                    w.append(x[1][0])
                    d[s].append((z, w))
            if h:
                break
        if h:
            break

    ans = 'yes' if h else 'no'
    print 'Case #{0}: {1}'.format(t, ans)