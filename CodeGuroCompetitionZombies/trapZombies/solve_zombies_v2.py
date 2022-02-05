def find_coefficients(n=2048 - 0x35, a=0x11BF, b=0x4743):
    n = 2048 - 0x35

    a = 0x11BF

    b = 0x4743

    a_n = 1
    s_n = 0

    for i in range(n):
        s_n += a_n
        s_n = s_n & 0xffff
        a_n *= a
        a_n = a_n & 0xffff

    p = (b * s_n) & 0xffff

    print(f"a_s:{hex(a_n)}, p:{hex(p)}")


find_coefficients(a=0x11BF, b=0x4743)
