$results = "output/allure-results"

if (Test-Path $results) {
    Remove-Item -Recurse -Force $results
}

New-Item -ItemType Directory -Path $results -Force | Out-Null

robot `
    --listener "allure_robotframework:$results" `
    tests/vehicle/create_quote.robot