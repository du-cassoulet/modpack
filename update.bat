%@Try%
  git -v
%@EndTry%
:@Catch
  winget install --id Git.Git -e --source winget
:@EndCatch

if not exist ".git\" {
  git clone https://github.com/du-cassoulet/modpack.git
}


git pull