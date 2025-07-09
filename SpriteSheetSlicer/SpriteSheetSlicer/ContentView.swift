//
//  ContentView.swift
//  SpriteSheetSlicer
//
//  Created by Noah Nhav on 08/07/2025.
//

import SwiftUI
import AppKit

struct ContentView: View {
    @State var dirField: String = ""
    @State var imgField : String = ""
    @State var width: Int = 0
    @State var height: Int = 0
    @State var selectionError: Bool = false
    var body: some View {
        VStack
        {
            Section("Files") {
                VStack
                {
                    Divider()
                    VStack {
                        HStack
                        {
                            
                            TextField("Output Directory", text: $dirField)
                            Button {
                                if let url = AskDir()
                                {
                                    dirField = url.path()
                                }
                            } label: {
                                Text("Choose Directory")
                            }
                        }
                        .padding()
                        if selectionError
                        {
                            HStack {
                                Text("Please select a Directory")
                                    .foregroundStyle(.red)
                                    .padding([.leading])
                                Spacer()
                            }
                            
                                
                        }
                    }
                    VStack {
                        HStack
                        {
                            TextField("Spritesheet Path", text: $imgField)
                            Button {
                                if let url = AskFile()
                                {
                                    imgField = url.path()
                                }
                            } label: {
                                Text("Chose SpriteSheet")
                            }
                            
                        }
                        .padding()
                        if selectionError
                        {
                            HStack {
                                Text("Please select an Image")
                                    .foregroundStyle(.red)
                                    .padding([.leading])
                                Spacer()
                            }
                            
                                
                        }
                    }
                }
                
                
            }
            .padding([.top, .leading, .trailing])
            Section("Dimension")
            {
                Divider()
                VStack {
                    Stepper(value: Binding(get: {
                        width
                    }, set: { newValue in
                        width = abs(newValue)
                    })) {
                        HStack
                        {
                            Text("Sprites Width(px) :")
                            TextField("", text: Binding(get: {
                                "\(width)"
                            }, set: { newValue in
                                width = abs(Int(newValue) ?? 0)
                            }))
                            .frame(maxWidth: 100)
                        }
                    }
                    .padding()
                    if selectionError
                    {
                        HStack {
                            Text("Please select a non zero width")
                                .foregroundStyle(.red)
                                .padding([.leading])
                        }
                            
                    }
                }
                VStack {
                    Stepper(value: Binding(get: {
                        height
                    }, set: { newValue in
                        height = abs(newValue)
                    })) {
                        HStack
                        {
                            Text("Sprites Height(px) :")
                            TextField("", text: Binding(get: {
                                "\(height)"
                            }, set: { newValue in
                                height = abs(Int(newValue) ?? 0)
                                print(height, type(of: height))
                            }))
                            .frame(maxWidth: 100)
                        }
                        
                    }
                    .padding()
                    if selectionError
                    {
                        HStack {
                            Text("Please select a non zero Height")
                                .foregroundStyle(.red)
                                .padding([.leading])
                        }
                        
                            
                    }
                    
                }
                
            }
            .padding([.top, .leading, .trailing])
            Divider()
            Button {
                if width > 0 && height > 0 && dirField != "" && imgField != ""
                {
                    selectionError = false
                    CallSlicer(imgPath: imgField, outDir: dirField, width: width, height: height)
                }
                else
                {
                    withAnimation(.easeIn(duration: 0.1)) {
                        selectionError = true
                    }
                }
                
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundStyle(.indigo)
                    Text("Slice")
                        .padding()
                }
                .frame(maxWidth: 200, maxHeight: 50)
            }
            .buttonStyle(.plain)
            .padding([.top, .leading, .trailing])

        }
        .padding()
    }
    func AskDir() -> URL?
    {
        let panel = NSOpenPanel()
        panel.canChooseFiles=false
        panel.allowsMultipleSelection=false
        panel.canChooseDirectories=true
        panel.canCreateDirectories=true
        
        panel.runModal()
        return panel.urls.first ?? nil
    }
    func AskFile() -> URL?
    {
        let panel = NSOpenPanel()
        panel.canChooseFiles=true
        panel.allowsMultipleSelection=false
        panel.canChooseDirectories=false
        
        panel.allowedContentTypes = [.jpeg, .png, .icns, .ico, .svg]
        
        panel.runModal()
        return panel.urls.first ?? nil
    }
}

#Preview {
    ContentView()
}
