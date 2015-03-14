def swap_str (str_in, i, j):
    str_list = list (str_in)
    str_list[i], str_list[j] = str_list[j], str_list[i]
    return ''.join (str_list)

#input_f = open ("cooking_the_books_example_input.txt", "r")
input_f = open ("cooking_the_books.txt", "r")
output_f = open ("outpu1.txt", "w")

t = int (input_f.readline ().strip ())

for i in range (t):
    n = input_f.readline ().strip ()
    n_int = int (n)
#    print n

    n_list = list (n)
    max_d_n = max (n_list)
    idx_max_d_n = n_list.index (max_d_n)
    min_d_n = min (n_list)
    idx_min_d_n = n_list.index (min_d_n)

#    print max_d_n
#    print idx_max_d_n
#    print min_d_n
#    print idx_min_d_n

    # Mayor con Primero
    n1 = swap_str (n, 0, idx_max_d_n)

    # Menor con Primero
    n2 = swap_str (n, 0, idx_min_d_n)

    # Primero de Ultimo 
#    n3 = n[1:] + n[0]

    # Ultimo de Primero
#    n4 = n[-1] + n[0:-1]

    n_comp_list = [n, n1, n2]
#    n_comp_list = [n, n1, n2, n3, n4]
    n_comp_list = [int (n_elem) for n_elem in n_comp_list if len (str (int (n_elem))) == len (n)]
#    print n_comp_list

    max_swap = max (n_comp_list)
    min_swap = min (n_comp_list)
#    print max_swap
#    print min_swap

    output_f.write ("Case #" + str (i + 1) + ": " + str (min_swap) + " " + str (max_swap) + "\n")

input_f.close ()
output_f.close ()

#a1 = '1234'
#print a1
#print swap_str (a1, 0, 1)
#print swap_str (a1, 0, 1)
#print swap_str (a1, 1, len(a1) - 1)
#print swap_str (a1, 2, 0)
#print a1

