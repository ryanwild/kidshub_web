#!/usr/bin/env bash

set -euo pipefail

if [ "$(git branch --show-current)" = "main" ] && [ -z "$(git status --porcelain)" ]; then
  echo "Branch is main and working tree is clean."
else
  echo "Branch is not main or working tree has changes."
  exit 1
fi

frontend_path="$(dirname "$(realpath "$0")")"
$(cd "$frontend_path" && ./build-css.sh && zola build --base-url "https://ryanwild.github.io/kidshub_web/")

git add "$frontend_path/public"
git commit -m "Deployment: $(git rev-parse --verify HEAD)"
git push origin

# git switch main
git subtree split --prefix "frontend/public" -b gh-pages # create a local gh-pages branch containing the splitted output folder
git push -f origin gh-pages:gh-pages                     # force the push of the gh-pages branch to the remote gh-pages branch at origin
git branch -D gh-pages                                   # delete the local gh-pages because you will need it: ref
