param(
    [Parameter(Mandatory = $true)][string]$inputFile,
    [Parameter(Mandatory = $false)][string]$keyFile
);

$out = "$HOME/Documents/decrypted/$($inputFile.TrimStart('./').TrimEnd('.aes256cbc'))";
$outDir = Split-Path $out -Parent;

if (!(Test-Path -Path "$outDir")) { 
    New-Item -Path "$outDir" -ItemType Directory;
}

if ($keyFile -ne "") {
    openssl aes-256-cbc -kfile "$keyFile" -pbkdf2 -iter 1000000 -d -in "$inputFile" -out "$out";
}
else {
    openssl aes-256-cbc -pbkdf2 -iter 1000000 -d -in "$inputFile" -out "$out";
}
