function build {
  param (
    $fileName
  )

  xelatex -output-directory="./build" $fileName".tex"
  bibtex ./build/$fileName
  xelatex -output-directory="./build" $fileName".tex"
  xelatex -output-directory="./build" $fileName".tex"
}

function add_extra {
  param (
    $fileName
  )

  Get-Content main.tex |
  Select-Object -Skip 3 |
  Out-File $fileName -Append
}

# encoding
$PSDefaultParameterValues['*:Encoding'] = 'utf8'

# make build directory
mkdir build

# make ebook
echo "\documentclass[draft,ebook]{mcmthesis}" |
  Out-File ebook.tex
add_extra ebook.tex
build ebook
rm ebook.tex

# make draft
echo "\documentclass[draft]{mcmthesis}" |
  Out-File draft.tex
add_extra draft.tex
build draft
rm draft.tex

# make release version
echo "\documentclass{mcmthesis}" |
  Out-File release.tex
add_extra release.tex
build release
rm release.tex

Write-Host "Build sucessfully,press enter to exit. 构建成功，按下回车键退出" -ForegroundColor Green

Read-Host
