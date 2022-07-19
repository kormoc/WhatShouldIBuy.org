#!/bin/sh

open /Applications/Safari.app/ "http://localhost:4000/"

docker run -it --rm \
    -v "$PWD":/srv/jekyll \
    -p "4000:4000" \
    -e JEKYLL_GITHUB_TOKEN=$HOMEBREW_GITHUB_API_TOKEN \
    jekyll/jekyll:pages \
    jekyll serve
