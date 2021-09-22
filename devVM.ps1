Configuration devVM
{
    Import-DscResource -ModuleName cChoco

    Node 'localhost' {

        cChocoInstaller installChoco
        {
            InstallDir = 'C:\choco'
        }

        cChocoPackageInstaller vscode
        {
            Name     = 'vscode'
            Ensure   = 'Present'
            Version  = '1.60.1'
            DependsOn = '[cChocoInstaller]installChoco'
        }
        cChocoPackageInstaller notepadplusplus
        {
            Name     = 'notepadplusplus'
            Ensure   = 'Present'
            Version  = '8.1.4'
        }
    }
}