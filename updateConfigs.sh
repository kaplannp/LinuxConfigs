cd $HOME/LinuxConfigs
for configFile in Configs/.*; do
  filename=$(basename "$configFile")
  if [ "$filename" != "." ] && [ "$filename" != ".." ]
  then
    echo "cp -r $HOME/$filename Configs"
    cp -r $HOME/$filename Configs
  fi
done
