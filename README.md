**NOTE: PoodleLabs is moving homes to a self-hosted GitHub alternative; these repositories have been left up for posterity, and will not be updated**

# AES Scripts

This repository contains three simple scripts for encrypting, decrypting, and shredding files in a Linux environment.

The indended usage is for adding encrypted files to append-only WORM media for archival purposes.

The scripts require powershell, `openssl`, and the `shred` command.

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

The intended purpose of the shred script is to run it on any keyfile used for repeated encryption/decryption.

## Best Practice

If you use these scripts to encrypt files, it would be a good idea to include them, preferably with the required binaries, alongside the encrypted media. A full Powershell binary isn't necessary as you can run the commands manually very easily; the scripts can serve, at a minimum, as a documentation of the encryption process used with archived media.
