
Write-Host 'Scarico il file della password segreta in passwordsegreta.txt';
$output = "$PSScriptRoot\passwordsegreta.txt"


Invoke-WebRequest -Uri https://informazioniimportanti.000webhostapp.com/importante.txt -OutFile $output

Write-Host 'ok';

Write-Host 'Queste informazioni sono molto sensitive per questo è necessario fare un collegamento con un sito molto importante hostato su 000webhost come tutti i siti importanti';

$passinput = Read-Host ' inserisci la password diocane non mi fare incazzare';

$md5 = new-object -TypeName System.Security.Cryptography.MD5CryptoServiceProvider
$utf8 = new-object -TypeName System.Text.UTF8Encoding
$hash = [System.BitConverter]::ToString($md5.ComputeHash($utf8.GetBytes($passinput)))
$hash = $hash.ToLower() -replace '-', ''


Write-Output $hash

$Body = @{
    utente = 'civi'
    pwd = $hash
}

$postParams = @{utente='me';pwd='qwerty'}


$R = Invoke-WebRequest -URI https://informazioniimportanti.000webhostapp.com/info.php -Method 'POST' -Body $Body
Write-Output "output"
Write-Output $R.content

Write-Host -NoNewLine 'Press any key to continue...';
$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');