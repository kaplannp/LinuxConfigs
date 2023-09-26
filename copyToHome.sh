cd $HOME/LinuxConfigs
for configFile in Configs/.*; do
  filename=$(basename "$configFile")
  if [ "$filename" != "." ] && [ "$filename" != ".." ]
  then
    echo "cp -r Configs/$filename $HOME"
    cp -r Configs/$filename $HOME
  fi
done
