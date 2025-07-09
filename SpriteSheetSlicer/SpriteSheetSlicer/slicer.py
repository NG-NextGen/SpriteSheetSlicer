from PIL import Image
import argparse

parser = argparse.ArgumentParser()

parser.add_argument("-path", help="Path to the sprisheet to slice\n")
parser.add_argument("-width", type=int, help="Width of each sprite\n")
parser.add_argument("-height", type=int, help="Height of each sprite\n")
parser.add_argument("-outDir", help="Path to the output directory\n")


def SplitSheet(imgPath: str, spriteW:int, spriteH:int, outDir:str):
    img=Image.open(imgPath)
    imgSize = (img.width, img.height)
    n=0
    try:
        for column in range(0, imgSize[1], spriteH):
            for row in range(0, imgSize[0], spriteW):
                print(f"Cropping Image at x={row}, y={column}")
                n+=1
                tempImg=img.crop((row, column, row+spriteW, column+spriteH))
                tempImg.save(f"{outDir}/sprite{n}.png")
    except Exception as e:
        print(f"Error at iteration {n} : ", e)
        quit()


args=parser.parse_args()

SplitSheet(args.path, args.width, args.height, args.outDir)
print("\npath : ", args.path)
print("Sprites width : ",args.width)
print("Sprites Height : ",args.height)
print("Output Directory : ", args.outDir)
print("Sprite Sheet Sliced ! And Saved Successfully")