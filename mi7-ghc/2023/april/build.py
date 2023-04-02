#import libraries to make life easier
import gmpy2
import random
from Crypto.Util.number import inverse
from Crypto.PublicKey import RSA

e = int(65537)

#generate p as prime number and q as the next prime number so as they are close
p = gmpy2.next_prime(random.randint(2**1023,2**1024))
q = gmpy2.next_prime(p)

#form the public key
n = int(p * q)

#calculate phi to find the private key using modular inverse function
phi = (p - 1) * (q - 1)
d = int(inverse(e, phi))

#construct and export private, public keys
privateKey = RSA.construct((n, e, d))
publicKey = RSA.construct((n, e))
privateKey.exportKey()
publicKey.exportKey()

#write the private key as id_rsa
id_rsa = open('id_rsa', 'w')
id_rsa.write(privateKey.exportKey().decode())
id_rsa.close()

#write the public key as id_rsa.pub in OpenSSH format
id_rsa_pub = open('id_rsa.pub', 'w')
id_rsa_pub.write(publicKey.exportKey(format='OpenSSH').decode())
id_rsa_pub.close()

#write the public key as .env file to secure directory
env = open('./secure/.env', 'w')
env.write(publicKey.exportKey(format='OpenSSH').decode())
env.close()

#verbose ouput to tell that everything is a-ok
print("vulnerable keys are successfully written/overwritten to current directory")