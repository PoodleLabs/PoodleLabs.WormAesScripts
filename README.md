# AES Scripts

This repository contains three simple scripts for encrypting, decrypting, and shredding files in a Linux environment.

The indended usage is for adding encrypted files to add-only WORM media for archival purposes.

The scripts require powershell, openssl, and the `shred` command.

These scripts come with absolutely no warranty, or guarantee of their suitability or functionality. Use at your own risk.

## Encryption

The following command:
`./encrypt.ps1 [PATH_TO_FILE_TO_ENCRYPT]`

Will prompt the user to enter a passphrase, verify it, then encrypt the file alongside the existing file, with a `.aes256cbc` extension appended to its name.

`./encrypt.ps1 [PATH_TO_FILE_TO_ENCRYPT] [PATH_TO_PASSPHRASE_FILE]`
 
Will read the passphrase from a file instead.

## Decryption

The following command:
`./decrypt.ps1 [PATH_TO_FILE_TO_DECRYPT]`

Will prompt the user to enter a passphrase, and decrypt the specified file to `~/Documents/decrypted`, removing any `.aes256cbc` at the end of the output filename.

`./decrypt.ps1 [PATH_TO_FILE_TO_DECRYPT] [PATH_TO_PASSPHRASE_FILE]`
 
Will read the passphrase from a file instead.

## Shred

The following command:
`./shred [PATH_TO_FILE_TO_SHRED]`

Will run the `shred` command, then `rm` the file if `shred` ran successfully.