#!/bin/bash

rm -rf ./docs \
  && mkdir ./docs \
  && git submodule init src/ \
  && git submodule update -r src/ \
  && git submodule foreach 'git pull' \
  && cd src \
  && yarn && yarn build \
  && cd .. \
  && cp -r src/public/* docs/ \
  && echo "pico.pub" > docs/CNAME \
  && touch docs/.nojekyll \
  && git add . \
  && git commit -am "automated release script, TODO: source tag" \
  && echo "done, don't forget to 'git push'"


