PLUGINS_FOLDER=$HOME/Library/Application\ Support/com.bohemiancoding.sketch3/Plugins

sketch=(
  sketch
  sketch-toolbox
  zeplin
)

brew cask install ${sketch[@]}

brew cask cleanup

# Install Sketch plugins
mkdir -p temp; cd ./temp

# Move It
curl -L https://github.com/dawidw/move-it/archive/master.zip > MoveIt.zip; unzip MoveIt.zip
# Sort Me
curl -L https://github.com/romashamin/sort-me-sketch/archive/master.zip > SortMe.zip; unzip SortMe.zip
# Zeplin
curl -L https://github.com/zeplin/zeplin-sketch-plugin/archive/develop.zip > Zeplin.zip; unzip Zeplin.zip
# Craft
wget https://s3.amazonaws.com/www-assets.invisionapp.com/labs/craft/manager/CraftInstaller.zip; unzip CraftInstaller.zip;

# Copy plugins
mkdir -p "$PLUGINS_FOLDER"
cp -R move-it-master/MoveIt.sketchplugin "$PLUGINS_FOLDER/MoveIt.sketchplugin"
cp -R sort-me-sketch-master/Sort-Me.sketchplugin "$PLUGINS_FOLDER/Sort-Me.sketchplugin"
cp -R zeplin-sketch-plugin-develop/Zeplin.sketchplugin "$PLUGINS_FOLDER/Zeplin.sketchplugin"

cd ..; rm -r ./temp
