<#
    This powershell script creates a default 
    folder structure and some default files
    which I like for my techdegree projects.

    It even names the project folder using a standard
    so I do not have to think about it.
#>
Param(
    [Parameter(Mandatory=$true, HelpMessage="For which techdegree is this project?")]
    [ValidateSet("FrontendDev", "FullstackJS")]
    [string]$techdegree,
    
    [Parameter(Mandatory=$true, HelpMessage="For which unit of the degree is the project?")]
    [int]$Unit
)

function New-SubDirectory {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true)]
        [string]$RootFolder,
        [Parameter(Mandatory=$true, ValueFromPipeline=$true)]
        [string]$SubFolder
    )
    
    process {
        $CompletePath = Join-Path $RootFolder $SubFolder
        New-Item -ItemType Directory -Path $CompletePath -Force
    }
}

$UnitAsText = $Unit.ToString()
if ( $UnitAsText.Length -lt 2) {
    $UnitAsText = "0" + $UnitAsText
}

$ProjectName = "Treehouse-$techdegree-$UnitAsText"
$AllProjectsRootFolder = "C:\Projekte"
$RootFolder = Join-Path $AllProjectsRootFolder $ProjectName

New-Item -ItemType Directory -Path $RootFolder -Force
Set-Location $RootFolder
"# $ProjectName

See the results here: Github-Pages-Link (will be replaced as soon as the project is complete)

## Todos
" | Out-File "README.md"

"Documentation", "Documentation\ProvidedFiles", "Source" | 
    New-SubDirectory -RootFolder $RootFolder

