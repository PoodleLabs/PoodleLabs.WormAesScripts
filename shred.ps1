param(
    [Parameter(Mandatory = $true)][string]$shred
);

shred "$shred";
if ($LASTEXITCODE -ne 0) {
    rm "$shred";
}
else {
    echo "Failed to shred $shred.";
}
