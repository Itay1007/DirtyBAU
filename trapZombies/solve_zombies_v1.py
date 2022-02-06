
def encrypt_ax(ax, cx=0x35, bx=0X11BF):
    ax = ax ^ 0xFAEB
    temp = ax

    for j in range(10000):
        for i in range(cx):
            ax = ax * bx
            ax = ax & 0xffff  # ax is 32 bits
            ax = ax + 0x4743
            ax = ax & 0xffff  # ax is 32 bits

        if temp & 0xfff == ax & 0xfff:
            print(f"INDEX: {j+1}")
            break

    #print(hex(ax & 0xffff))

encrypt_ax(0x317) # 00[XY] -- FF[XY]

val = 0xfaeb


def decrypt_ax(encrypted_ax, cx, bx):
    """
        reverse the encryption of ax
    """

    for i in range(cx):
        encrypted_ax = encrypted_ax - 0x4743
        encrypted_ax = encrypted_ax // bx

    print(hex(encrypted_ax & 0xffff))

    print(hex(( ((encrypted_ax & 0xFFFF) - 0x4743) // 0x11bf ) ^ 0xfaeb ))


