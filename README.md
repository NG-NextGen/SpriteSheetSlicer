# Simple-SpriteSheet-Slicer
A simple spritesheet slicer. Only able to cut without padding.

# Usage :
there are 2 cases when using this tool :
1. You are on macOs
2. Your are not on macOs

  ## For MacOs Users :
  
  for macOs users, you just have to download the repo, then open the **SpriteSheetSlicer** folder in xcode. Then just start the app and you're good to go.

  > Note that in some cases you will need to specify the python interpreter path in the **SpriteSheetSlicer/SpriteSheetSlicer/SlicerCaller.swift** file

  ## For Non MacOs Users :
  If you are not on macOs, you will not be able to run the interface. Then you juste need to download the python tool "**slicer.py**". You can find it in **SpriteSheetSlicer/SpriteSheetSlicer/slicer.py**\
  \
  To use this tool, you have to open your terminal then run the script like this : \
  `python PathToSlicer/slicer.py [-path] [-outDir] [-width] [-height]`

  if you need some explanation about the arguments, run this command : `python PathToSlicer/slicer.py --help`
