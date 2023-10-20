param(
    [Parameter(Mandatory = $true)][string]$shred
);

shred "$shred";
if ($LASTEXITCODE -ne 0) {
    echo "Failed to shred $shred.";
}
else {
    rm "$shred";
}
