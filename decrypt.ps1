param(
    [Parameter(Mandatory = $true)][string]$inputFile,
    [Parameter(Mandatory = $false)][string]$keyFile
);

if (!(Test-Path -Path "~/Documents")) { 
    New-Item -Path "~/Documents" -ItemType Directory;
}
if (!(Test-Path -Path "~/Documents/decrypted")) { 
    New-Item -Path "~/Documents/decrypted" -ItemType Directory;
}

if ($keyFile -ne "") {
    openssl aes-256-cbc -kfile "$keyFile" -pbkdf2 -iter 1000000 -d -in "$inputFile" -out "$HOME/Documents/decrypted/$($inputFile.TrimStart('./').TrimEnd('.aes256cbc'))";
} else {
    openssl aes-256-cbc -pbkdf2 -iter 1000000 -d -in "$inputFile" -out "$HOME/Documents/decrypted/$($inputFile.TrimStart('./').replace('.aes256cbc', ''))";
}
