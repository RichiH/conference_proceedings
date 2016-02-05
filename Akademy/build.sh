#!/bin/sh

for i in 20{10..15}; do ./add-videos.sh $i; done
mkdir -p 2015/lower-quality
(
  cd 2015/lower-quality
  ../../add-videos.sh . http://files.kde.org/akademy/2015/videos/lower-quality/
)
