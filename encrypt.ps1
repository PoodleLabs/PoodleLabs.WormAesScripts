param(
    [Parameter(Mandatory = $true)][string]$inputFile,
    [Parameter(Mandatory = $false)][string]$keyFile
);

if ($keyFile -ne "") {
    openssl aes-256-cbc -kfile "$keyFile" -pbkdf2 -iter 1000000 -e -in "$inputFile" -out "$inputFile.aes256cbc";
} else {
    openssl aes-256-cbc -pbkdf2 -iter 1000000 -e -in "$inputFile" -out "$inputFile.aes256cbc";
}

