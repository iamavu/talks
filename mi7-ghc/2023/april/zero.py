#import needed libraries to make life easier
import gmpy2
from Crypto.PublicKey import RSA
from Crypto.Util.number import inverse

#read the publicKey which is .env file from the secure website
pubkey = open("publicKey", 'r')
key = RSA.importKey(pubkey.read())

#extract n and e from the public key
n = int(key.n)
e = int(key.e)

#fermat attack function
def fermat_factor(n):
    #check if the number is odd or even
    assert n % 2 != 0

    #calculate nearest integer square root of n
    a = gmpy2.isqrt(n)
    
    #calculate b by taking square of a and subtracting n
    b = gmpy2.square(a) - n

    #do the above operation until b is actually a square, iterator being a is being increased by 1
    while not gmpy2.is_square(b):
        a += 1
        b = gmpy2.square(a) - n

    #assign values of p and q
    p = a + gmpy2.isqrt(b)
    q = a - gmpy2.isqrt(b)

    #return p and q in integer form
    return int(p), int(q)

#pass the n we got above from publicKey to get the p and q, our primes
(p, q) = fermat_factor(n)

#print the p & q
print(f"p = {p}")
print(f"q = {q}")

#calculate phi to dervice d, our private key
phi = (p - 1) * (q - 1)
d = int(inverse(e, phi))

#form the private key using n, e, d
privateKey = RSA.construct((n, e, d))

#write the privateKey
id_rsa = open('privateKey', 'w')
id_rsa.write(privateKey.exportKey().decode())
id_rsa.close()