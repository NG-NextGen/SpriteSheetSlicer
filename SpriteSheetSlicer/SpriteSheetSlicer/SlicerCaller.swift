
import Foundation

func CallSlicer(pythonPath: String="/Library/Frameworks/Python.framework/Versions/3.13/bin/python3", pyFilePath:String="slicer.py", imgPath:String, outDir:String, width:Int, height:Int)
{
    let process = Process()
    process.executableURL = URL(filePath: pythonPath)
    print(URL(fileURLWithPath: #file).deletingLastPathComponent().appendingPathComponent(pyFilePath).path())
    process.arguments = [
        URL(fileURLWithPath: #file).deletingLastPathComponent().appendingPathComponent(pyFilePath).path(),
            "-path", imgPath,
            "-width", "\(width)",
            "-height", "\(height)",
            "-outDir", outDir
    ]
    do{
        try process.run()
    }
    catch
    {
        print(error)
    }
    
}
