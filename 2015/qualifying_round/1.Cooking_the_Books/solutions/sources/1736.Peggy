def smallest(n):
    m = n
    k = len(str(n))
    for i in xrange(k):
        for j in xrange(i, k):
            l = list(str(n))
            l[i], l[j] = l[j], l[i]
            if l[0] != '0' :
                x = int(''.join(l))
                m = min(m, x)
    return m


def largest(n):
    m = n
    k = len(str(n))
    for i in xrange(k):
        for j in xrange(i, k):
            l = list(str(n))
            l[i], l[j] = l[j], l[i]
            x = int(''.join(l))
            m = max(m, x)
    return m

for t in xrange(1, int(raw_input()) + 1):
    n = int(raw_input())
    print 'Case #{0}: {1} {2}'.format(t, smallest(n), largest(n))
