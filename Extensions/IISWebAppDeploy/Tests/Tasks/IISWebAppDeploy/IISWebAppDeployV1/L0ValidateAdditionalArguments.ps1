[CmdletBinding()]
param()

. $PSScriptRoot\..\..\..\..\..\Common\lib\Initialize-Test.ps1

. $PSScriptRoot\..\..\..\..\Src\Tasks\IISWebAppDeploy\IISWebAppDeployV1\MsDeployOnTargetMachines.ps1

# Arrange

$invalidAdditionalArgumentsWithSemicolon = "echo 123 ; start notepad.exe"
$invalidAdditionalArgumentsWithAmpersand = "echo 123 & start notepad.exe"
$invalidAdditionalArgumentsWithVerticalBar = "echo 123 | start notepad.exe"

$additionalArgumentsValidationErrorMessage = "Additional arguments can't include separator characters '&', ';' and '|'. Please verify input. To learn more about argument validation, please check https://aka.ms/azdo-task-argument-validation"

# Assert

Assert-Throws {
   Get-ValidatedAdditionalArguments -msDeployCmdArgs "" -additionalArguments $invalidAdditionalArgumentsWithSemicolon
 } -Message $additionalArgumentsValidationErrorMessage
 
Assert-Throws {
   Get-ValidatedAdditionalArguments -msDeployCmdArgs "" -additionalArguments $invalidAdditionalArgumentsWithAmpersand
  } -Message $additionalArgumentsValidationErrorMessage

Assert-Throws {
   Get-ValidatedAdditionalArguments -msDeployCmdArgs "" -additionalArguments $invalidAdditionalArgumentsWithVerticalBar
 } -Message $additionalArgumentsValidationErrorMessage