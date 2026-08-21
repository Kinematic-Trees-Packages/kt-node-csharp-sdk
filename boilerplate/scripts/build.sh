#!/usr/bin/env bash
set -euo pipefail
out="${KTM_BUILD_OUTPUT:-build/ktm-output}"
rm -rf "$out"
mkdir -p "$out/compiled/dotnet/{{KTM_CREATE_MODULE_NAME}}" "$out/source"
dotnet build src/{{KTM_CREATE_MODULE_NAME}}/{{KTM_CREATE_MODULE_NAME}}.csproj -c Release
cp -a src/{{KTM_CREATE_MODULE_NAME}}/bin/Release/net8.0/. "$out/compiled/dotnet/{{KTM_CREATE_MODULE_NAME}}/"
cp -a README.md package.ktm.json scripts *.sln src examples "$out/source"/
find "$out/source" -type d \( -name bin -o -name obj \) -prune -exec rm -rf {} +
echo "Built {{KTM_CREATE_PROJECT_NAME}} C# compiled package into $out/compiled"
