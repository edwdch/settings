# === antfu/ni ===
# https://github.com/antfu/ni#conflicts-with-powershell

if (-not (Test-Path $profile)) {
  New-Item -ItemType File -Path (Split-Path $profile) -Force -Name (Split-Path $profile -Leaf)
}

$profileEntry = 'Remove-Item Alias:ni -Force -ErrorAction Ignore'
$profileContent = Get-Content $profile
if ($profileContent -notcontains $profileEntry) {
  $profileEntry | Out-File $profile -Append -Force
}Remove-Item Alias:ni -Force -ErrorAction Ignore
Remove-Item Alias:ni -Force -ErrorAction Ignore
Remove-Item Alias:mi -Force -ErrorAction Ignore

# === antfu/ni ===

# === MY SELF ALIAS ===
Function mambaInstall { 
  Param($condaPackage) 
  mamba install -y $condaPackage 
}

Function mambaSearch { 
  Param($condaPackage)
  mamba repoquery search $condaPackage 
}

Function mambaListPackages { 
  conda list 
}

Function mambaListEnvs { 
  conda env list 
}

Function mambaActivate { 
  Param($condaEnv)
  conda activate $condaEnv
}

Function mambaDeactivate { 
  conda deactivate 
}

function mambaRemoveEnvironment {
  param (
    $mambaEnvName
  )
  mamba remove -y --all -n $mambaEnvName
}

function mambaCreateEnvironment {
  param (
    $envName,
    $packages=''
  )
  if ($packages -ne '') {
    mamba create -y --name $envName $packages
  } else {
    mamba create --name $envName
  }
}

function mambaCreateEnvByFile {
  param (
    $filename='conda.yml'
  )
  mamba env create -f $filename
}

function mambaExportPackagesToYml {
  param (
    $filename='conda.yml'
  )
  conda env export --no-builds | grep -v '^prefix: ' > $filename
}

function pipInstallUseTsinghua {
  param (
    [string]$pipPackage = '',
    [string]$r = 'requirements.txt'
  )
  if ($pipPackage -ne '') {
    pip install -i https://pypi.tuna.tsinghua.edu.cn/simple $pipPackage
  }
  else {
    pip install -i https://pypi.tuna.tsinghua.edu.cn/simple -r $r
  }
}

function pipUninstall {
  param (
    $pipPackage
  )
  pip uninstall $pipPackage -y
}

function gitCommonCommitAndPush {
  git add .
  git commit -m "chore: regular update"
  git push
}

Set-Alias -Name mi -Value mambaInstall
Set-Alias -Name ms -Value mambaSearch
Set-Alias -Name ml -Value mambaListPackages
Set-Alias -Name mle -Value mambaListEnvs
Set-Alias -Name ma -Value mambaActivate
Set-Alias -Name mda -Value mambaDeactivate
Set-Alias -Name mr -Value mambaRemoveEnvironment
Set-Alias -Name mcf -Value mambaCreateEnvByFile
Set-Alias -Name mc -Value mambaCreateEnvironment
Set-Alias -Name mt -Value mambaExportPackagesToYml

Set-Alias -Name pipi -Value pipInstallUseTsinghua
Set-Alias -Name pipu -Value pipUninstall
Set-Alias -Name gitcm -Value gitCommonCommitAndPush

Set-Alias -Name g -Value git
Set-Alias -Name vim -Value nvim

Set-Alias -Name ll -Value ls
Set-Alias -Name grep -Value findstr

# === MY SELF ALIAS ===

# === Oh-My-Posh ===
# https://ohmyposh.dev/docs/installation/windows

oh-my-posh init pwsh | Invoke-Expression
oh-my-posh init pwsh --config 'C:\Users\xinze\AppData\Local\Programs\oh-my-posh\themes\takuya.omp.json' | Invoke-Expression

# === Oh-My-Posh ===

# === inport module === 
# https://github.com/devblackops/Terminal-Icons#installation

Import-Module -Name Terminal-Icons

# === inport module === 
