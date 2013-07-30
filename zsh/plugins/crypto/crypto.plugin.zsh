# Generate a secure password with 128 bits of entropy
alias randpass="dd if=/dev/random bs=16 count=1 2>/dev/null | base64 | sed 's/=//g'"

# Simple rot13 cipher
# (works on standard input and prints results to standard output)
alias rot13="tr '[A-Za-z]' '[N-ZA-Mn-za-m]'"

# Secure password-based encryption and decryption
# Hint: apply -a switch to further encode/decode using base64
# (works on standard input and prints results to standard output)
alias encrypt='openssl enc -aes-256-cbc -salt'
alias decrypt='openssl enc -aes-256-cbc -salt -d'
